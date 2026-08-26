local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSurfaceLoadTimeTracker = require(parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker
local fetchChartsPageModule = require(charts.ChartsPage.fetchChartsPage)
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)

return function(p1)
	-- upvalues: sduiSurfaceLoadTimeTracker (ref), chartsConstantsModule (ref), fetchChartsPageModule (ref), appPage (ref)
	local var1 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(chartsConstantsModule.ConfigKey, {
		eventName = chartsConstantsModule.SurfaceLoadTimeEventName,
		metadata = { page = "navigate" }
	})
	var1.start("navigate")
	fetchChartsPageModule(var1)
	p1.navigate(appPage.Games, { pageTimer = var1 })
end