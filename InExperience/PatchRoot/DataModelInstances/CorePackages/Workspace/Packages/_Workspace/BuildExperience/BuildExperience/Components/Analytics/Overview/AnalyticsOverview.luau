local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local AnalyticsWindowModule = require(BuildExperience.Analytics.AnalyticsWindow)
local AnalyticsOverviewViewModule = require(script.Parent.AnalyticsOverviewView)
local UseAnalyticsOverviewViewModelModule = require(script.Parent.useAnalyticsOverviewViewModel)

return function(p1) --[[ Line: 24 | Named "AnalyticsOverview" ]]
	-- upvalues: ReactModule (copy), AnalyticsWindowModule (copy), UseAnalyticsOverviewViewModelModule (copy), AnalyticsOverviewViewModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialWindowId or AnalyticsWindowModule.DEFAULT_WINDOW_ID)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local WindowByIdEntry = AnalyticsWindowModule.WindowById[UseStateResult] or AnalyticsWindowModule.LastWeek
	local UseAnalyticsOverviewViewModelModuleResult = UseAnalyticsOverviewViewModelModule(p1.universeId, WindowByIdEntry, p1.initialMetricId or "UniqueUsersWithPlaySessions", UseStateResult1, UseStateResult2_1)
	
	return ReactModule.createElement(AnalyticsOverviewViewModule, {
		overviewTitle = UseAnalyticsOverviewViewModelModuleResult.overviewTitle,
		keyStatsTitle = UseAnalyticsOverviewViewModelModuleResult.keyStatsTitle,
		instantStats = UseAnalyticsOverviewViewModelModuleResult.instantStats,
		statsCards = UseAnalyticsOverviewViewModelModuleResult.statsCards,
		windows = UseAnalyticsOverviewViewModelModuleResult.windows,
		selectedWindowId = UseStateResult,
		onWindowSelected = UseStateResult2,
		universeId = p1.universeId,
		window = WindowByIdEntry,
		sheet = UseAnalyticsOverviewViewModelModuleResult.sheet,
		onSheetClose = ReactModule.useCallback(function() --[[ Line: 37 ]]
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(nil)
		end, {}),
		onOpenChat = p1.onOpenChat,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	})
end