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

return function(p0, p1)
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getChartsSortDetailPageKeyModule (ref), sduiSurfaceLoadTimeTracker (ref), chartsSortDetailConstantsModule (ref), fetchChartsSortDetailModule (ref), appPage (ref)
	local var7 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(getChartsSortDetailPageKeyModule(p1.sortId, nil, getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)), {
		eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
		metadata = { page = "navigate" }
	})
	var7.start("navigate")
	fetchChartsSortDetailModule(p1.sortId, var7)
	p0.navigate(appPage.GamesList, {
		detail = p1.sortId,
		extraProps = { pageContext = p1.pageContext, pageTimer = var7 }
	})
end