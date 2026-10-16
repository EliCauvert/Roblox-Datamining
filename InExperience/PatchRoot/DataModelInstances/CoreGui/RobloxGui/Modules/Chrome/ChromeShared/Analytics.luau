local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local ViewportUtilModule = require(ChromeShared.Service.ViewportUtil)
local UseObservableValueModule = require(ChromeShared.Hooks.useObservableValue)
local ChromeAnalyticsModule = require(script.ChromeAnalytics)
local ReactModule = require(CorePackages.Packages.React)
local FFlagUnibarLuaOcclusionMetrics = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUnibarLuaOcclusionMetrics()
local OcclusionMetricsManagerModule = require(script.OcclusionMetricsManager)

return function(_) --[[ Line: 14 | Named "ChromeAnalyticsListener" ]]
	-- upvalues: ChromeAnalyticsModule (copy), UseObservableValueModule (copy), ViewportUtilModule (copy), FFlagUnibarLuaOcclusionMetrics (copy), ReactModule (copy), OcclusionMetricsManagerModule (copy)
	ChromeAnalyticsModule.default:setScreenSize((UseObservableValueModule(ViewportUtilModule.screenSize)))
	
	return if FFlagUnibarLuaOcclusionMetrics then ReactModule.createElement(OcclusionMetricsManagerModule) else nil
end