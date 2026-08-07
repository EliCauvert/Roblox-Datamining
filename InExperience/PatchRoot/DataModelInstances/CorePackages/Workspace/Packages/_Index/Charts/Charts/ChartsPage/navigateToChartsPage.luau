local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSurfaceLoadTimeTracker = require(parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker
local fetchChartsPageModule = require(charts.ChartsPage.fetchChartsPage)
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)

return function(p0) --[[ line: 10 | named "navigateToChartsPage" ]]
	-- upvalues: sduiSurfaceLoadTimeTracker (ref), chartsConstantsModule (ref), fetchChartsPageModule (ref), appPage (ref)
	local var3 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(chartsConstantsModule.ConfigKey, {
		eventName = chartsConstantsModule.SurfaceLoadTimeEventName,
		metadata = { page = "navigate" }
	})
	var3.start("navigate")
	fetchChartsPageModule(var3)
	p0.navigate(appPage.Games, { pageTimer = var3 })
end