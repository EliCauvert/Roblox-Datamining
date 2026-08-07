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
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local var22 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
local useSignalState = signalsReactModule.useSignalState
local t = {}
local t_1 = {
	waiting_on_client = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
	idle = localizationStringsModule.MY_CREATIONS_READY,
	working = localizationStringsModule.MY_CREATIONS_BUILDING
}

local function _(p0) --[[ line: 101 | named "thumbForUniverseId" ]]
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p0)
end

local _ = function(p1, p2) --[[ line: 105 | named "privacyLabelForSummary" ]]
	-- upvalues: fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), localizationStringsModule (ref)
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and p1.privacyType == privacyType.Public then
		return if p2 == nil then nil elseif p2 then localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE elseif p1.privacyType == privacyType.Public then localizationStringsModule.MY_CREATIONS_PUBLIC elseif p1.privacyType == privacyType.FriendsOnly then localizationStringsModule.MY_CREATIONS_RESTRICTED else localizationStringsModule.MY_CREATIONS_PRIVATE
	end
end

local _ = function(p3) --[[ line: 124 | named "descriptionForSessionStatus" ]]
	-- upvalues: t_1 (ref)
	local roblox = p3._meta and p3._meta._roblox
	local var30 = if roblox then roblox.sessionStatus else nil
	
	return if var30 == nil then nil else t_1[var30]
end

local function requestHandleToPromise(p4) --[[ line: 133 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p5, p6) --[[ line: 134 ]]
		-- upvalues: p4 (ref)
		task.spawn(function() --[[ line: 135 ]]
			-- upvalues: p4 (copy), p5 (ref), p6 (ref)
			while p4.state(false).status == "pending" do
				task.wait()
			end
			local var31 = p4.state(false)
			
			if var31.status == "succeeded" then
				p5(var31.result)
				
				return
			end
			p6(var31.error)
		end)
	end)
end

local _ = function(p7) --[[ line: 150 | named "getSessionUniverseId" ]]
	local roblox = p7._meta and p7._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p8, p9) --[[ line: 162 ]]
	-- upvalues: fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), localizationStringsModule (ref)
	local t = {}
	
	for i, v in p8 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local var36
			local creatorName = v.creatorName
			local t_1 = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil
			}
			local var35 = p9[i]
			
			if fFlagBuildRehydrateOnPublishModule and v.isActive == true and v.privacyType == privacyType.Public then
				var36 = if var35 == nil then nil elseif var35 then localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE elseif v.privacyType == privacyType.Public then localizationStringsModule.MY_CREATIONS_PUBLIC elseif v.privacyType == privacyType.FriendsOnly then localizationStringsModule.MY_CREATIONS_RESTRICTED else localizationStringsModule.MY_CREATIONS_PRIVATE
			end
			t_1.visibilityLabel = var36
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			t[i] = t_1
		end
	end
	return t
end

local function buildSessionItems(p10, p11) --[[ line: 184 ]]
	-- upvalues: localizationStringsModule (ref), t_1 (ref)
	local t = {}
	local t_2 = {}
	
	for i, v in p10 do
		local var40
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var40 = nil
		else
			local universeId = roblox.universeId
			var40 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var40 ~= nil and not t[var40]) then
			t[var40] = true
			local var41 = if p11 then p11[var40] else nil
			local t_3 = {
				sessionId = sessionId,
				universeId = var40,
				placeId = if var41 then var41.placeId else nil,
				experienceName = if var41 then var41.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var40),
				creatorName = if var41 then var41.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var44 = if roblox_1 then roblox_1.sessionStatus else nil
			t_3.description = if var44 == nil then nil else t_1[var44]
			t_3.visibilityLabel = if var41 then var41.visibilityLabel else localizationStringsModule.MY_CREATIONS_PRIVATE
			t_3.gameIcon = if var41 then var41.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var40)
			table.insert(t_2, t_3)
		end
	end
	return t_2
end

local function renderLoadingExperienceSkeleton(p12, p13, p14) --[[ line: 223 ]]
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

return function(p15) --[[ line: 261 | named "MyCreationsTab" ]]
	-- upvalues: creatorAgentChatModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useTokens (ref), reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var22 (ref), useSignalState (ref), requestHandleToPromise (ref), signalsModule (ref), myCreationsSessionListPollingIntervalSeconds (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), chatConstantsModule (ref), playersService (ref), promiseModule (ref), renderLoadingExperienceSkeleton (ref), matchesSearchQueryModule (ref), view (ref), list (ref), inputSize (ref), iconName (ref), localizationStringsModule (ref), buildEmptyStateModule (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), refreshScrollingFrame (ref)
	local creatorAgentChatStore = p15.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local var46 = if fFlagBuildRehydrateOnPublishModule then universeActivationModule.getUniverseActivationStore() else nil
	local configurationStore = p15.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p15.searchQueryStore or getSearchQueryStoreModule()
	local var49 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p15.appLifecycleObserverService or appLifecycleObserverService
	local var51 = p15.isFocused ~= false
	local var52 = useTokens()
	local var53 = reactModule.useRef(nil)
	local var54 = reactModule.useRef(false)
	local var55, var56 = reactModule.useState(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var22("LuaApp_Build_Home_Scroll", var53)
	end
	local t_2
	local var57 = searchQueryStore.useDebouncedQuery()
	local var58 = useSignalState(var49.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var60 = useSignalState(sessionListStore.getSessions)
	local var61 = useSignalState(sessionListStore.getNextPageToken)
	local var62 = useSignalState(sessionListStore.getStatus)
	local var63 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var64 = if var62 == "pending" then "NotReady" elseif var62 == "succeeded" then "Ready" else "Failed"
	local var65 = reactModule.useCallback(function() --[[ line: 293 ]]
		-- upvalues: requestHandleToPromise (copy), sessionListStore (ref)
		return requestHandleToPromise(sessionListStore.refresh())
	end, { sessionListStore })
	reactModule.useEffect(function() --[[ line: 297 ]]
		-- upvalues: appLifecycleObserverService_1 (ref), var51 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function() --[[ line: 298 ]]
			-- upvalues: var51 (copy), sessionListStore (copy)
			if var51 then
				sessionListStore.refresh()
			end
		end)
		
		return function() --[[ line: 304 ]]
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, { appLifecycleObserverService_1, var51, sessionListStore })
	reactModule.useEffect(function() --[[ line: 309 ]]
		-- upvalues: var51 (ref), var56 (ref), sessionListStore (ref), signalsModule (copy)
		if var51 then
			var56(false)
			local var82 = sessionListStore.refresh()
			
			return signalsModule.createEffect(function(p16) --[[ line: 317 ]]
				-- upvalues: var82 (ref), var56 (copy)
				if var82.state(p16).status == "succeeded" then
					var56(true)
				end
			end)
		end
		var56(false)
	end, { var51, var58, sessionListStore })
	local maxValue = math.max(0, p15.pollingIntervalSeconds or myCreationsSessionListPollingIntervalSeconds)
	reactModule.useEffect(function() --[[ line: 326 ]]
		-- upvalues: var51 (ref), maxValue (ref), sessionListStore (ref)
		if var51 and maxValue ~= 0 then
			local var83 = false
			
			local function scheduleNextPoll() --[[ line: 332 ]]
				-- upvalues: maxValue (copy), var83 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function() --[[ line: 333 ]]
					-- upvalues: var83 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var83 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function() --[[ line: 333 ]]
				-- upvalues: var83 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var83 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function() --[[ line: 343 ]]
				-- upvalues: var83 (write)
				var83 = true
			end
		end
	end, { var51, maxValue, sessionListStore })
	local var67 = useSignalState(reactModule.useMemo(function() --[[ line: 348 ]]
		-- upvalues: signalsModule (copy), var60 (ref), configurationStore (ref)
		return signalsModule.createComputed(function(p17) --[[ line: 349 ]]
			-- upvalues: var60 (copy), configurationStore (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in var60 do
				local var88
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var88 = nil
				else
					local universeId = roblox.universeId
					var88 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var88 ~= nil and not t_1[var88] then
					t_1[var88] = true
					local var89 = configurationStore.getAndFetchSummary(var88).data(p17)
					
					if var89 ~= nil then
						t[var88] = var89
					end
				end
			end
			return t
		end)
	end, { configurationStore, var60 }))
	local var68 = useSignalState(reactModule.useMemo(function() --[[ line: 368 ]]
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), var46 (ref), var67 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p18) --[[ line: 369 ]]
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var46 (copy), var67 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and var46 ~= nil then
				for i, v in var67 do
					if v.isActive == true and v.privacyType == privacyType.Public and var46.getAndFetchEligibility(i).data(p18) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { var46, var67 }))
	local var69 = reactModule.useMemo(function() --[[ line: 391 ]]
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var67 (ref), var68 (ref)
		return buildExperienceMetadataByUniverseId(var67, var68)
	end, { var68, var67 })
	local var70 = reactModule.useMemo(function() --[[ line: 394 ]]
		-- upvalues: buildSessionItems (copy), var60 (ref), var69 (ref), var67 (ref)
		local t = {}
		
		for i, v in buildSessionItems(var60, var69) do
			local universeId = var67[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, { var60, var69, var67 })
	local var71 = reactModule.useMemo(function() --[[ line: 405 ]]
		-- upvalues: var60 (ref), var67 (ref)
		local t = {}
		
		for i, v in var60 do
			local var94
			local roblox = v._meta and v._meta._roblox
			
			if roblox == nil then
				var94 = nil
			else
				local universeId = roblox.universeId
				var94 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
			end
			if var94 ~= nil and not t[var94] then
				t[var94] = true
				
				if var67[var94] == nil then
					return true
				end
			end
		end
		return false
	end, { var60, var67 })
	local var72 = if var64 ~= "Ready" then #var60 > 0 else true
	local isPending = var63 == "pending"
	local var74 = reactModule.useCallback(function() --[[ line: 421 ]]
		-- upvalues: var54 (ref), p15 (ref), chatConstantsModule (copy), playersService (copy)
		var54.current = true
		p15.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p15.onOpenChat })
	reactModule.useEffect(function() --[[ line: 431 ]]
		-- upvalues: p15 (ref), var51 (ref), var55 (ref), var64 (ref), var60 (ref), var54 (ref), var74 (ref)
		if p15.autoOpenNewGame ~= false and var51 and (var55 and var64 == "Ready") and (#var60 == 0 and not var54.current) then
			var74()
		end
	end, {
		var74, var55, var51, p15.autoOpenNewGame, var60, var64
	})
	local var75 = reactModule.useCallback(function() --[[ line: 453 ]]
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var95 = sessionListStore.loadMore()
		
		return if var95 == nil then promiseModule.resolve() else requestHandleToPromise(var95)
	end, { isPending, var61, var64, sessionListStore })
	local var76 = reactModule.useCallback(function(p19) --[[ line: 461 ]]
		-- upvalues: var61 (ref), isPending (ref), var64 (ref), var75 (ref)
		local y = p19.AbsoluteCanvasSize.Y
		
		if var61 == nil or isPending or (var64 ~= "Ready" or p19.CanvasPosition.Y <= 0) or (y <= 0 or p19.AbsoluteWindowSize.Y <= 0) then return end
		if math.max(0, y - p19.AbsoluteWindowSize.Y - 250) < p19.CanvasPosition.Y then
			var75()
		end
	end, { isPending, var75, var61, var64 })
	local var77 = reactModule.useCallback(function() --[[ line: 480 ]]
		-- upvalues: isPending (ref), renderLoadingExperienceSkeleton (copy), var52 (ref)
		return if isPending then renderLoadingExperienceSkeleton(1, 1, var52) else nil
	end, { isPending, var52 })
	local var78 = reactModule.useMemo(function() --[[ line: 488 ]]
		-- upvalues: var57 (ref), var70 (ref), matchesSearchQueryModule (copy)
		if var57 == "" then
			return var70
		end
		local t = {}
		
		for i, v in var70 do
			if matchesSearchQueryModule(v.experienceName, var57) then
				table.insert(t, v)
			end
		end
		return t
	end, { var70, var57 })
	local _ = nil
	
	if var72 and not var71 and #var70 == 0 then
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
						onActivated = var74
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
				onActivated = var74
			})
		}
		
		if var72 and #var70 > 0 then
			for i, v in var78 do
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
					onActivated = function() --[[ line: 558 ]]
						-- upvalues: p15 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
						p15.onOpenChat({
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
		elseif var64 == "NotReady" or var71 then
			t_1[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, var52)
			t_1[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, var52)
		elseif var64 == "Failed" then
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
		refresh = var65,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var53 else nil,
		onCanvasPositionChangedCallback = var76,
		onCanvasSizeChangedCallback = var76,
		createFooter = var77,
		scrollingElementProps = {
			LayoutOrder = p15.LayoutOrder,
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