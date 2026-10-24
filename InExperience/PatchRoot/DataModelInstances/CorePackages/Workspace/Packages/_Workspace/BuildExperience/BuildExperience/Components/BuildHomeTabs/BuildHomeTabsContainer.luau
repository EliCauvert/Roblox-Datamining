local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local BuildHomeTabsViewModule = require(script.Parent.BuildHomeTabsView)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
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
local DefaultFilter = { games = GamesFilterModule.SharedGames }

return function(Frame)
	-- upvalues: GetPreviewsFilterStoreModule (copy), UsePreviewResultsModule (copy), UseBuildHomeTabsViewModelModule (copy), UsePreviewsTabViewModelModule (copy), ReactModule (copy), BuildHomeTabsViewModule (copy), PreviewsTabViewModule (copy), MyCreationsFilterContainerModule (copy), DefaultFilter (copy), Options (copy)
	local CreatorGroupsStore = Frame.creatorGroupsStore
	local PreviewsFilterStore = Frame.previewsFilterStore or GetPreviewsFilterStoreModule()
	local UsePreviewResultsModuleResult = UsePreviewResultsModule({
		searchStore = Frame.searchStore,
		creatorGroupsStore = CreatorGroupsStore,
		filter = PreviewsFilterStore.useFilter(),
		isFocused = Frame.isFocused
	})
	local UseBuildHomeTabsViewModelModuleResult = UseBuildHomeTabsViewModelModule({
		tabStore = Frame.tabStore,
		searchQueryStore = Frame.searchQueryStore
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
			emptyText = UsePreviewsTabViewModelModuleResult.emptyText,
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