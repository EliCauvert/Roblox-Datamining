local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)
local chartsPageScopeFieldsModule = require(charts.ChartsPage.ChartsPageScopeFields)
local chartsSortDetailConstantsModule = require(charts.ChartsSortDetailPage.ChartsSortDetailConstants)
local fetchChartsSortDetailModule = require(charts.ChartsSortDetailPage.fetchChartsSortDetail)
local getChartsSortDetailPageKeyModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPageKey)

return function(p1, p2)
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getChartsSortDetailPageKeyModule (ref), sduiSurfaceLoadTimeTracker (ref), chartsSortDetailConstantsModule (ref), fetchChartsSortDetailModule (ref), appPage (ref)
	local var1 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(getChartsSortDetailPageKeyModule(p2.sortId, nil, getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)), {
		eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
		metadata = { page = "navigate" }
	})
	var1.start("navigate")
	fetchChartsSortDetailModule(p2.sortId, var1)
	p1.navigate(appPage.GamesList, {
		detail = p2.sortId,
		extraProps = { pageContext = p2.pageContext, pageTimer = var1 }
	})
end