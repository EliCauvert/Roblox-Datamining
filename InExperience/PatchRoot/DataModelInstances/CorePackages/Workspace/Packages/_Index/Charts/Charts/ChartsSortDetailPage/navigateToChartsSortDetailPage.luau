local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)
local ChartsPageScopeFieldsModule = require(Charts.ChartsPage.ChartsPageScopeFields)
local ChartsSortDetailConstantsModule = require(Charts.ChartsSortDetailPage.ChartsSortDetailConstants)
local FetchChartsSortDetailModule = require(Charts.ChartsSortDetailPage.fetchChartsSortDetail)
local GetChartsSortDetailPageKeyModule = require(Charts.ChartsSortDetailPage.getChartsSortDetailPageKey)

return function(p1, p2) --[[ Line: 14 | Named "navigateToChartsSortDetailPage" ]]
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy), GetChartsSortDetailPageKeyModule (copy), SduiSurfaceLoadTimeTracker (copy), ChartsSortDetailConstantsModule (copy), FetchChartsSortDetailModule (copy), AppPage (copy)
	local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(GetChartsSortDetailPageKeyModule(p2.sortId, nil, (GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections))), {
		eventName = ChartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
		metadata = { page = "navigate" }
	})
	LoadTimerWithSurfaceLoadTime.start("navigate")
	FetchChartsSortDetailModule(p2.sortId, LoadTimerWithSurfaceLoadTime)
	p1.navigate(AppPage.GamesList, {
		detail = p2.sortId,
		extraProps = {
			pageContext = p2.pageContext,
			pageTimer = LoadTimerWithSurfaceLoadTime
		}
	})
end