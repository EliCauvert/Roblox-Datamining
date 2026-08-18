local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local myCreationsSessionListPollingIntervalSeconds = game:DefineFastInt("MyCreationsSessionListPollingIntervalSeconds", 60)
local foundationModule = require(parent.Foundation)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
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
local var24 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
local useSignalState = signalsReactModule.useSignalState
local t = {}
local t_1 = {
	waiting_on_client = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
	idle = localizationStringsModule.MY_CREATIONS_READY,
	working = localizationStringsModule.MY_CREATIONS_BUILDING
}

local function _(p0) --[[ line: 108 | named "thumbForUniverseId" ]]
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p0)
end

local function privacyLabelForSummary(p1, p2) --[[ line: 112 ]]
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), localizationStringsModule (ref)
	local var33 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var33 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE elseif var33 == privacyType.Public then localizationStringsModule.MY_CREATIONS_PUBLIC elseif var33 == privacyType.FriendsOnly then localizationStringsModule.MY_CREATIONS_RESTRICTED else localizationStringsModule.MY_CREATIONS_PRIVATE
	end
end

local _ = function(p3) --[[ line: 138 | named "descriptionForSessionStatus" ]]
	-- upvalues: t_1 (ref)
	local roblox = p3._meta and p3._meta._roblox
	local var35 = if roblox then roblox.sessionStatus else nil
	
	return if var35 == nil then nil else t_1[var35]
end

local function requestHandleToPromise(p4) --[[ line: 147 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p5, p6) --[[ line: 148 ]]
		-- upvalues: p4 (ref)
		task.spawn(function() --[[ line: 149 ]]
			-- upvalues: p4 (copy), p5 (ref), p6 (ref)
			while p4.state(false).status == "pending" do
				task.wait()
			end
			local var36 = p4.state(false)
			
			if var36.status == "succeeded" then
				p5(var36.result)
				
				return
			end
			p6(var36.error)
		end)
	end)
end

local _ = function(p7) --[[ line: 164 | named "getSessionUniverseId" ]]
	local roblox = p7._meta and p7._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p8, p9) --[[ line: 176 ]]
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

local function buildSessionItems(p10, p11) --[[ line: 198 ]]
	-- upvalues: localizationStringsModule (ref), t_1 (ref)
	local t = {}
	local t_2 = {}
	
	for i, v in p10 do
		local var42
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var42 = nil
		else
			local universeId = roblox.universeId
			var42 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var42 ~= nil and not t[var42]) then
			t[var42] = true
			local var43 = if p11 then p11[var42] else nil
			local t_3 = {
				sessionId = sessionId,
				universeId = var42,
				placeId = if var43 then var43.placeId else nil,
				experienceName = if var43 then var43.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var42),
				creatorName = if var43 then var43.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var46 = if roblox_1 then roblox_1.sessionStatus else nil
			t_3.description = if var46 == nil then nil else t_1[var46]
			t_3.visibilityLabel = if var43 then var43.visibilityLabel else localizationStringsModule.MY_CREATIONS_PRIVATE
			t_3.gameIcon = if var43 then var43.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var42)
			table.insert(t_2, t_3)
		end
	end
	return t_2
end

local function renderLoadingExperienceSkeleton(p12, p13, p14) --[[ line: 237 ]]
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

local var32 = reactModule.memo(function(p15) --[[ line: 275 | named "ExperienceListItem" ]]
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p15.LayoutOrder,
		leading = reactModule.useMemo(function() --[[ line: 276 ]]
			-- upvalues: p15 (ref)
			return { type = nil, iconVariant = nil, iconName = p15.gameIcon }
		end, { p15.gameIcon }),
		title = p15.experienceName,
		description = p15.description,
		testId = `MyCreationsTab.ExperienceRow.{p15.universeId}`,
		onActivated = reactModule.useCallback(function() --[[ line: 284 ]]
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
		trailing = reactModule.useMemo(function() --[[ line: 304 ]]
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

return function(p16) --[[ line: 335 | named "MyCreationsTab" ]]
	-- upvalues: creatorAgentChatModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useTokens (ref), reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var24 (ref), useSignalState (ref), requestHandleToPromise (ref), signalsModule (ref), myCreationsSessionListPollingIntervalSeconds (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), chatConstantsModule (ref), playersService (ref), promiseModule (ref), renderLoadingExperienceSkeleton (ref), matchesSearchQueryModule (ref), view (ref), list (ref), inputSize (ref), iconName (ref), localizationStringsModule (ref), buildEmptyStateModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), var32 (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), refreshScrollingFrame (ref)
	local creatorAgentChatStore = p16.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local var48 = if fFlagBuildRehydrateOnPublishModule then universeActivationModule.getUniverseActivationStore() else nil
	local configurationStore = p16.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p16.searchQueryStore or getSearchQueryStoreModule()
	local var51 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p16.appLifecycleObserverService or appLifecycleObserverService
	local var53 = p16.isFocused ~= false
	local var54 = useTokens()
	local var55 = reactModule.useRef(nil)
	local var56 = reactModule.useRef(false)
	local var57, var58 = reactModule.useState(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var24("LuaApp_Build_Home_Scroll", var55)
	end
	local t_2
	local var59 = searchQueryStore.useDebouncedQuery()
	local var60 = useSignalState(var51.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var62 = useSignalState(sessionListStore.getSessions)
	local var63 = useSignalState(sessionListStore.getNextPageToken)
	local var64 = useSignalState(sessionListStore.getStatus)
	local var65 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var66 = if var64 == "pending" then "NotReady" elseif var64 == "succeeded" then "Ready" else "Failed"
	local var67 = reactModule.useCallback(function() --[[ line: 367 ]]
		-- upvalues: requestHandleToPromise (copy), sessionListStore (ref)
		return requestHandleToPromise(sessionListStore.refresh())
	end, { sessionListStore })
	reactModule.useEffect(function() --[[ line: 371 ]]
		-- upvalues: appLifecycleObserverService_1 (ref), var53 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function() --[[ line: 372 ]]
			-- upvalues: var53 (copy), sessionListStore (copy)
			if var53 then
				sessionListStore.refresh()
			end
		end)
		
		return function() --[[ line: 378 ]]
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, { appLifecycleObserverService_1, var53, sessionListStore })
	reactModule.useEffect(function() --[[ line: 383 ]]
		-- upvalues: var53 (ref), var58 (ref), sessionListStore (ref), signalsModule (copy)
		if var53 then
			var58(false)
			local var84 = sessionListStore.refresh()
			
			return signalsModule.createEffect(function(p17) --[[ line: 391 ]]
				-- upvalues: var84 (ref), var58 (copy)
				if var84.state(p17).status == "succeeded" then
					var58(true)
				end
			end)
		end
		var58(false)
	end, { var53, var60, sessionListStore })
	local maxValue = math.max(0, p16.pollingIntervalSeconds or myCreationsSessionListPollingIntervalSeconds)
	reactModule.useEffect(function() --[[ line: 400 ]]
		-- upvalues: var53 (ref), maxValue (ref), sessionListStore (ref)
		if var53 and maxValue ~= 0 then
			local var85 = false
			
			local function scheduleNextPoll() --[[ line: 406 ]]
				-- upvalues: maxValue (copy), var85 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function() --[[ line: 407 ]]
					-- upvalues: var85 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var85 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function() --[[ line: 407 ]]
				-- upvalues: var85 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var85 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function() --[[ line: 417 ]]
				-- upvalues: var85 (write)
				var85 = true
			end
		end
	end, { var53, maxValue, sessionListStore })
	local var69 = useSignalState(reactModule.useMemo(function() --[[ line: 422 ]]
		-- upvalues: signalsModule (copy), var62 (ref), configurationStore (ref)
		return signalsModule.createComputed(function(p18) --[[ line: 423 ]]
			-- upvalues: var62 (copy), configurationStore (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in var62 do
				local var90
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var90 = nil
				else
					local universeId = roblox.universeId
					var90 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var90 ~= nil and not t_1[var90] then
					t_1[var90] = true
					local var91 = configurationStore.getAndFetchSummary(var90).data(p18)
					
					if var91 ~= nil then
						t[var90] = var91
					end
				end
			end
			return t
		end)
	end, { configurationStore, var62 }))
	local var70 = useSignalState(reactModule.useMemo(function() --[[ line: 442 ]]
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), var48 (ref), var69 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p19) --[[ line: 443 ]]
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var48 (copy), var69 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and var48 ~= nil then
				for i, v in var69 do
					if v.isActive == true and v.privacyType == privacyType.Public and var48.getAndFetchEligibility(i).data(p19) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { var48, var69 }))
	local var71 = reactModule.useMemo(function() --[[ line: 465 ]]
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var69 (ref), var70 (ref)
		return buildExperienceMetadataByUniverseId(var69, var70)
	end, { var70, var69 })
	local var72 = reactModule.useMemo(function() --[[ line: 468 ]]
		-- upvalues: buildSessionItems (copy), var62 (ref), var71 (ref), var69 (ref)
		local t = {}
		
		for i, v in buildSessionItems(var62, var71) do
			local universeId = var69[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, { var62, var71, var69 })
	local var73 = reactModule.useMemo(function() --[[ line: 479 ]]
		-- upvalues: var62 (ref), var69 (ref)
		local t = {}
		
		for i, v in var62 do
			local var96
			local roblox = v._meta and v._meta._roblox
			
			if roblox == nil then
				var96 = nil
			else
				local universeId = roblox.universeId
				var96 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
			end
			if var96 ~= nil and not t[var96] then
				t[var96] = true
				
				if var69[var96] == nil then
					return true
				end
			end
		end
		return false
	end, { var62, var69 })
	local var74 = if var66 ~= "Ready" then #var62 > 0 else true
	local isPending = var65 == "pending"
	local var76 = reactModule.useCallback(function() --[[ line: 495 ]]
		-- upvalues: var56 (ref), p16 (ref), chatConstantsModule (copy), playersService (copy)
		var56.current = true
		p16.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p16.onOpenChat })
	reactModule.useEffect(function() --[[ line: 505 ]]
		-- upvalues: p16 (ref), var53 (ref), var57 (ref), var66 (ref), var62 (ref), var56 (ref), var76 (ref)
		if p16.autoOpenNewGame ~= false and var53 and (var57 and var66 == "Ready") and (#var62 == 0 and not var56.current) then
			var76()
		end
	end, {
		var76, var57, var53, p16.autoOpenNewGame, var62, var66
	})
	local var77 = reactModule.useCallback(function() --[[ line: 527 ]]
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var97 = sessionListStore.loadMore()
		
		return if var97 == nil then promiseModule.resolve() else requestHandleToPromise(var97)
	end, { isPending, var63, var66, sessionListStore })
	local var78 = reactModule.useCallback(function(p20) --[[ line: 535 ]]
		-- upvalues: var63 (ref), isPending (ref), var66 (ref), var77 (ref)
		local y = p20.AbsoluteCanvasSize.Y
		
		if var63 == nil or isPending or (var66 ~= "Ready" or p20.CanvasPosition.Y <= 0) or (y <= 0 or p20.AbsoluteWindowSize.Y <= 0) then return end
		if math.max(0, y - p20.AbsoluteWindowSize.Y - 250) < p20.CanvasPosition.Y then
			var77()
		end
	end, { isPending, var77, var63, var66 })
	local var79 = reactModule.useCallback(function() --[[ line: 554 ]]
		-- upvalues: isPending (ref), renderLoadingExperienceSkeleton (copy), var54 (ref)
		return if isPending then renderLoadingExperienceSkeleton(1, 1, var54) else nil
	end, { isPending, var54 })
	local var80 = reactModule.useMemo(function() --[[ line: 562 ]]
		-- upvalues: var59 (ref), var72 (ref), matchesSearchQueryModule (copy)
		if var59 == "" then
			return var72
		end
		local t = {}
		
		for i, v in var72 do
			if matchesSearchQueryModule(v.experienceName, var59) then
				table.insert(t, v)
			end
		end
		return t
	end, { var72, var59 })
	local _ = nil
	
	if var74 and not var73 and #var72 == 0 then
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
						title = localizationStringsModule.MY_CREATIONS_NEW_GAME,
						description = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI,
						onActivated = var76
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
				title = localizationStringsModule.MY_CREATIONS_NEW_GAME,
				description = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI,
				onActivated = var76
			})
		}
		
		if var74 and #var72 > 0 then
			for i, v in var80 do
				if fFlagBuildExperienceStableMyCreationsListItemsModule then
					t_1["S" .. v.sessionId] = reactModule.createElement(var32, {
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
						onActivated = function() --[[ line: 646 ]]
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
		elseif var66 == "NotReady" or var73 then
			t_1[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, var54)
			t_1[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, var54)
		elseif var66 == "Failed" then
			t_1.Error = reactModule.createElement(list.Item, {
				LayoutOrder = 2,
				title = localizationStringsModule.MY_CREATIONS_LOAD_ERROR
			})
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
		refresh = var67,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var55 else nil,
		onCanvasPositionChangedCallback = var78,
		onCanvasSizeChangedCallback = var78,
		createFooter = var79,
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