local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSurfaceLoadTimeTracker = require(Parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker
local FetchChartsPageModule = require(Charts.ChartsPage.fetchChartsPage)
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)

return function(p1) --[[ Line: 10 | Named "navigateToChartsPage" ]]
	-- upvalues: SduiSurfaceLoadTimeTracker (copy), ChartsConstantsModule (copy), FetchChartsPageModule (copy), AppPage (copy)
	local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ChartsConstantsModule.ConfigKey, {
		eventName = ChartsConstantsModule.SurfaceLoadTimeEventName,
		metadata = { page = "navigate" }
	})
	LoadTimerWithSurfaceLoadTime.start("navigate")
	FetchChartsPageModule(LoadTimerWithSurfaceLoadTime)
	p1.navigate(AppPage.Games, { pageTimer = LoadTimerWithSurfaceLoadTime })
end