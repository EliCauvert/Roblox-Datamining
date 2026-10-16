local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(parent.DataHydration.CreatorAgentChat)
local _ = require(parent.DataHydration.UniverseConfiguration)
local _ = require(parent.DataHydration.UniverseSearch)
local list = foundationModule.List
local view = foundationModule.View
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local searchEmptyStateModule = require(buildExperience.Components.SearchEmptyState.SearchEmptyState)
local buildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local chatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local getSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local useScrollPerformanceTrackerModule = require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker)
local experienceResultsListModule = require(script.Parent.ExperienceResultsList)
local experienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local useMyCreationsResultsModule = require(script.Parent.useMyCreationsResults)

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), getSearchQueryStoreModule (ref), reactModule (ref), useScrollPerformanceTrackerModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), useMyCreationsResultsModule (ref), chatConstantsModule (ref), playersService (ref), experienceResultsLoadingSkeletonModule (ref), list (ref), iconName (ref), searchEmptyStateModule (ref), view (ref), inputSize (ref), buildEmptyStateModule (ref), experienceResultsListModule (ref), refreshScrollingFrame (ref), fFlagBuildDesktopReadinessModule (ref)
	local var1
	local var2 = useLocalization({
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
	})
	local buildWithAI = var2.buildWithAI
	local loadError = var2.loadError
	local newGame = var2.newGame
	local searchQueryStore = p1.searchQueryStore or getSearchQueryStoreModule()
	local var3 = p1.isFocused ~= false
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(false)
	useScrollPerformanceTrackerModule("LuaApp_Build_Home_Scroll", var4)
	local var6 = searchQueryStore.useShowEmptyState()
	local var7 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then searchQueryStore.useDraftQuery() else nil
	local var8 = useMyCreationsResultsModule({
		creatorAgentChatStore = p1.creatorAgentChatStore,
		configurationStore = p1.configurationStore,
		searchStore = p1.searchStore,
		searchQueryStore = searchQueryStore,
		appLifecycleObserverService = p1.appLifecycleObserverService,
		isFocused = var3,
		pollingIntervalSeconds = p1.pollingIntervalSeconds,
		userId = p1.userId
	})
	local displayedItems = var8.displayedItems
	local items = var8.items
	local hasPendingSummary = var8.hasPendingSummary
	local listStatus = var8.listStatus
	local sourceItemCount = var8.sourceItemCount
	local hasDisplayedResult = var8.hasDisplayedResult
	local failedLoadMore = var8.failedLoadMore
	local retryLoadMore = var8.retryLoadMore
	local refresh = var8.refresh
	local loadMoreIfNeeded = var8.loadMoreIfNeeded
	local var9 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p1 (ref), chatConstantsModule (copy), playersService (copy)
		var5.current = true
		p1.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p1.onOpenChat })
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule then
		var1 = var8.hasCompletedFocusedRefresh
		
		if var1 then
			var1 = false
			
			if var8.sessionListStatus == "Ready" then
				var1 = false
				
				if var8.sessionCount == 0 then
					var1 = var7 == ""
					var1 = nil
				end
			end
		end
	else
		var1 = var8.hasCompletedFocusedRefresh and (listStatus == "Ready" and sourceItemCount == 0)
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var1 (ref), var5 (ref), var9 (ref)
		if p1.autoOpenNewGame ~= false and var3 and (var1 and not var5.current) then
			var9()
		end
	end, { var1, var9, var3, p1.autoOpenNewGame })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), reactModule (copy), experienceResultsLoadingSkeletonModule (copy)
		return if var8.isLoadingMore then reactModule.createElement(experienceResultsLoadingSkeletonModule, {
			LayoutOrder = 1,
			index = 1,
			testIdPrefix = "MyCreationsTab"
		}) else nil
	end, { var8.isLoadingMore })
	local _ = nil
	local var11 = reactModule.createElement(view, {
		tag = "composition-content-body col size-full-0 auto-y",
		testId = "MyCreationsTab.ContentBody"
	}, if var6 then {
		SearchEmptyState = reactModule.createElement(searchEmptyStateModule, { testId = "MyCreationsTab.SearchEmptyState" })
	} elseif hasDisplayedResult and not hasPendingSummary and #displayedItems == 0 then {
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
					title = newGame,
					description = buildWithAI,
					onActivated = var9
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
			leadingItems = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), list (copy), iconName (copy), newGame (ref), buildWithAI (ref), var9 (ref)
				return {
					CreateRow = reactModule.createElement(list.Item, {
						LayoutOrder = 1,
						leading = iconName.PlusLarge,
						title = newGame,
						description = buildWithAI,
						onActivated = var9
					})
				}
			end, { buildWithAI, var9, newGame })
		})
	})
	
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = refresh,
		ref = var4,
		onCanvasPositionChangedCallback = loadMoreIfNeeded,
		onCanvasSizeChangedCallback = loadMoreIfNeeded,
		createFooter = var10,
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
		}, { ContentBody = var11 })
	} else { ContentBody = var11 })
end