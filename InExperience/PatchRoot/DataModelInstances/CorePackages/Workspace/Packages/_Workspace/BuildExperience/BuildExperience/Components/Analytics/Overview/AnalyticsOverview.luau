local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local analyticsWindowModule = require(buildExperience.Analytics.AnalyticsWindow)
local analyticsOverviewViewModule = require(script.Parent.AnalyticsOverviewView)
local useAnalyticsOverviewViewModelModule = require(script.Parent.useAnalyticsOverviewViewModel)

return function(p1)
	-- upvalues: reactModule (ref), analyticsWindowModule (ref), useAnalyticsOverviewViewModelModule (ref), analyticsOverviewViewModule (ref)
	local var1, var2 = reactModule.useState(p1.initialWindowId or analyticsWindowModule.DEFAULT_WINDOW_ID)
	local var3, var4 = reactModule.useState(nil)
	local var5 = useAnalyticsOverviewViewModelModule(p1.universeId, analyticsWindowModule.WindowById[var1] or analyticsWindowModule.LastWeek, p1.initialMetricId or "UniqueUsersWithPlaySessions", var3, var4)
	
	return reactModule.createElement(analyticsOverviewViewModule, {
		overviewTitle = var5.overviewTitle,
		keyStatsTitle = var5.keyStatsTitle,
		instantStats = var5.instantStats,
		statsCards = var5.statsCards,
		windows = var5.windows,
		selectedWindowId = var1,
		onWindowSelected = var2,
		sheet = var5.sheet,
		onSheetClose = reactModule.useCallback(function()
			-- upvalues: var4 (ref)
			var4(nil)
		end, {}),
		onOpenChat = p1.onOpenChat,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	})
end