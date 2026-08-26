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
local var1 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Badge else nil
local list = foundationModule.List
local var2 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Skeleton else nil
local view = foundationModule.View
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local var3 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.BadgeShape else nil
local var4 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.BadgeSize else nil
local var5 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.BadgeVariant else nil
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local var6 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Enums.Radius else nil
local var7 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then foundationModule.Hooks.useTokens else nil
local var8 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(buildExperience.Components.SearchEmptyState.SearchEmptyState) else nil
local buildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local chatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local getSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(script.Parent.Parent.Parent.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local var9 = not fFlagBuildAddSearchIconAndMoveSearchbarModule and require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var10 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
local var11 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.ExperienceResultsList) else nil
local var12 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.ExperienceResultsLoadingSkeleton) else nil
local useMyCreationsResultsModule = require(script.Parent.useMyCreationsResults)
local var13 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then 2 else nil
local var14 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then function(p1, p2, p3)
	-- upvalues: reactModule (ref), view (ref), var2 (ref), var6 (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = p2,
		Size = UDim2.new(1, 0, 0, p3.Size.Size_2000),
		testId = `MyCreationsTab.LoadingSkeleton.{p1}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p3.Size.Size_1400, p3.Size.Size_1400)
		}, {
			Thumbnail = reactModule.createElement(var2, { Size = UDim2.fromScale(1, 1), radius = var6.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(var2, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p3.Size.Size_400),
				radius = var6.Small
			}),
			Description = reactModule.createElement(var2, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p3.Size.Size_250),
				radius = var6.Small
			})
		})
	})
end else nil
local var15 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), var1 (ref), var3 (ref), var4 (ref), var5 (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p1.LayoutOrder,
		leading = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return { type = nil, iconVariant = nil, iconName = p1.gameIcon }
		end, { p1.gameIcon }),
		title = p1.experienceName,
		description = p1.description,
		testId = `MyCreationsTab.ExperienceRow.{p1.universeId}`,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.onOpenChat({
				universeId = p1.universeId,
				placeId = p1.placeId,
				sessionId = p1.sessionId,
				experienceName = p1.experienceName,
				creatorName = p1.creatorName,
				gameIcon = p1.gameIcon
			})
		end, {
			p1.creatorName, p1.experienceName, p1.gameIcon, p1.onOpenChat, p1.placeId,
			p1.sessionId, p1.universeId
		}),
		trailing = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), view (copy), var1 (copy), var3 (copy), var4 (copy), var5 (copy)
			return if p1.visibilityLabel == nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(var1, {
					text = p1.visibilityLabel,
					shape = var3.Box,
					size = var4.Small,
					variant = var5.Neutral,
					testId = `MyCreationsTab.VisibilityBadge.{p1.universeId}`
				})
			})
		end, { p1.universeId, p1.visibilityLabel })
	})
end) else nil

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), getSearchQueryStoreModule (ref), fFlagBuildAddSearchIconAndMoveSearchbarModule (ref), var7 (ref), reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var10 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), useMyCreationsResultsModule (ref), chatConstantsModule (ref), playersService (ref), var12 (ref), var14 (ref), list (ref), iconName (ref), var8 (ref), view (ref), inputSize (ref), buildEmptyStateModule (ref), var11 (ref), var9 (ref), var15 (ref), var1 (ref), var3 (ref), var4 (ref), var5 (ref), var13 (ref), refreshScrollingFrame (ref), fFlagBuildDesktopReadinessModule (ref)
	local mYCREATIONSBUILDWITHAI, mYCREATIONSLOADERROR, mYCREATIONSNEWGAME
	local var16 = if fFlagBuildLocalization then useLocalization({
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
		mYCREATIONSBUILDWITHAI = var16.buildWithAI
		mYCREATIONSLOADERROR = var16.loadError
		mYCREATIONSNEWGAME = var16.newGame
	else
		mYCREATIONSBUILDWITHAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI
		mYCREATIONSLOADERROR = localizationStringsModule.MY_CREATIONS_LOAD_ERROR
		mYCREATIONSNEWGAME = localizationStringsModule.MY_CREATIONS_NEW_GAME
	end
	local searchQueryStore = p1.searchQueryStore or getSearchQueryStoreModule()
	local var17 = p1.isFocused ~= false
	local var18 = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then var7() else nil
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var10("LuaApp_Build_Home_Scroll", var19)
	end
	local var21
	local var22 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then searchQueryStore.useShowEmptyState() else false
	local var23 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then searchQueryStore.useDraftQuery() else nil
	local var24 = useMyCreationsResultsModule({
		creatorAgentChatStore = p1.creatorAgentChatStore,
		configurationStore = p1.configurationStore,
		searchStore = p1.searchStore,
		searchQueryStore = searchQueryStore,
		appLifecycleObserverService = p1.appLifecycleObserverService,
		isFocused = var17,
		pollingIntervalSeconds = p1.pollingIntervalSeconds,
		userId = p1.userId
	})
	local displayedItems = var24.displayedItems
	local items = var24.items
	local hasPendingSummary = var24.hasPendingSummary
	local listStatus = var24.listStatus
	local sourceItemCount = var24.sourceItemCount
	local hasDisplayedResult = var24.hasDisplayedResult
	local failedLoadMore = var24.failedLoadMore
	local retryLoadMore = var24.retryLoadMore
	local refresh = var24.refresh
	local loadMoreIfNeeded = var24.loadMoreIfNeeded
	local var25 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), p1 (ref), chatConstantsModule (copy), playersService (copy)
		var20.current = true
		p1.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p1.onOpenChat })
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule then
		var21 = var24.hasCompletedFocusedRefresh
		
		if var21 then
			var21 = false
			
			if var24.sessionListStatus == "Ready" then
				var21 = false
				
				if var24.sessionCount == 0 then
					var21 = var23 == ""
					var21 = nil
				end
			end
		end
	else
		var21 = var24.hasCompletedFocusedRefresh and (listStatus == "Ready" and sourceItemCount == 0)
	end
	local t
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var17 (ref), var21 (ref), var20 (ref), var25 (ref)
		if p1.autoOpenNewGame ~= false and var17 and (var21 and not var20.current) then
			var25()
		end
	end, { var21, var25, var17, p1.autoOpenNewGame })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), fFlagBuildAddSearchIconAndMoveSearchbarModule (copy), reactModule (copy), var12 (copy), var14 (copy), var18 (ref)
		return if var24.isLoadingMore then if fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.createElement(var12, {
			LayoutOrder = 1,
			index = 1,
			testIdPrefix = "MyCreationsTab"
		}) else var14(1, 1, var18) else nil
	end, { var24.isLoadingMore, var18 })
	local var27 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), list (copy), iconName (copy), mYCREATIONSNEWGAME (write), mYCREATIONSBUILDWITHAI (write), var25 (ref)
		return {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				leading = iconName.PlusLarge,
				title = mYCREATIONSNEWGAME,
				description = mYCREATIONSBUILDWITHAI,
				onActivated = var25
			})
		}
	end, { mYCREATIONSBUILDWITHAI, var25, mYCREATIONSNEWGAME }) else nil
	local _ = nil
	
	if var22 then
		t = {
			SearchEmptyState = reactModule.createElement(var8, { testId = "MyCreationsTab.SearchEmptyState" })
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
						onActivated = var25
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
			ExperienceList = reactModule.createElement(var11, {
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
				onOpenChat = p1.onOpenChat,
				leadingItems = var27
			})
		}
	else
		local t_1 = {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				leading = iconName.PlusLarge,
				title = mYCREATIONSNEWGAME,
				description = mYCREATIONSBUILDWITHAI,
				onActivated = var25
			})
		}
		
		if hasDisplayedResult and #displayedItems > 0 then
			for i_1, v in items do
				local var28 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. v.universeId else "S" .. v.sessionId
				
				if var9 then
					t_1[var28] = reactModule.createElement(var15, {
						LayoutOrder = i_1 + 1,
						sessionId = v.sessionId,
						universeId = v.universeId,
						placeId = v.placeId,
						experienceName = v.experienceName,
						creatorName = v.creatorName,
						description = v.description,
						visibilityLabel = v.visibilityLabel,
						gameIcon = v.gameIcon,
						onOpenChat = p1.onOpenChat
					})
				else
					local experienceName = v.experienceName
					local gameIcon = v.gameIcon
					local placeId = v.placeId
					local visibilityLabel = v.visibilityLabel
					t_1[var28] = reactModule.createElement(list.Item, {
						LayoutOrder = i_1 + 1,
						leading = { iconName = gameIcon },
						title = experienceName,
						description = v.description,
						testId = `MyCreationsTab.ExperienceRow.{v.universeId}`,
						onActivated = function()
							-- upvalues: p1 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
							p1.onOpenChat({
								universeId = v.universeId,
								placeId = placeId,
								sessionId = v.sessionId,
								experienceName = experienceName,
								creatorName = v.creatorName,
								gameIcon = gameIcon
							})
						end,
						trailing = if visibilityLabel ~= nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
							VisibilityBadge = reactModule.createElement(var1, {
								text = visibilityLabel,
								shape = var3.Box,
								size = var4.Small,
								variant = var5.Neutral,
								testId = `MyCreationsTab.VisibilityBadge.{v.universeId}`
							})
						})
					})
				end
			end
		elseif listStatus == "NotReady" or hasPendingSummary then
			for i = 1, var13 do
				t_1[`Loading{i}`] = var14(i, i + 1, var18)
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
	local var29 = reactModule.createElement(view, {
		tag = "composition-content-body col size-full-0 auto-y",
		testId = "MyCreationsTab.ContentBody"
	}, t)
	
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = refresh,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var19 else nil,
		onCanvasPositionChangedCallback = loadMoreIfNeeded,
		onCanvasSizeChangedCallback = loadMoreIfNeeded,
		createFooter = var26,
		scrollingElementProps = {
			LayoutOrder = p1.LayoutOrder,
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
		}, { ContentBody = var29 })
	} else { ContentBody = var29 })
end