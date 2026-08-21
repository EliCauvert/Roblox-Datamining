local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local myCreationsSessionListPollingIntervalSeconds = game:DefineFastInt("MyCreationsSessionListPollingIntervalSeconds", 60)
local foundationModule = require(parent.Foundation)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local badge = foundationModule.Badge
local privacyType = universeConfigurationModule.PrivacyType
local list = foundationModule.List
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local buildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local contentMaturityUtilsModule = require(script.Parent.Parent.Parent.utils.ContentMaturityUtils)
local matchesSearchQueryModule = require(script.Parent.Parent.Parent.utils.matchesSearchQuery)
local chatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Parent.Parent.Stores.GetBuildExperienceRefreshStore)
local getSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(script.Parent.Parent.Parent.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildExperienceMyCreationsUseAudiencesModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseAudiences)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceStableMyCreationsListItemsModule = require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var26 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
local useSignalState = signalsReactModule.useSignalState
local t = {}
local t_1 = {
	waiting_on_client = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
	idle = localizationStringsModule.MY_CREATIONS_READY,
	working = localizationStringsModule.MY_CREATIONS_BUILDING
}
local t_2 = {
	private = localizationStringsModule.MY_CREATIONS_PRIVATE,
	["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
	publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
	restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
}

local function _(p0) --[[ line: 124 | named "thumbForUniverseId" ]]
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p0)
end

local function privacyLabelForSummary(p1, p2, p3) --[[ line: 128 ]]
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref)
	local var36 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var36 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then p3.publiclyUnavailable elseif var36 == privacyType.Public then p3["public"] elseif var36 == privacyType.FriendsOnly then p3.restricted else p3.private
	end
end

local _ = function(p4, p5) --[[ line: 158 | named "descriptionForSessionStatus" ]]
	local roblox = p4._meta and p4._meta._roblox
	local var38 = if roblox then roblox.sessionStatus else nil
	
	return if var38 == nil then nil else p5[var38]
end

local function requestHandleToPromise(p6) --[[ line: 167 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p7, p8) --[[ line: 168 ]]
		-- upvalues: p6 (ref)
		task.spawn(function() --[[ line: 169 ]]
			-- upvalues: p6 (copy), p7 (ref), p8 (ref)
			while p6.state(false).status == "pending" do
				task.wait()
			end
			local var39 = p6.state(false)
			
			if var39.status == "succeeded" then
				p7(var39.result)
				
				return
			end
			p8(var39.error)
		end)
	end)
end

local _ = function(p9) --[[ line: 184 | named "getSessionUniverseId" ]]
	local roblox = p9._meta and p9._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p10, p11, p12) --[[ line: 196 ]]
	-- upvalues: privacyLabelForSummary (ref)
	local t = {}
	
	for i, v in p10 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local creatorName = v.creatorName
			t[i] = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil,
				visibilityLabel = privacyLabelForSummary(v, p11[i], p12),
				gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			}
		end
	end
	return t
end

local function buildSessionItems(p13, p14, p15, p16) --[[ line: 223 ]]
	-- upvalues: localizationStringsModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p13 do
		local var45
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var45 = nil
		else
			local universeId = roblox.universeId
			var45 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var45 ~= nil and not t[var45]) then
			t[var45] = true
			local var46 = if p14 then p14[var45] else nil
			local t_2 = {
				sessionId = sessionId,
				universeId = var45,
				placeId = if var46 then var46.placeId else nil,
				experienceName = if var46 then var46.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var45),
				creatorName = if var46 then var46.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var49 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var49 == nil then nil else p15[var49]
			t_2.visibilityLabel = if var46 then var46.visibilityLabel else p16.private
			t_2.gameIcon = if var46 then var46.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var45)
			table.insert(t_1, t_2)
		end
	end
	return t_1
end

local function renderLoadingExperienceSkeleton(p17, p18, p19) --[[ line: 262 ]]
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = p18,
		Size = UDim2.new(1, 0, 0, p19.Size.Size_2000),
		testId = `MyCreationsTab.LoadingSkeleton.{p17}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p19.Size.Size_1400, p19.Size.Size_1400)
		}, {
			Thumbnail = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p19.Size.Size_400),
				radius = radius.Small
			}),
			Description = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p19.Size.Size_250),
				radius = radius.Small
			})
		})
	})
end

local var35 = reactModule.memo(function(p20) --[[ line: 300 | named "ExperienceListItem" ]]
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p20.LayoutOrder,
		leading = reactModule.useMemo(function() --[[ line: 301 ]]
			-- upvalues: p20 (ref)
			return { type = nil, iconVariant = nil, iconName = p20.gameIcon }
		end, { p20.gameIcon }),
		title = p20.experienceName,
		description = p20.description,
		testId = `MyCreationsTab.ExperienceRow.{p20.universeId}`,
		onActivated = reactModule.useCallback(function() --[[ line: 309 ]]
			-- upvalues: p20 (ref)
			p20.onOpenChat({
				universeId = p20.universeId,
				placeId = p20.placeId,
				sessionId = p20.sessionId,
				experienceName = p20.experienceName,
				creatorName = p20.creatorName,
				gameIcon = p20.gameIcon
			})
		end, {
			p20.creatorName, p20.experienceName, p20.gameIcon, p20.onOpenChat, p20.placeId,
			p20.sessionId, p20.universeId
		}),
		trailing = reactModule.useMemo(function() --[[ line: 329 ]]
			-- upvalues: p20 (ref), reactModule (copy), view (copy), badge (copy), badgeShape (copy), badgeSize (copy), badgeVariant (copy)
			return if p20.visibilityLabel == nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(badge, {
					text = p20.visibilityLabel,
					shape = badgeShape.Box,
					size = badgeSize.Small,
					variant = badgeVariant.Neutral,
					testId = `MyCreationsTab.VisibilityBadge.{p20.universeId}`
				})
			})
		end, { p20.universeId, p20.visibilityLabel })
	})
end)

return function(p21) --[[ line: 360 | named "MyCreationsTab" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), t_1 (ref), t_2 (ref), creatorAgentChatModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useTokens (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var26 (ref), useSignalState (ref), requestHandleToPromise (ref), signalsModule (ref), myCreationsSessionListPollingIntervalSeconds (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), chatConstantsModule (ref), playersService (ref), promiseModule (ref), renderLoadingExperienceSkeleton (ref), matchesSearchQueryModule (ref), view (ref), list (ref), inputSize (ref), iconName (ref), buildEmptyStateModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), var35 (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), refreshScrollingFrame (ref), fFlagBuildDesktopReadinessModule (ref)
	local mYCREATIONSBUILDWITHAI, mYCREATIONSLOADERROR, mYCREATIONSNEWGAME
	local var50 = if fFlagBuildLocalization then useLocalization({
		building = localizationStringsModule.MY_CREATIONS_BUILDING,
		buildWithAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI,
		inputNeeded = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		newGame = localizationStringsModule.MY_CREATIONS_NEW_GAME,
		private = localizationStringsModule.MY_CREATIONS_PRIVATE,
		["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = localizationStringsModule.MY_CREATIONS_READY,
		restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		mYCREATIONSBUILDWITHAI = var50.buildWithAI
		mYCREATIONSLOADERROR = var50.loadError
		mYCREATIONSNEWGAME = var50.newGame
	else
		mYCREATIONSBUILDWITHAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI
		mYCREATIONSLOADERROR = localizationStringsModule.MY_CREATIONS_LOAD_ERROR
		mYCREATIONSNEWGAME = localizationStringsModule.MY_CREATIONS_NEW_GAME
	end
	local var51 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function() --[[ line: 389 ]]
		-- upvalues: var50 (ref)
		return {
			waiting_on_client = var50.inputNeeded,
			idle = var50.ready,
			working = var50.building
		}
	end, { var50.inputNeeded, var50.ready, var50.building }) else nil else t_1
	local var52 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function() --[[ line: 408 ]]
		-- upvalues: var50 (ref)
		return {
			private = var50.private,
			["public"] = var50["public"],
			publiclyUnavailable = var50.publiclyUnavailable,
			restricted = var50.restricted
		}
	end, {
		var50.private,
		var50["public"],
		var50.publiclyUnavailable,
		var50.restricted
	}) else nil else t_2
	local creatorAgentChatStore = p21.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local var54 = if fFlagBuildRehydrateOnPublishModule then universeActivationModule.getUniverseActivationStore() else nil
	local configurationStore = p21.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p21.searchQueryStore or getSearchQueryStoreModule()
	local var57 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p21.appLifecycleObserverService or appLifecycleObserverService
	local var59 = p21.isFocused ~= false
	local var60 = useTokens()
	local var61 = reactModule.useRef(nil)
	local var62 = reactModule.useRef(false)
	local var63, var64 = reactModule.useState(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var26("LuaApp_Build_Home_Scroll", var61)
	end
	local t_4
	local var65 = searchQueryStore.useDebouncedQuery()
	local var66 = useSignalState(var57.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var68 = useSignalState(sessionListStore.getSessions)
	local var69 = useSignalState(sessionListStore.getNextPageToken)
	local var70 = useSignalState(sessionListStore.getStatus)
	local var71 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var72 = if var70 == "pending" then "NotReady" elseif var70 == "succeeded" then "Ready" else "Failed"
	local var73 = reactModule.useCallback(function() --[[ line: 456 ]]
		-- upvalues: requestHandleToPromise (copy), sessionListStore (ref)
		return requestHandleToPromise(sessionListStore.refresh())
	end, { sessionListStore })
	reactModule.useEffect(function() --[[ line: 460 ]]
		-- upvalues: appLifecycleObserverService_1 (ref), var59 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function() --[[ line: 461 ]]
			-- upvalues: var59 (copy), sessionListStore (copy)
			if var59 then
				sessionListStore.refresh()
			end
		end)
		
		return function() --[[ line: 467 ]]
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, { appLifecycleObserverService_1, var59, sessionListStore })
	reactModule.useEffect(function() --[[ line: 472 ]]
		-- upvalues: var59 (ref), var64 (ref), sessionListStore (ref), signalsModule (copy)
		if var59 then
			var64(false)
			local var91 = sessionListStore.refresh()
			
			return signalsModule.createEffect(function(p22) --[[ line: 480 ]]
				-- upvalues: var91 (ref), var64 (copy)
				if var91.state(p22).status == "succeeded" then
					var64(true)
				end
			end)
		end
		var64(false)
	end, { var59, var66, sessionListStore })
	local maxValue = math.max(0, p21.pollingIntervalSeconds or myCreationsSessionListPollingIntervalSeconds)
	reactModule.useEffect(function() --[[ line: 489 ]]
		-- upvalues: var59 (ref), maxValue (ref), sessionListStore (ref)
		if var59 and maxValue ~= 0 then
			local var92 = false
			
			local function scheduleNextPoll() --[[ line: 495 ]]
				-- upvalues: maxValue (copy), var92 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function() --[[ line: 496 ]]
					-- upvalues: var92 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var92 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function() --[[ line: 496 ]]
				-- upvalues: var92 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var92 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function() --[[ line: 506 ]]
				-- upvalues: var92 (write)
				var92 = true
			end
		end
	end, { var59, maxValue, sessionListStore })
	local var75 = useSignalState(reactModule.useMemo(function() --[[ line: 511 ]]
		-- upvalues: signalsModule (copy), var68 (ref), configurationStore (ref)
		return signalsModule.createComputed(function(p23) --[[ line: 512 ]]
			-- upvalues: var68 (copy), configurationStore (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in var68 do
				local var97
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var97 = nil
				else
					local universeId = roblox.universeId
					var97 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var97 ~= nil and not t_1[var97] then
					t_1[var97] = true
					local var98 = configurationStore.getAndFetchSummary(var97).data(p23)
					
					if var98 ~= nil then
						t[var97] = var98
					end
				end
			end
			return t
		end)
	end, { configurationStore, var68 }))
	local var76 = useSignalState(reactModule.useMemo(function() --[[ line: 531 ]]
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), var54 (ref), var75 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p24) --[[ line: 532 ]]
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var54 (copy), var75 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and var54 ~= nil then
				for i, v in var75 do
					if v.isActive == true and v.privacyType == privacyType.Public and var54.getAndFetchEligibility(i).data(p24) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { var54, var75 }))
	local var77 = reactModule.useMemo(function() --[[ line: 554 ]]
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var75 (ref), var76 (ref), var52 (ref)
		return buildExperienceMetadataByUniverseId(var75, var76, var52)
	end, { var76, var75, var52 })
	local var78 = reactModule.useMemo(function() --[[ line: 562 ]]
		-- upvalues: buildSessionItems (copy), var68 (ref), var77 (ref), var51 (ref), var52 (ref), var75 (ref)
		local t = {}
		
		for i, v in buildSessionItems(var68, var77, var51, var52) do
			local universeId = var75[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		var68,
		var77,
		var75,
		var51,
		var52
	})
	local var79 = reactModule.useMemo(function() --[[ line: 586 ]]
		-- upvalues: var68 (ref), var75 (ref)
		local t = {}
		
		for i, v in var68 do
			local var103
			local roblox = v._meta and v._meta._roblox
			
			if roblox == nil then
				var103 = nil
			else
				local universeId = roblox.universeId
				var103 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
			end
			if var103 ~= nil and not t[var103] then
				t[var103] = true
				
				if var75[var103] == nil then
					return true
				end
			end
		end
		return false
	end, { var68, var75 })
	local var80 = if var72 ~= "Ready" then #var68 > 0 else true
	local isPending = var71 == "pending"
	local var82 = reactModule.useCallback(function() --[[ line: 602 ]]
		-- upvalues: var62 (ref), p21 (ref), chatConstantsModule (copy), playersService (copy)
		var62.current = true
		p21.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p21.onOpenChat })
	reactModule.useEffect(function() --[[ line: 612 ]]
		-- upvalues: p21 (ref), var59 (ref), var63 (ref), var72 (ref), var68 (ref), var62 (ref), var82 (ref)
		if p21.autoOpenNewGame ~= false and var59 and (var63 and var72 == "Ready") and (#var68 == 0 and not var62.current) then
			var82()
		end
	end, {
		var82, var63, var59, p21.autoOpenNewGame, var68, var72
	})
	local var83 = reactModule.useCallback(function() --[[ line: 634 ]]
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var104 = sessionListStore.loadMore()
		
		return if var104 == nil then promiseModule.resolve() else requestHandleToPromise(var104)
	end, { isPending, var69, var72, sessionListStore })
	local var84 = reactModule.useCallback(function(p25) --[[ line: 642 ]]
		-- upvalues: var69 (ref), isPending (ref), var72 (ref), var83 (ref)
		local y = p25.AbsoluteCanvasSize.Y
		
		if var69 == nil or isPending or (var72 ~= "Ready" or p25.CanvasPosition.Y <= 0) or (y <= 0 or p25.AbsoluteWindowSize.Y <= 0) then return end
		if math.max(0, y - p25.AbsoluteWindowSize.Y - 250) < p25.CanvasPosition.Y then
			var83()
		end
	end, { isPending, var83, var69, var72 })
	local var85 = reactModule.useCallback(function() --[[ line: 661 ]]
		-- upvalues: isPending (ref), renderLoadingExperienceSkeleton (copy), var60 (ref)
		return if isPending then renderLoadingExperienceSkeleton(1, 1, var60) else nil
	end, { isPending, var60 })
	local var86 = reactModule.useMemo(function() --[[ line: 669 ]]
		-- upvalues: var65 (ref), var78 (ref), matchesSearchQueryModule (copy)
		if var65 == "" then
			return var78
		end
		local t = {}
		
		for i, v in var78 do
			if matchesSearchQueryModule(v.experienceName, var65) then
				table.insert(t, v)
			end
		end
		return t
	end, { var78, var65 })
	local _ = nil
	
	if var80 and not var79 and #var78 == 0 then
		t_4 = {
			EmptyContent = reactModule.createElement(view, { tag = "col size-full" }, {
				CreateList = reactModule.createElement(list.Root, {
					LayoutOrder = 1,
					hasDivider = false,
					isContained = { isContained = false, hasMargin = false },
					size = inputSize.Large
				}, {
					CreateRow = reactModule.createElement(list.Item, {
						LayoutOrder = 1,
						leading = iconName.PlusLarge,
						title = mYCREATIONSNEWGAME,
						description = mYCREATIONSBUILDWITHAI,
						onActivated = var82
					})
				}),
				EmptyState = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "col align-x-center align-y-center fill size-full-0 padding-large",
					testId = "MyCreationsTab.Empty"
				}, {
					Content = reactModule.createElement(buildEmptyStateModule)
				})
			})
		}
	else
		local t_3 = {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				leading = iconName.PlusLarge,
				title = mYCREATIONSNEWGAME,
				description = mYCREATIONSBUILDWITHAI,
				onActivated = var82
			})
		}
		
		if var80 and #var78 > 0 then
			for i, v in var86 do
				if fFlagBuildExperienceStableMyCreationsListItemsModule then
					t_3["S" .. v.sessionId] = reactModule.createElement(var35, {
						LayoutOrder = i + 1,
						sessionId = v.sessionId,
						universeId = v.universeId,
						placeId = v.placeId,
						experienceName = v.experienceName,
						creatorName = v.creatorName,
						description = v.description,
						visibilityLabel = v.visibilityLabel,
						gameIcon = v.gameIcon,
						onOpenChat = p21.onOpenChat
					})
				else
					local experienceName = v.experienceName
					local gameIcon = v.gameIcon
					local placeId = v.placeId
					local visibilityLabel = v.visibilityLabel
					t_3["S" .. v.sessionId] = reactModule.createElement(list.Item, {
						LayoutOrder = i + 1,
						leading = { iconName = gameIcon },
						title = experienceName,
						description = v.description,
						testId = `MyCreationsTab.ExperienceRow.{v.universeId}`,
						onActivated = function() --[[ line: 753 ]]
							-- upvalues: p21 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
							p21.onOpenChat({
								universeId = v.universeId,
								placeId = placeId,
								sessionId = v.sessionId,
								experienceName = experienceName,
								creatorName = v.creatorName,
								gameIcon = gameIcon
							})
						end,
						trailing = if visibilityLabel ~= nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
							VisibilityBadge = reactModule.createElement(badge, {
								text = visibilityLabel,
								shape = badgeShape.Box,
								size = badgeSize.Small,
								variant = badgeVariant.Neutral,
								testId = `MyCreationsTab.VisibilityBadge.{v.universeId}`
							})
						})
					})
				end
			end
		elseif var72 == "NotReady" or var79 then
			t_3[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, var60)
			t_3[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, var60)
		elseif var72 == "Failed" then
			t_3.Error = reactModule.createElement(list.Item, { LayoutOrder = 2, title = mYCREATIONSLOADERROR })
		end
		t_4 = {
			ExperienceList = reactModule.createElement(list.Root, {
				hasDivider = false,
				isContained = { isContained = false, hasMargin = false },
				size = inputSize.Large
			}, t_3)
		}
	end
	local var89 = reactModule.createElement(view, {
		tag = "composition-content-body col size-full-0 auto-y",
		testId = "MyCreationsTab.ContentBody"
	}, t_4)
	
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = var73,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var61 else nil,
		onCanvasPositionChangedCallback = var84,
		onCanvasSizeChangedCallback = var84,
		createFooter = var85,
		scrollingElementProps = {
			LayoutOrder = p21.LayoutOrder,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.new(1, 0, 1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Tag] = "fill"
		}
	}, if fFlagBuildDesktopReadinessModule then {
		ContentLayout = reactModule.createElement(view, {
			testId = "MyCreationsTab.ContentLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, { ContentBody = var89 })
	} else { ContentBody = var89 })
end