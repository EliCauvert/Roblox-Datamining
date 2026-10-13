local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local fFlagBuildExperienceMyCreationsCreateGameButtonModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsCreateGameButton)
local fFlagBuildExperienceMyCreationsLongPressMenuModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local fFlagBuildExperienceStableMyCreationsListItemsModule = require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local fFlagBuildWithGroupsModule = require(buildExperience.Flags.FFlagBuildWithGroups)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(parent.DataHydration.CreatorAgentChat)
local _ = require(parent.DataHydration.UniverseConfiguration)
local _ = require(parent.DataHydration.UniverseSearch)
local button = foundationModule.Button
local list = foundationModule.List
local view = foundationModule.View
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local listItemInputType = foundationModule.Enums.ListItemInputType
local var1 = if fFlagBuildExperienceMyCreationsLongPressMenuModule then "MyCreationsTab.NewGameRow" else nil
local searchEmptyStateModule = require(buildExperience.Components.SearchEmptyState.SearchEmptyState)
local buildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local chatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local getMyCreationsFilterStoreModule = require(script.Parent.Parent.Parent.Stores.GetMyCreationsFilterStore)
local getSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local useScrollPerformanceTrackerModule = require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker)
local experienceResultsListModule = require(script.Parent.ExperienceResultsList)
local experienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local myCreationsFilterContainerModule = require(buildExperience.Components.MyCreationsFilter.MyCreationsFilterContainer)
local useMyCreationsResultsModule = require(script.Parent.useMyCreationsResults)

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceMyCreationsCreateGameButtonModule (ref), getSearchQueryStoreModule (ref), reactModule (ref), useScrollPerformanceTrackerModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), fFlagBuildWithGroupsModule (ref), getMyCreationsFilterStoreModule (ref), useMyCreationsResultsModule (ref), chatConstantsModule (ref), playersService (ref), fFlagBuildExperienceMyCreationsLongPressMenuModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), listItemInputType (ref), experienceResultsLoadingSkeletonModule (ref), list (ref), iconName (ref), var1 (ref), searchEmptyStateModule (ref), view (ref), inputSize (ref), buildEmptyStateModule (ref), experienceResultsListModule (ref), refreshScrollingFrame (ref), myCreationsFilterContainerModule (ref), button (ref), buttonVariant (ref)
	local var2
	local var3 = useLocalization({
		building = localizationStringsModule.MY_CREATIONS_BUILDING,
		buildWithAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI,
		createNewGame = if fFlagBuildExperienceMyCreationsCreateGameButtonModule then localizationStringsModule.MY_CREATIONS_CREATE_NEW_GAME else nil,
		inputNeeded = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		newGame = localizationStringsModule.MY_CREATIONS_NEW_GAME,
		private = localizationStringsModule.MY_CREATIONS_PRIVATE,
		["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = localizationStringsModule.MY_CREATIONS_READY,
		restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
	})
	local buildWithAI = var3.buildWithAI
	local createNewGame = var3.createNewGame
	local loadError = var3.loadError
	local newGame = var3.newGame
	local searchQueryStore = p1.searchQueryStore or getSearchQueryStoreModule()
	local var4 = p1.isFocused ~= false
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	useScrollPerformanceTrackerModule("LuaApp_Build_Home_Scroll", var5)
	local var7 = searchQueryStore.useShowEmptyState()
	local var8 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then searchQueryStore.useDraftQuery() else nil
	local var9 = if fFlagBuildWithGroupsModule then p1.filterStore or getMyCreationsFilterStoreModule() else nil
	local var10 = useMyCreationsResultsModule({
		creatorAgentChatStore = p1.creatorAgentChatStore,
		creatorGroupsStore = p1.creatorGroupsStore,
		configurationStore = p1.configurationStore,
		searchStore = p1.searchStore,
		searchQueryStore = searchQueryStore,
		appLifecycleObserverService = p1.appLifecycleObserverService,
		isFocused = var4,
		pollingIntervalSeconds = p1.pollingIntervalSeconds,
		userId = p1.userId,
		filter = if fFlagBuildWithGroupsModule then var9.useFilter() else nil
	})
	local displayedItems = var10.displayedItems
	local items = var10.items
	local hasPendingSummary = var10.hasPendingSummary
	local listStatus = var10.listStatus
	local sourceItemCount = var10.sourceItemCount
	local hasDisplayedResult = var10.hasDisplayedResult
	local failedLoadMore = var10.failedLoadMore
	local retryLoadMore = var10.retryLoadMore
	local refresh = var10.refresh
	local loadMoreIfNeeded = var10.loadMoreIfNeeded
	local var11 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), p1 (ref), chatConstantsModule (copy), playersService (copy)
		var6.current = true
		p1.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p1.onOpenChat })
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule then
		var2 = var10.hasCompletedFocusedRefresh
		
		if var2 then
			var2 = false
			
			if var10.sessionListStatus == "Ready" then
				var2 = false
				
				if var10.sessionCount == 0 then
					var2 = var8 == ""
					var2 = nil
				end
			end
		end
	else
		var2 = var10.hasCompletedFocusedRefresh and (listStatus == "Ready" and sourceItemCount == 0)
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var2 (ref), var6 (ref), var11 (ref)
		if p1.autoOpenNewGame ~= false and var4 and (var2 and not var6.current) then
			var11()
		end
	end, { var2, var11, var4, p1.autoOpenNewGame })
	local var12 = if fFlagBuildExperienceMyCreationsLongPressMenuModule and fFlagBuildExperienceStableMyCreationsListItemsModule and p1.onOpenConfigurationPage ~= nil then listItemInputType.None else nil
	local var13 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), reactModule (copy), experienceResultsLoadingSkeletonModule (copy)
		return if var10.isLoadingMore then reactModule.createElement(experienceResultsLoadingSkeletonModule, {
			LayoutOrder = 1,
			index = 1,
			testIdPrefix = "MyCreationsTab"
		}) else nil
	end, { var10.isLoadingMore })
	local _ = nil
	local createElement = reactModule.createElement
	createElement = createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = refresh,
		ref = var5,
		onCanvasPositionChangedCallback = loadMoreIfNeeded,
		onCanvasSizeChangedCallback = loadMoreIfNeeded,
		createFooter = var13,
		scrollingElementProps = {
			LayoutOrder = if fFlagBuildExperienceMyCreationsCreateGameButtonModule or fFlagBuildWithGroupsModule then 1 else p1.LayoutOrder,
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
		ContentLayout = reactModule.createElement(view, {
			testId = "MyCreationsTab.ContentLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, {
			ContentBody = reactModule.createElement(view, {
				tag = "composition-content-body col size-full-0 auto-y",
				testId = "MyCreationsTab.ContentBody"
			}, if var7 then {
				SearchEmptyState = reactModule.createElement(searchEmptyStateModule, { testId = "MyCreationsTab.SearchEmptyState" })
			} elseif hasDisplayedResult and not hasPendingSummary and #displayedItems == 0 then {
				EmptyContent = reactModule.createElement(view, { tag = "col size-full" }, {
					CreateList = if fFlagBuildExperienceMyCreationsCreateGameButtonModule then nil else reactModule.createElement(list.Root, {
						LayoutOrder = 1,
						hasDivider = false,
						isContained = { isContained = false, hasMargin = false },
						size = inputSize.Large
					}, {
						CreateRow = reactModule.createElement(list.Item, {
							LayoutOrder = 1,
							leading = iconName.PlusLarge,
							title = newGame,
							description = buildWithAI,
							testId = var1,
							onActivated = var11,
							input = var12
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
			} else {
				ExperienceList = reactModule.createElement(experienceResultsListModule, {
					firstResultLayoutOrder = 2,
					testIdPrefix = "MyCreationsTab",
					items = items,
					hasDisplayedItems = #displayedItems > 0,
					hasDisplayedResult = hasDisplayedResult,
					hasPendingSummary = hasPendingSummary,
					listStatus = listStatus,
					failedLoadMore = failedLoadMore,
					retryLoadMore = retryLoadMore,
					loadError = loadError,
					onOpenChat = p1.onOpenChat,
					onOpenConfigurationPage = p1.onOpenConfigurationPage,
					leadingItems = if fFlagBuildExperienceMyCreationsCreateGameButtonModule then nil else reactModule.useMemo(function()
						-- upvalues: reactModule (copy), list (copy), iconName (copy), newGame (ref), buildWithAI (ref), var1 (copy), var11 (ref), var12 (ref)
						return {
							CreateRow = reactModule.createElement(list.Item, {
								LayoutOrder = 1,
								leading = iconName.PlusLarge,
								title = newGame,
								description = buildWithAI,
								testId = var1,
								onActivated = var11,
								input = var12
							})
						}
					end, { buildWithAI, var11, newGame, var12 })
				})
			})
		})
	})
	local var14 = if fFlagBuildWithGroupsModule then reactModule.createElement(myCreationsFilterContainerModule, {
		LayoutOrder = 0,
		filterStore = var9,
		creatorGroupsStore = p1.creatorGroupsStore
	}) else nil
	
	return if fFlagBuildExperienceMyCreationsCreateGameButtonModule then reactModule.createElement(view, { tag = "col fill size-full", LayoutOrder = p1.LayoutOrder }, {
		Filter = var14,
		Results = createElement,
		CreateGameFooter = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "MyCreationsTab.CreateGameLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, {
			CreateGameBody = reactModule.createElement(view, {
				tag = "composition-content-body col size-full-0 auto-y padding-y-medium"
			}, {
				CreateGameButton = reactModule.createElement(button, {
					testId = "MyCreationsTab.CreateGameButton",
					text = createNewGame,
					onActivated = var11,
					variant = buttonVariant.Emphasis,
					size = inputSize.Medium,
					width = UDim.new(1, 0)
				})
			})
		})
	}) elseif var14 == nil then createElement else reactModule.createElement(view, { tag = "col fill size-full", LayoutOrder = p1.LayoutOrder }, { Filter = var14, Results = createElement })
end