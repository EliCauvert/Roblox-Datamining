local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local viewportUtilModule = require(chromeShared.Service.ViewportUtil)
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)
local chromeAnalyticsModule = require(script.ChromeAnalytics)
local reactModule = require(corePackagesService.Packages.React)
local fFlagUnibarLuaOcclusionMetrics = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagUnibarLuaOcclusionMetrics()
local occlusionMetricsManagerModule = require(script.OcclusionMetricsManager)

return function(_) --[[ line: 14 | named "ChromeAnalyticsListener" ]]
	-- upvalues: chromeAnalyticsModule (ref), useObservableValueModule (ref), viewportUtilModule (ref), fFlagUnibarLuaOcclusionMetrics (ref), reactModule (ref), occlusionMetricsManagerModule (ref)
	chromeAnalyticsModule.default:setScreenSize(useObservableValueModule(viewportUtilModule.screenSize))
	
	return if fFlagUnibarLuaOcclusionMetrics then reactModule.createElement(occlusionMetricsManagerModule) else nil
end