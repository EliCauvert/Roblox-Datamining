local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = game:GetService("AppLifecycleObserverService")
local Players = game:GetService("Players")
local FFlagBuildExperienceMyCreationsCreateGameButtonModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsCreateGameButton)
local FFlagBuildExperienceMyCreationsLongPressMenuModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local FFlagBuildExperienceMyCreationsUseUniverseListModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local FFlagBuildWithGroupsModule = require(BuildExperience.Flags.FFlagBuildWithGroups)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(Parent.DataHydration.UniverseConfiguration)
local _ = require(Parent.DataHydration.UniverseSearch)
local Button = FoundationModule.Button
local List = FoundationModule.List
local View = FoundationModule.View
local RefreshScrollingFrame = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.RefreshScrollingFrame
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local ListItemInputType = FoundationModule.Enums.ListItemInputType
local MyCreationsTabNewGameRow = if FFlagBuildExperienceMyCreationsLongPressMenuModule then "MyCreationsTab.NewGameRow" else nil
local BuildEmptyStateModule = require(BuildExperience.Components.BuildEmptyState.BuildEmptyState)
local SearchEmptyStateModule = require(BuildExperience.Components.SearchEmptyState.SearchEmptyState)
local ChatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local GetMyCreationsFilterStoreModule = require(script.Parent.Parent.Parent.Stores.GetMyCreationsFilterStore)
local GetSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local UseScrollPerformanceTrackerModule = require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker)
local ExperienceResultsListModule = require(script.Parent.ExperienceResultsList)
local ExperienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local MyCreationsFilterContainerModule = require(BuildExperience.Components.MyCreationsFilter.MyCreationsFilterContainer)
local UseMyCreationsResultsModule = require(script.Parent.useMyCreationsResults)

return function(Frame: Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceMyCreationsCreateGameButtonModule (copy), GetSearchQueryStoreModule (copy), ReactModule (copy), UseScrollPerformanceTrackerModule (copy), FFlagBuildWithGroupsModule (copy), FFlagBuildExperienceMyCreationsUseUniverseListModule (copy), GetMyCreationsFilterStoreModule (copy), UseMyCreationsResultsModule (copy), ChatConstantsModule (copy), Players (copy), FFlagBuildExperienceMyCreationsLongPressMenuModule (copy), ListItemInputType (copy), ExperienceResultsLoadingSkeletonModule (copy), List (copy), IconName (copy), MyCreationsTabNewGameRow (copy), SearchEmptyStateModule (copy), View (copy), InputSize (copy), BuildEmptyStateModule (copy), ExperienceResultsListModule (copy), RefreshScrollingFrame (copy), MyCreationsFilterContainerModule (copy), Button (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		building = LocalizationStringsModule.MY_CREATIONS_BUILDING,
		buildWithAI = LocalizationStringsModule.MY_CREATIONS_BUILD_WITH_AI,
		createNewGame = if FFlagBuildExperienceMyCreationsCreateGameButtonModule then LocalizationStringsModule.MY_CREATIONS_CREATE_NEW_GAME else nil,
		inputNeeded = LocalizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = LocalizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		newGame = LocalizationStringsModule.MY_CREATIONS_NEW_GAME,
		noGames = LocalizationStringsModule.MY_CREATIONS_NO_GAMES,
		private = LocalizationStringsModule.MY_CREATIONS_PRIVATE,
		public = LocalizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = LocalizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = LocalizationStringsModule.MY_CREATIONS_READY,
		restricted = LocalizationStringsModule.MY_CREATIONS_RESTRICTED
	})
	local BuildWithAI = UseLocalizationResult.buildWithAI
	local CreateNewGame = UseLocalizationResult.createNewGame
	local LoadError = UseLocalizationResult.loadError
	local NewGame = UseLocalizationResult.newGame
	local NoGames = UseLocalizationResult.noGames
	local SearchQueryStore = Frame.searchQueryStore or GetSearchQueryStoreModule()
	local IsIsFocused = Frame.isFocused ~= false
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	UseScrollPerformanceTrackerModule("LuaApp_Build_Home_Scroll", UseRefResult)
	local UseShowEmptyStateResult = SearchQueryStore.useShowEmptyState()
	local UseIsSearchActiveResult = if FFlagBuildWithGroupsModule or FFlagBuildExperienceMyCreationsCreateGameButtonModule then SearchQueryStore.useIsSearchActive() else false
	local UseDraftQueryResult = if FFlagBuildExperienceMyCreationsUseUniverseListModule then SearchQueryStore.useDraftQuery() else nil
	local FilterStore = if FFlagBuildWithGroupsModule then Frame.filterStore or GetMyCreationsFilterStoreModule() else nil
	local UseFilterResult = if FFlagBuildWithGroupsModule then FilterStore.useFilter() else nil
	local UseMyCreationsResultsModuleResult = UseMyCreationsResultsModule({
		creatorAgentChatStore = Frame.creatorAgentChatStore,
		creatorGroupsStore = Frame.creatorGroupsStore,
		configurationStore = Frame.configurationStore,
		searchStore = Frame.searchStore,
		searchQueryStore = SearchQueryStore,
		appLifecycleObserverService = Frame.appLifecycleObserverService,
		isFocused = IsIsFocused,
		pollingIntervalSeconds = Frame.pollingIntervalSeconds,
		userId = Frame.userId,
		filter = if UseIsSearchActiveResult then nil else UseFilterResult
	})
	local DisplayedItems = UseMyCreationsResultsModuleResult.displayedItems
	local Items = UseMyCreationsResultsModuleResult.items
	local HasPendingSummary = UseMyCreationsResultsModuleResult.hasPendingSummary
	local ListStatus = UseMyCreationsResultsModuleResult.listStatus
	local SourceItemCount = UseMyCreationsResultsModuleResult.sourceItemCount
	local HasDisplayedResult = UseMyCreationsResultsModuleResult.hasDisplayedResult
	local FailedLoadMore = UseMyCreationsResultsModuleResult.failedLoadMore
	local RetryLoadMore = UseMyCreationsResultsModuleResult.retryLoadMore
	local Refresh = UseMyCreationsResultsModuleResult.refresh
	local LoadMoreIfNeeded = UseMyCreationsResultsModuleResult.loadMoreIfNeeded
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), Frame (copy), ChatConstantsModule (upval), Players (upval)
		UseRefResult1.current = true
		Frame.onOpenChat({
			isNewGameTarget = true,
			experienceName = ChatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if Players.LocalPlayer then Players.LocalPlayer.Name else nil
		})
	end, { Frame.onOpenChat })
	local IsUseDraftQueryResultMatch: boolean = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseMyCreationsResultsModuleResult.hasCompletedFocusedRefresh and (UseMyCreationsResultsModuleResult.sessionListStatus == "Ready" and UseMyCreationsResultsModuleResult.sessionCount == 0 and UseDraftQueryResult == "") else UseMyCreationsResultsModuleResult.hasCompletedFocusedRefresh and (ListStatus == "Ready" and SourceItemCount == 0)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), IsIsFocused (copy), IsUseDraftQueryResultMatch (copy), UseRefResult1 (copy), UseResult (copy)
		if Frame.autoOpenNewGame ~= false and IsIsFocused and IsUseDraftQueryResultMatch and not UseRefResult1.current then
			UseResult()
		end
	end, {
		IsUseDraftQueryResultMatch,
		UseResult,
		IsIsFocused,
		Frame.autoOpenNewGame
	})
	local None = if FFlagBuildExperienceMyCreationsLongPressMenuModule and Frame.onOpenConfigurationPage ~= nil then ListItemInputType.None else nil
	local UseMemoResult = if FFlagBuildExperienceMyCreationsCreateGameButtonModule then nil else ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), List (upval), IconName (upval), NewGame (copy), BuildWithAI (copy), MyCreationsTabNewGameRow (upval), UseResult (copy), None (copy)
		return {
			CreateRow = ReactModule.createElement(List.Item, {
				LayoutOrder = 1,
				leading = IconName.PlusLarge,
				title = NewGame,
				description = BuildWithAI,
				testId = MyCreationsTabNewGameRow,
				onActivated = UseResult,
				input = None
			})
		}
	end, { BuildWithAI, UseResult, NewGame, None })
	local Element = ReactModule.createElement(RefreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = Refresh,
		ref = UseRefResult,
		onCanvasPositionChangedCallback = LoadMoreIfNeeded,
		onCanvasSizeChangedCallback = LoadMoreIfNeeded,
		createFooter = ReactModule.useCallback(function()
			-- upvalues: UseMyCreationsResultsModuleResult (copy), ReactModule (upval), ExperienceResultsLoadingSkeletonModule (upval)
			return if UseMyCreationsResultsModuleResult.isLoadingMore then ReactModule.createElement(ExperienceResultsLoadingSkeletonModule, {
				LayoutOrder = 1,
				index = 1,
				testIdPrefix = "MyCreationsTab"
			}) else nil
		end, { UseMyCreationsResultsModuleResult.isLoadingMore }),
		scrollingElementProps = {
			LayoutOrder = if FFlagBuildExperienceMyCreationsCreateGameButtonModule or FFlagBuildWithGroupsModule then 1 else Frame.LayoutOrder,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.new(1, 0, 1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[ReactModule.Tag] = "fill"
		}
	}, {
		ContentLayout = ReactModule.createElement(View, {
			testId = "MyCreationsTab.ContentLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, {
			ContentBody = ReactModule.createElement(View, {
				tag = "composition-content-body col size-full-0 auto-y",
				testId = "MyCreationsTab.ContentBody"
			}, if UseShowEmptyStateResult then {
				SearchEmptyState = ReactModule.createElement(SearchEmptyStateModule, { testId = "MyCreationsTab.SearchEmptyState" })
			} elseif HasDisplayedResult and not HasPendingSummary and #DisplayedItems == 0 then {
				EmptyContent = ReactModule.createElement(View, { tag = "col size-full" }, {
					CreateList = if FFlagBuildExperienceMyCreationsCreateGameButtonModule then nil else ReactModule.createElement(List.Root, {
						LayoutOrder = 1,
						hasDivider = false,
						isContained = { isContained = false, hasMargin = false },
						size = InputSize.Large
					}, {
						CreateRow = ReactModule.createElement(List.Item, {
							LayoutOrder = 1,
							leading = IconName.PlusLarge,
							title = NewGame,
							description = BuildWithAI,
							testId = MyCreationsTabNewGameRow,
							onActivated = UseResult,
							input = None
						})
					}),
					EmptyState = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "col align-x-center align-y-center fill size-full-0 padding-large",
						testId = "MyCreationsTab.Empty"
					}, {
						Content = ReactModule.createElement(BuildEmptyStateModule, {
							message = if FFlagBuildWithGroupsModule then NoGames else nil
						})
					})
				})
			} else {
				ExperienceList = ReactModule.createElement(ExperienceResultsListModule, {
					firstResultLayoutOrder = 2,
					testIdPrefix = "MyCreationsTab",
					items = Items,
					hasDisplayedItems = #DisplayedItems > 0,
					hasDisplayedResult = HasDisplayedResult,
					hasPendingSummary = HasPendingSummary,
					listStatus = ListStatus,
					failedLoadMore = FailedLoadMore,
					retryLoadMore = RetryLoadMore,
					loadError = LoadError,
					onOpenChat = Frame.onOpenChat,
					onOpenConfigurationPage = Frame.onOpenConfigurationPage,
					leadingItems = UseMemoResult
				})
			})
		})
	})
	local Element1 = if FFlagBuildWithGroupsModule then ReactModule.createElement(MyCreationsFilterContainerModule, {
		LayoutOrder = 0,
		filterStore = FilterStore,
		creatorGroupsStore = Frame.creatorGroupsStore
	}) else nil
	
	if FFlagBuildExperienceMyCreationsCreateGameButtonModule then
		local Element2 = ReactModule.createElement(View, {
			tag = "composition-content-body col size-full-0 auto-y padding-y-medium"
		}, {
			CreateGameButton = ReactModule.createElement(Button, {
				testId = "MyCreationsTab.CreateGameButton",
				text = CreateNewGame,
				onActivated = UseResult,
				variant = ButtonVariant.Emphasis,
				size = InputSize.Medium,
				width = UDim.new(1, 0)
			})
		})
		
		return ReactModule.createElement(View, {
			tag = "col fill size-full",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Filter = if UseIsSearchActiveResult then nil else Element1,
			Results = Element,
			CreateGameFooter = if UseIsSearchActiveResult then nil else ReactModule.createElement(View, {
				LayoutOrder = 2,
				testId = "MyCreationsTab.CreateGameLayout",
				tag = {
					["composition-layout-detail"] = true,
					["size-full-0 auto-y"] = true
				}
			}, { CreateGameBody = Element2 })
		})
	else
		return if Element1 == nil then Element else ReactModule.createElement(View, {
			tag = "col fill size-full",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Filter = if UseIsSearchActiveResult then nil else Element1,
			Results = Element
		})
	end
end