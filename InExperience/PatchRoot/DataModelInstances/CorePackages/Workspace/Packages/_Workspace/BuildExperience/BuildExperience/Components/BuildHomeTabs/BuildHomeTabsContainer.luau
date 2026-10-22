local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local BuildHomeTabsViewModule = require(script.Parent.BuildHomeTabsView)
local GamesFilterModule = require(BuildExperience.Stores.GetMyCreationsFilterStore.GamesFilter)
local GetPreviewsFilterStoreModule = require(BuildExperience.Stores.GetPreviewsFilterStore)
local MyCreationsFilterContainerModule = require(BuildExperience.Components.MyCreationsFilter.MyCreationsFilterContainer)
local PreviewsTabViewModule = require(BuildExperience.Components.PreviewsTab.PreviewsTabView)
local UseBuildHomeTabsViewModelModule = require(script.Parent.useBuildHomeTabsViewModel)
local UsePreviewResultsModule = require(BuildExperience.Components.PreviewsTab.usePreviewResults)
local UsePreviewsTabViewModelModule = require(BuildExperience.Components.PreviewsTab.usePreviewsTabViewModel)
local Options = {
	GamesFilterModule.All,
	GamesFilterModule.GroupGames,
	GamesFilterModule.SharedGames
}
local DefaultFilter = { games = GamesFilterModule.All }

return function(Frame)
	-- upvalues: GetPreviewsFilterStoreModule (copy), UsePreviewResultsModule (copy), UseBuildHomeTabsViewModelModule (copy), DefaultFilter (copy), DataHydrationModule (copy), UsePreviewsTabViewModelModule (copy), ReactModule (copy), BuildHomeTabsViewModule (copy), PreviewsTabViewModule (copy), MyCreationsFilterContainerModule (copy), Options (copy)
	local CreatorGroupsStore = Frame.creatorGroupsStore
	local PreviewsFilterStore = Frame.previewsFilterStore or GetPreviewsFilterStoreModule()
	local UseFilterResult = PreviewsFilterStore.useFilter()
	local UsePreviewResultsModuleResult = UsePreviewResultsModule({
		searchStore = Frame.searchStore,
		creatorGroupsStore = CreatorGroupsStore,
		filter = UseFilterResult,
		isFocused = Frame.isFocused
	})
	local UseBuildHomeTabsViewModelModuleResult = UseBuildHomeTabsViewModelModule({
		hasPreviews = UsePreviewResultsModuleResult.hasPreviews,
		isPreviewsFiltered = UseFilterResult.games ~= DefaultFilter.games,
		isPreviewsLoading = UsePreviewResultsModuleResult.status == DataHydrationModule.DataStatus.NotReady,
		tabStore = Frame.tabStore
	})
	local UsePreviewsTabViewModelModuleResult = UsePreviewsTabViewModelModule({ results = UsePreviewResultsModuleResult })
	
	return ReactModule.createElement(BuildHomeTabsViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		showTabs = UseBuildHomeTabsViewModelModuleResult.showTabs,
		activeTab = UseBuildHomeTabsViewModelModuleResult.activeTab,
		tabs = UseBuildHomeTabsViewModelModuleResult.tabs,
		onTabActivated = UseBuildHomeTabsViewModelModuleResult.onTabActivated,
		layoutRef = UseBuildHomeTabsViewModelModuleResult.layoutRef,
		isSliding = UseBuildHomeTabsViewModelModuleResult.isSliding,
		tabOrder = UseBuildHomeTabsViewModelModuleResult.tabOrder,
		onStopped = UseBuildHomeTabsViewModelModuleResult.onStopped,
		gamesContent = Frame.gamesContent,
		previewsContent = ReactModule.createElement(PreviewsTabViewModule, {
			rows = UsePreviewsTabViewModelModuleResult.rows,
			listStatus = UsePreviewsTabViewModelModuleResult.listStatus,
			loadError = UsePreviewsTabViewModelModuleResult.loadError,
			isLoadingMore = UsePreviewsTabViewModelModuleResult.isLoadingMore,
			failedLoadMore = UsePreviewsTabViewModelModuleResult.failedLoadMore,
			refresh = UsePreviewsTabViewModelModuleResult.refresh,
			loadMoreIfNeeded = UsePreviewsTabViewModelModuleResult.loadMoreIfNeeded,
			retryLoadMore = UsePreviewsTabViewModelModuleResult.retryLoadMore,
			filterHeader = ReactModule.createElement(MyCreationsFilterContainerModule, {
				LayoutOrder = 0,
				testId = "PreviewsFilterView",
				filterStore = PreviewsFilterStore,
				creatorGroupsStore = CreatorGroupsStore,
				groups = UsePreviewResultsModuleResult.previewGroups,
				defaultFilter = DefaultFilter,
				options = Options
			})
		})
	})
end