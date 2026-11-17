local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagBuildExperienceFoundationTabsModule = require(BuildExperience.Flags.FFlagBuildExperienceFoundationTabs)
local FFlagBuildExperienceHomeTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceHomeTelemetry)
local FFlagBuildUpdatedSearchUXForGAModule = require(BuildExperience.Flags.FFlagBuildUpdatedSearchUXForGA)
local BuildHomeTabsViewModule = require(script.Parent.BuildHomeTabsView)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local GamesFilterModule = require(BuildExperience.Stores.GetMyCreationsFilterStore.GamesFilter)
local GetPreviewsFilterStoreModule = require(BuildExperience.Stores.GetPreviewsFilterStore)
local MyCreationsFilterContainerModule = require(BuildExperience.Components.MyCreationsFilter.MyCreationsFilterContainer)
local PreviewsTabViewModule = require(BuildExperience.Components.PreviewsTab.PreviewsTabView)
local UseBuildHomeTabsFillBehaviorModule = require(script.Parent.useBuildHomeTabsFillBehavior)
local UseBuildHomeTabsViewModelModule = require(script.Parent.useBuildHomeTabsViewModel)
local UsePreviewResultsModule = require(BuildExperience.Components.PreviewsTab.usePreviewResults)
local UsePreviewsTabViewModelModule = require(BuildExperience.Components.PreviewsTab.usePreviewsTabViewModel)
local BUILDHOMETAB = require(BuildExperience.Stores.GetBuildHomeTabStore.createBuildHomeTabStore).BUILD_HOME_TAB
local Options = {
	GamesFilterModule.All,
	GamesFilterModule.GroupGames,
	GamesFilterModule.SharedGames
}
local DefaultFilter = { games = GamesFilterModule.SharedGames }

return function(Frame)
	-- upvalues: GetPreviewsFilterStoreModule (copy), UseBuildHomeTabsViewModelModule (copy), FFlagBuildUpdatedSearchUXForGAModule (copy), FFlagBuildExperienceHomeTelemetryModule (copy), UsePreviewResultsModule (copy), BUILDHOMETAB (copy), FFlagBuildExperienceFoundationTabsModule (copy), UseBuildHomeTabsFillBehaviorModule (copy), UsePreviewsTabViewModelModule (copy), ReactModule (copy), BuildHomeTabsViewModule (copy), PreviewsTabViewModule (copy), MyCreationsFilterContainerModule (copy), DefaultFilter (copy), Options (copy)
	local CreatorGroupsStore = Frame.creatorGroupsStore
	local PreviewsFilterStore = Frame.previewsFilterStore or GetPreviewsFilterStoreModule()
	local UseFilterResult = PreviewsFilterStore.useFilter()
	local UseBuildHomeTabsViewModelModuleResult = UseBuildHomeTabsViewModelModule({
		tabStore = Frame.tabStore,
		searchQueryStore = if FFlagBuildUpdatedSearchUXForGAModule then nil else Frame.searchQueryStore,
		isFocused = if FFlagBuildExperienceHomeTelemetryModule then Frame.isFocused else nil
	})
	local UsePreviewResultsModuleResult = UsePreviewResultsModule({
		searchStore = Frame.searchStore,
		creatorGroupsStore = CreatorGroupsStore,
		filter = UseFilterResult,
		searchQueryStore = if FFlagBuildUpdatedSearchUXForGAModule then Frame.searchQueryStore else nil,
		isActiveTab = if FFlagBuildUpdatedSearchUXForGAModule then UseBuildHomeTabsViewModelModuleResult.activeTab == BUILDHOMETAB.Previews else nil,
		isFocused = Frame.isFocused
	})
	local UsePreviewsTabViewModelModuleResult = UsePreviewsTabViewModelModule({ results = UsePreviewResultsModuleResult })
	
	return ReactModule.createElement(BuildHomeTabsViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		showTabs = if FFlagBuildUpdatedSearchUXForGAModule then nil else UseBuildHomeTabsViewModelModuleResult.showTabs,
		activeTab = UseBuildHomeTabsViewModelModuleResult.activeTab,
		tabs = UseBuildHomeTabsViewModelModuleResult.tabs,
		onTabActivated = UseBuildHomeTabsViewModelModuleResult.onTabActivated,
		pageOffset = UseBuildHomeTabsViewModelModuleResult.pageOffset,
		tabOrder = UseBuildHomeTabsViewModelModuleResult.tabOrder,
		tabsFillBehavior = if FFlagBuildExperienceFoundationTabsModule then UseBuildHomeTabsFillBehaviorModule() else nil,
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