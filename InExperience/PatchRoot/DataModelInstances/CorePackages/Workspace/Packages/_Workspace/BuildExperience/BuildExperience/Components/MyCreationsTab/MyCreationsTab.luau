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
local fFlagBuildExperienceStableMyCreationsListItemsModule = require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var25 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
local useSignalState = signalsReactModule.useSignalState
local t = {}
local t_1 = {
	waiting_on_client = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
	idle = localizationStringsModule.MY_CREATIONS_READY,
	working = localizationStringsModule.MY_CREATIONS_BUILDING
}

local function _(p0) --[[ line: 111 | named "thumbForUniverseId" ]]
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p0)
end

local function privacyLabelForSummary(p1, p2) --[[ line: 115 ]]
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), localizationStringsModule (ref)
	local var34 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var34 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE elseif var34 == privacyType.Public then localizationStringsModule.MY_CREATIONS_PUBLIC elseif var34 == privacyType.FriendsOnly then localizationStringsModule.MY_CREATIONS_RESTRICTED else localizationStringsModule.MY_CREATIONS_PRIVATE
	end
end

local _ = function(p3) --[[ line: 141 | named "descriptionForSessionStatus" ]]
	-- upvalues: t_1 (ref)
	local roblox = p3._meta and p3._meta._roblox
	local var36 = if roblox then roblox.sessionStatus else nil
	
	return if var36 == nil then nil else t_1[var36]
end

local function requestHandleToPromise(p4) --[[ line: 150 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p5, p6) --[[ line: 151 ]]
		-- upvalues: p4 (ref)
		task.spawn(function() --[[ line: 152 ]]
			-- upvalues: p4 (copy), p5 (ref), p6 (ref)
			while p4.state(false).status == "pending" do
				task.wait()
			end
			local var37 = p4.state(false)
			
			if var37.status == "succeeded" then
				p5(var37.result)
				
				return
			end
			p6(var37.error)
		end)
	end)
end

local _ = function(p7) --[[ line: 167 | named "getSessionUniverseId" ]]
	local roblox = p7._meta and p7._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p8, p9) --[[ line: 179 ]]
	-- upvalues: privacyLabelForSummary (ref)
	local t = {}
	
	for i, v in p8 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local creatorName = v.creatorName
			t[i] = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil,
				visibilityLabel = privacyLabelForSummary(v, p9[i]),
				gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			}
		end
	end
	return t
end

local function buildSessionItems(p10, p11) --[[ line: 201 ]]
	-- upvalues: localizationStringsModule (ref), t_1 (ref)
	local t = {}
	local t_2 = {}
	
	for i, v in p10 do
		local var43
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var43 = nil
		else
			local universeId = roblox.universeId
			var43 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var43 ~= nil and not t[var43]) then
			t[var43] = true
			local var44 = if p11 then p11[var43] else nil
			local t_3 = {
				sessionId = sessionId,
				universeId = var43,
				placeId = if var44 then var44.placeId else nil,
				experienceName = if var44 then var44.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var43),
				creatorName = if var44 then var44.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var47 = if roblox_1 then roblox_1.sessionStatus else nil
			t_3.description = if var47 == nil then nil else t_1[var47]
			t_3.visibilityLabel = if var44 then var44.visibilityLabel else localizationStringsModule.MY_CREATIONS_PRIVATE
			t_3.gameIcon = if var44 then var44.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var43)
			table.insert(t_2, t_3)
		end
	end
	return t_2
end

local function renderLoadingExperienceSkeleton(p12, p13, p14) --[[ line: 240 ]]
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = p13,
		Size = UDim2.new(1, 0, 0, p14.Size.Size_2000),
		testId = `MyCreationsTab.LoadingSkeleton.{p12}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p14.Size.Size_1400, p14.Size.Size_1400)
		}, {
			Thumbnail = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p14.Size.Size_400),
				radius = radius.Small
			}),
			Description = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p14.Size.Size_250),
				radius = radius.Small
			})
		})
	})
end

local var33 = reactModule.memo(function(p15) --[[ line: 278 | named "ExperienceListItem" ]]
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p15.LayoutOrder,
		leading = reactModule.useMemo(function() --[[ line: 279 ]]
			-- upvalues: p15 (ref)
			return { type = nil, iconVariant = nil, iconName = p15.gameIcon }
		end, { p15.gameIcon }),
		title = p15.experienceName,
		description = p15.description,
		testId = `MyCreationsTab.ExperienceRow.{p15.universeId}`,
		onActivated = reactModule.useCallback(function() --[[ line: 287 ]]
			-- upvalues: p15 (ref)
			p15.onOpenChat({
				universeId = p15.universeId,
				placeId = p15.placeId,
				sessionId = p15.sessionId,
				experienceName = p15.experienceName,
				creatorName = p15.creatorName,
				gameIcon = p15.gameIcon
			})
		end, {
			p15.creatorName, p15.experienceName, p15.gameIcon, p15.onOpenChat, p15.placeId,
			p15.sessionId, p15.universeId
		}),
		trailing = reactModule.useMemo(function() --[[ line: 307 ]]
			-- upvalues: p15 (ref), reactModule (copy), view (copy), badge (copy), badgeShape (copy), badgeSize (copy), badgeVariant (copy)
			return if p15.visibilityLabel == nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(badge, {
					text = p15.visibilityLabel,
					shape = badgeShape.Box,
					size = badgeSize.Small,
					variant = badgeVariant.Neutral,
					testId = `MyCreationsTab.VisibilityBadge.{p15.universeId}`
				})
			})
		end, { p15.universeId, p15.visibilityLabel })
	})
end)

return function(p16) --[[ line: 338 | named "MyCreationsTab" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), creatorAgentChatModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useTokens (ref), reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var25 (ref), useSignalState (ref), requestHandleToPromise (ref), signalsModule (ref), myCreationsSessionListPollingIntervalSeconds (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), chatConstantsModule (ref), playersService (ref), promiseModule (ref), renderLoadingExperienceSkeleton (ref), matchesSearchQueryModule (ref), view (ref), list (ref), inputSize (ref), iconName (ref), buildEmptyStateModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), var33 (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), refreshScrollingFrame (ref)
	local mYCREATIONSBUILDWITHAI, mYCREATIONSLOADERROR, mYCREATIONSNEWGAME
	local var48 = if fFlagBuildLocalization then useLocalization({
		buildWithAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		newGame = localizationStringsModule.MY_CREATIONS_NEW_GAME
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		mYCREATIONSBUILDWITHAI = var48.buildWithAI
		mYCREATIONSLOADERROR = var48.loadError
		mYCREATIONSNEWGAME = var48.newGame
	else
		mYCREATIONSBUILDWITHAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI
		mYCREATIONSLOADERROR = localizationStringsModule.MY_CREATIONS_LOAD_ERROR
		mYCREATIONSNEWGAME = localizationStringsModule.MY_CREATIONS_NEW_GAME
	end
	local creatorAgentChatStore = p16.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local var50 = if fFlagBuildRehydrateOnPublishModule then universeActivationModule.getUniverseActivationStore() else nil
	local configurationStore = p16.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p16.searchQueryStore or getSearchQueryStoreModule()
	local var53 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p16.appLifecycleObserverService or appLifecycleObserverService
	local var55 = p16.isFocused ~= false
	local var56 = useTokens()
	local var57 = reactModule.useRef(nil)
	local var58 = reactModule.useRef(false)
	local var59, var60 = reactModule.useState(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var25("LuaApp_Build_Home_Scroll", var57)
	end
	local t_2
	local var61 = searchQueryStore.useDebouncedQuery()
	local var62 = useSignalState(var53.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var64 = useSignalState(sessionListStore.getSessions)
	local var65 = useSignalState(sessionListStore.getNextPageToken)
	local var66 = useSignalState(sessionListStore.getStatus)
	local var67 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var68 = if var66 == "pending" then "NotReady" elseif var66 == "succeeded" then "Ready" else "Failed"
	local var69 = reactModule.useCallback(function() --[[ line: 389 ]]
		-- upvalues: requestHandleToPromise (copy), sessionListStore (ref)
		return requestHandleToPromise(sessionListStore.refresh())
	end, { sessionListStore })
	reactModule.useEffect(function() --[[ line: 393 ]]
		-- upvalues: appLifecycleObserverService_1 (ref), var55 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function() --[[ line: 394 ]]
			-- upvalues: var55 (copy), sessionListStore (copy)
			if var55 then
				sessionListStore.refresh()
			end
		end)
		
		return function() --[[ line: 400 ]]
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, { appLifecycleObserverService_1, var55, sessionListStore })
	reactModule.useEffect(function() --[[ line: 405 ]]
		-- upvalues: var55 (ref), var60 (ref), sessionListStore (ref), signalsModule (copy)
		if var55 then
			var60(false)
			local var86 = sessionListStore.refresh()
			
			return signalsModule.createEffect(function(p17) --[[ line: 413 ]]
				-- upvalues: var86 (ref), var60 (copy)
				if var86.state(p17).status == "succeeded" then
					var60(true)
				end
			end)
		end
		var60(false)
	end, { var55, var62, sessionListStore })
	local maxValue = math.max(0, p16.pollingIntervalSeconds or myCreationsSessionListPollingIntervalSeconds)
	reactModule.useEffect(function() --[[ line: 422 ]]
		-- upvalues: var55 (ref), maxValue (ref), sessionListStore (ref)
		if var55 and maxValue ~= 0 then
			local var87 = false
			
			local function scheduleNextPoll() --[[ line: 428 ]]
				-- upvalues: maxValue (copy), var87 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function() --[[ line: 429 ]]
					-- upvalues: var87 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var87 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function() --[[ line: 429 ]]
				-- upvalues: var87 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var87 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function() --[[ line: 439 ]]
				-- upvalues: var87 (write)
				var87 = true
			end
		end
	end, { var55, maxValue, sessionListStore })
	local var71 = useSignalState(reactModule.useMemo(function() --[[ line: 444 ]]
		-- upvalues: signalsModule (copy), var64 (ref), configurationStore (ref)
		return signalsModule.createComputed(function(p18) --[[ line: 445 ]]
			-- upvalues: var64 (copy), configurationStore (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in var64 do
				local var92
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var92 = nil
				else
					local universeId = roblox.universeId
					var92 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var92 ~= nil and not t_1[var92] then
					t_1[var92] = true
					local var93 = configurationStore.getAndFetchSummary(var92).data(p18)
					
					if var93 ~= nil then
						t[var92] = var93
					end
				end
			end
			return t
		end)
	end, { configurationStore, var64 }))
	local var72 = useSignalState(reactModule.useMemo(function() --[[ line: 464 ]]
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), var50 (ref), var71 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p19) --[[ line: 465 ]]
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var50 (copy), var71 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and var50 ~= nil then
				for i, v in var71 do
					if v.isActive == true and v.privacyType == privacyType.Public and var50.getAndFetchEligibility(i).data(p19) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { var50, var71 }))
	local var73 = reactModule.useMemo(function() --[[ line: 487 ]]
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var71 (ref), var72 (ref)
		return buildExperienceMetadataByUniverseId(var71, var72)
	end, { var72, var71 })
	local var74 = reactModule.useMemo(function() --[[ line: 490 ]]
		-- upvalues: buildSessionItems (copy), var64 (ref), var73 (ref), var71 (ref)
		local t = {}
		
		for i, v in buildSessionItems(var64, var73) do
			local universeId = var71[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, { var64, var73, var71 })
	local var75 = reactModule.useMemo(function() --[[ line: 501 ]]
		-- upvalues: var64 (ref), var71 (ref)
		local t = {}
		
		for i, v in var64 do
			local var98
			local roblox = v._meta and v._meta._roblox
			
			if roblox == nil then
				var98 = nil
			else
				local universeId = roblox.universeId
				var98 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
			end
			if var98 ~= nil and not t[var98] then
				t[var98] = true
				
				if var71[var98] == nil then
					return true
				end
			end
		end
		return false
	end, { var64, var71 })
	local var76 = if var68 ~= "Ready" then #var64 > 0 else true
	local isPending = var67 == "pending"
	local var78 = reactModule.useCallback(function() --[[ line: 517 ]]
		-- upvalues: var58 (ref), p16 (ref), chatConstantsModule (copy), playersService (copy)
		var58.current = true
		p16.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p16.onOpenChat })
	reactModule.useEffect(function() --[[ line: 527 ]]
		-- upvalues: p16 (ref), var55 (ref), var59 (ref), var68 (ref), var64 (ref), var58 (ref), var78 (ref)
		if p16.autoOpenNewGame ~= false and var55 and (var59 and var68 == "Ready") and (#var64 == 0 and not var58.current) then
			var78()
		end
	end, {
		var78, var59, var55, p16.autoOpenNewGame, var64, var68
	})
	local var79 = reactModule.useCallback(function() --[[ line: 549 ]]
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var99 = sessionListStore.loadMore()
		
		return if var99 == nil then promiseModule.resolve() else requestHandleToPromise(var99)
	end, { isPending, var65, var68, sessionListStore })
	local var80 = reactModule.useCallback(function(p20) --[[ line: 557 ]]
		-- upvalues: var65 (ref), isPending (ref), var68 (ref), var79 (ref)
		local y = p20.AbsoluteCanvasSize.Y
		
		if var65 == nil or isPending or (var68 ~= "Ready" or p20.CanvasPosition.Y <= 0) or (y <= 0 or p20.AbsoluteWindowSize.Y <= 0) then return end
		if math.max(0, y - p20.AbsoluteWindowSize.Y - 250) < p20.CanvasPosition.Y then
			var79()
		end
	end, { isPending, var79, var65, var68 })
	local var81 = reactModule.useCallback(function() --[[ line: 576 ]]
		-- upvalues: isPending (ref), renderLoadingExperienceSkeleton (copy), var56 (ref)
		return if isPending then renderLoadingExperienceSkeleton(1, 1, var56) else nil
	end, { isPending, var56 })
	local var82 = reactModule.useMemo(function() --[[ line: 584 ]]
		-- upvalues: var61 (ref), var74 (ref), matchesSearchQueryModule (copy)
		if var61 == "" then
			return var74
		end
		local t = {}
		
		for i, v in var74 do
			if matchesSearchQueryModule(v.experienceName, var61) then
				table.insert(t, v)
			end
		end
		return t
	end, { var74, var61 })
	local _ = nil
	
	if var76 and not var75 and #var74 == 0 then
		t_2 = {
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
						onActivated = var78
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
		local t_1 = {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				leading = iconName.PlusLarge,
				title = mYCREATIONSNEWGAME,
				description = mYCREATIONSBUILDWITHAI,
				onActivated = var78
			})
		}
		
		if var76 and #var74 > 0 then
			for i, v in var82 do
				if fFlagBuildExperienceStableMyCreationsListItemsModule then
					t_1["S" .. v.sessionId] = reactModule.createElement(var33, {
						LayoutOrder = i + 1,
						sessionId = v.sessionId,
						universeId = v.universeId,
						placeId = v.placeId,
						experienceName = v.experienceName,
						creatorName = v.creatorName,
						description = v.description,
						visibilityLabel = v.visibilityLabel,
						gameIcon = v.gameIcon,
						onOpenChat = p16.onOpenChat
					})
				else
					local experienceName = v.experienceName
					local gameIcon = v.gameIcon
					local placeId = v.placeId
					local visibilityLabel = v.visibilityLabel
					t_1["S" .. v.sessionId] = reactModule.createElement(list.Item, {
						LayoutOrder = i + 1,
						leading = { iconName = gameIcon },
						title = experienceName,
						description = v.description,
						testId = `MyCreationsTab.ExperienceRow.{v.universeId}`,
						onActivated = function() --[[ line: 668 ]]
							-- upvalues: p16 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
							p16.onOpenChat({
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
		elseif var68 == "NotReady" or var75 then
			t_1[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, var56)
			t_1[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, var56)
		elseif var68 == "Failed" then
			t_1.Error = reactModule.createElement(list.Item, { LayoutOrder = 2, title = mYCREATIONSLOADERROR })
		end
		t_2 = {
			ExperienceList = reactModule.createElement(list.Root, {
				hasDivider = false,
				isContained = { isContained = false, hasMargin = false },
				size = inputSize.Large
			}, t_1)
		}
	end
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = var69,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var57 else nil,
		onCanvasPositionChangedCallback = var80,
		onCanvasSizeChangedCallback = var80,
		createFooter = var81,
		scrollingElementProps = {
			LayoutOrder = p16.LayoutOrder,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.new(1, 0, 1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Tag] = "fill"
		}
	}, {
		ContentBody = reactModule.createElement(view, {
			tag = "composition-content-body col size-full-0 auto-y",
			testId = "MyCreationsTab.ContentBody"
		}, t_2)
	})
end