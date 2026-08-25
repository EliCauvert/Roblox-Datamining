local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local fFlagBuildAddSearchIconAndMoveSearchbarModule = require(buildExperience.Flags.FFlagBuildAddSearchIconAndMoveSearchbar)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(parent.DataHydration.CreatorAgentChat)
local _ = require(parent.DataHydration.UniverseConfiguration)
local _ = require(parent.DataHydration.UniverseSearch)
local var10 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Badge else nil
local list = foundationModule.List
local var11 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Skeleton else nil
local view = foundationModule.View
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local var12 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.BadgeShape else nil
local var13 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.BadgeSize else nil
local var14 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.BadgeVariant else nil
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local var15 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.Radius else nil
local var16 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Hooks.useTokens else nil
local var17 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(buildExperience.Components.SearchEmptyState.SearchEmptyState) else nil
local buildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local chatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local getSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(script.Parent.Parent.Parent.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local var23 = not fFlagBuildAddSearchIconAndMoveSearchbarModule and require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var24 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
local var25 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.ExperienceResultsList) else nil
local var26 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.ExperienceResultsLoadingSkeleton) else nil
local useMyCreationsResultsModule = require(script.Parent.useMyCreationsResults)
local var28 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then 2 else nil
local var29 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then function(p0, p1, p2)
	-- upvalues: reactModule (ref), view (ref), var11 (ref), var15 (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = p1,
		Size = UDim2.new(1, 0, 0, p2.Size.Size_2000),
		testId = `MyCreationsTab.LoadingSkeleton.{p0}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p2.Size.Size_1400, p2.Size.Size_1400)
		}, {
			Thumbnail = reactModule.createElement(var11, { Size = UDim2.fromScale(1, 1), radius = var15.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(var11, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p2.Size.Size_400),
				radius = var15.Small
			}),
			Description = reactModule.createElement(var11, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p2.Size.Size_250),
				radius = var15.Small
			})
		})
	})
end else nil
local var30 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.memo(function(p3)
	-- upvalues: reactModule (ref), view (ref), var10 (ref), var12 (ref), var13 (ref), var14 (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p3.LayoutOrder,
		leading = reactModule.useMemo(function()
			-- upvalues: p3 (ref)
			return { type = nil, iconVariant = nil, iconName = p3.gameIcon }
		end, { p3.gameIcon }),
		title = p3.experienceName,
		description = p3.description,
		testId = `MyCreationsTab.ExperienceRow.{p3.universeId}`,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p3 (ref)
			p3.onOpenChat({
				universeId = p3.universeId,
				placeId = p3.placeId,
				sessionId = p3.sessionId,
				experienceName = p3.experienceName,
				creatorName = p3.creatorName,
				gameIcon = p3.gameIcon
			})
		end, {
			p3.creatorName, p3.experienceName, p3.gameIcon, p3.onOpenChat, p3.placeId,
			p3.sessionId, p3.universeId
		}),
		trailing = reactModule.useMemo(function()
			-- upvalues: p3 (ref), reactModule (copy), view (copy), var10 (copy), var12 (copy), var13 (copy), var14 (copy)
			return if p3.visibilityLabel == nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(var10, {
					text = p3.visibilityLabel,
					shape = var12.Box,
					size = var13.Small,
					variant = var14.Neutral,
					testId = `MyCreationsTab.VisibilityBadge.{p3.universeId}`
				})
			})
		end, { p3.universeId, p3.visibilityLabel })
	})
end) else nil

return function(p4)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), getSearchQueryStoreModule (ref), fFlagBuildAddSearchIconAndMoveSearchbarModule (ref), var16 (ref), reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var24 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), useMyCreationsResultsModule (ref), chatConstantsModule (ref), playersService (ref), var26 (ref), var29 (ref), list (ref), iconName (ref), var17 (ref), view (ref), inputSize (ref), buildEmptyStateModule (ref), var25 (ref), var23 (ref), var30 (ref), var10 (ref), var12 (ref), var13 (ref), var14 (ref), var28 (ref), refreshScrollingFrame (ref), fFlagBuildDesktopReadinessModule (ref)
	local mYCREATIONSBUILDWITHAI, mYCREATIONSLOADERROR, mYCREATIONSNEWGAME
	local var31 = if fFlagBuildLocalization then useLocalization({
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
		mYCREATIONSBUILDWITHAI = var31.buildWithAI
		mYCREATIONSLOADERROR = var31.loadError
		mYCREATIONSNEWGAME = var31.newGame
	else
		mYCREATIONSBUILDWITHAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI
		mYCREATIONSLOADERROR = localizationStringsModule.MY_CREATIONS_LOAD_ERROR
		mYCREATIONSNEWGAME = localizationStringsModule.MY_CREATIONS_NEW_GAME
	end
	local searchQueryStore = p4.searchQueryStore or getSearchQueryStoreModule()
	local var33 = p4.isFocused ~= false
	local var34 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then var16() else nil
	local var35 = reactModule.useRef(nil)
	local var36 = reactModule.useRef(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var24("LuaApp_Build_Home_Scroll", var35)
	end
	local var41
	local var37 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then searchQueryStore.useShowEmptyState() else false
	local var38 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then searchQueryStore.useDraftQuery() else nil
	local var39 = useMyCreationsResultsModule({
		creatorAgentChatStore = p4.creatorAgentChatStore,
		configurationStore = p4.configurationStore,
		searchStore = p4.searchStore,
		searchQueryStore = searchQueryStore,
		appLifecycleObserverService = p4.appLifecycleObserverService,
		isFocused = var33,
		pollingIntervalSeconds = p4.pollingIntervalSeconds,
		userId = p4.userId
	})
	local displayedItems = var39.displayedItems
	local items = var39.items
	local hasPendingSummary = var39.hasPendingSummary
	local listStatus = var39.listStatus
	local sourceItemCount = var39.sourceItemCount
	local hasDisplayedResult = var39.hasDisplayedResult
	local failedLoadMore = var39.failedLoadMore
	local retryLoadMore = var39.retryLoadMore
	local refresh = var39.refresh
	local loadMoreIfNeeded = var39.loadMoreIfNeeded
	local var40 = reactModule.useCallback(function()
		-- upvalues: var36 (ref), p4 (ref), chatConstantsModule (copy), playersService (copy)
		var36.current = true
		p4.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p4.onOpenChat })
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule then
		var41 = var39.hasCompletedFocusedRefresh
		
		if var41 then
			var41 = false
			
			if var39.sessionListStatus == "Ready" then
				var41 = false
				
				if var39.sessionCount == 0 then
					var41 = var38 == ""
					var41 = nil
				end
			end
		end
	else
		var41 = var39.hasCompletedFocusedRefresh and (listStatus == "Ready" and sourceItemCount == 0)
	end
	local t
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var33 (ref), var41 (ref), var36 (ref), var40 (ref)
		if p4.autoOpenNewGame ~= false and var33 and (var41 and not var36.current) then
			var40()
		end
	end, { var41, var40, var33, p4.autoOpenNewGame })
	local var42 = reactModule.useCallback(function()
		-- upvalues: var39 (ref), fFlagBuildAddSearchIconAndMoveSearchbarModule (copy), reactModule (copy), var26 (copy), var29 (copy), var34 (ref)
		return if var39.isLoadingMore then if fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.createElement(var26, {
			LayoutOrder = 1,
			index = 1,
			testIdPrefix = "MyCreationsTab"
		}) else var29(1, 1, var34) else nil
	end, { var39.isLoadingMore, var34 })
	local var43 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), list (copy), iconName (copy), mYCREATIONSNEWGAME (write), mYCREATIONSBUILDWITHAI (write), var40 (ref)
		return {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				leading = iconName.PlusLarge,
				title = mYCREATIONSNEWGAME,
				description = mYCREATIONSBUILDWITHAI,
				onActivated = var40
			})
		}
	end, { mYCREATIONSBUILDWITHAI, var40, mYCREATIONSNEWGAME }) else nil
	local _ = nil
	
	if var37 then
		t = {
			SearchEmptyState = reactModule.createElement(var17, { testId = "MyCreationsTab.SearchEmptyState" })
		}
	elseif hasDisplayedResult and not hasPendingSummary and #displayedItems == 0 then
		t = {
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
						onActivated = var40
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
	elseif fFlagBuildAddSearchIconAndMoveSearchbarModule then
		t = {
			ExperienceList = reactModule.createElement(var25, {
				firstResultLayoutOrder = 2,
				testIdPrefix = "MyCreationsTab",
				items = items,
				hasDisplayedItems = #displayedItems > 0,
				hasDisplayedResult = hasDisplayedResult,
				hasPendingSummary = hasPendingSummary,
				listStatus = listStatus,
				failedLoadMore = failedLoadMore,
				retryLoadMore = retryLoadMore,
				loadError = mYCREATIONSLOADERROR,
				onOpenChat = p4.onOpenChat,
				leadingItems = var43
			})
		}
	else
		local t_1 = {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				leading = iconName.PlusLarge,
				title = mYCREATIONSNEWGAME,
				description = mYCREATIONSBUILDWITHAI,
				onActivated = var40
			})
		}
		
		if hasDisplayedResult and #displayedItems > 0 then
			for i_1, v in items do
				local var46 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. v.universeId else "S" .. v.sessionId
				
				if var23 then
					t_1[var46] = reactModule.createElement(var30, {
						LayoutOrder = i_1 + 1,
						sessionId = v.sessionId,
						universeId = v.universeId,
						placeId = v.placeId,
						experienceName = v.experienceName,
						creatorName = v.creatorName,
						description = v.description,
						visibilityLabel = v.visibilityLabel,
						gameIcon = v.gameIcon,
						onOpenChat = p4.onOpenChat
					})
				else
					local experienceName = v.experienceName
					local gameIcon = v.gameIcon
					local placeId = v.placeId
					local visibilityLabel = v.visibilityLabel
					t_1[var46] = reactModule.createElement(list.Item, {
						LayoutOrder = i_1 + 1,
						leading = { iconName = gameIcon },
						title = experienceName,
						description = v.description,
						testId = `MyCreationsTab.ExperienceRow.{v.universeId}`,
						onActivated = function()
							-- upvalues: p4 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
							p4.onOpenChat({
								universeId = v.universeId,
								placeId = placeId,
								sessionId = v.sessionId,
								experienceName = experienceName,
								creatorName = v.creatorName,
								gameIcon = gameIcon
							})
						end,
						trailing = if visibilityLabel ~= nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
							VisibilityBadge = reactModule.createElement(var10, {
								text = visibilityLabel,
								shape = var12.Box,
								size = var13.Small,
								variant = var14.Neutral,
								testId = `MyCreationsTab.VisibilityBadge.{v.universeId}`
							})
						})
					})
				end
			end
		elseif listStatus == "NotReady" or hasPendingSummary then
			for i = 1, var28 do
				t_1[`Loading{i}`] = var29(i, i + 1, var34)
			end
		elseif listStatus == "Failed" then
			t_1.Error = reactModule.createElement(list.Item, { LayoutOrder = 2, title = mYCREATIONSLOADERROR })
		end
		if failedLoadMore then
			t_1.LoadMoreError = reactModule.createElement(list.Item, {
				testId = "MyCreationsTab.LoadMoreError",
				LayoutOrder = #items + 2,
				title = mYCREATIONSLOADERROR,
				onActivated = retryLoadMore
			})
		end
		t = {
			ExperienceList = reactModule.createElement(list.Root, {
				hasDivider = false,
				isContained = { isContained = false, hasMargin = false },
				size = inputSize.Large
			}, t_1)
		}
	end
	local var47 = reactModule.createElement(view, {
		tag = "composition-content-body col size-full-0 auto-y",
		testId = "MyCreationsTab.ContentBody"
	}, t)
	
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = refresh,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var35 else nil,
		onCanvasPositionChangedCallback = loadMoreIfNeeded,
		onCanvasSizeChangedCallback = loadMoreIfNeeded,
		createFooter = var42,
		scrollingElementProps = {
			LayoutOrder = p4.LayoutOrder,
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
		}, { ContentBody = var47 })
	} else { ContentBody = var47 })
end