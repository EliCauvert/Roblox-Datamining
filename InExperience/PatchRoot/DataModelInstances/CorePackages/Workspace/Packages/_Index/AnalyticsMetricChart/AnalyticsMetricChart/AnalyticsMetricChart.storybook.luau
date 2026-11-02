local AnalyticsMetricChart = script:FindFirstAncestor("AnalyticsMetricChart")
local Parent = AnalyticsMetricChart.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }

return {
	name = "AnalyticsMetricChart",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), Device (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), Device (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, {
				colorMode = config[p2.theme],
				device = Device[p2.platform],
				preferences = p2.settings,
				scale = p2.settings and p2.settings.scale
			}, { Child = ReactModule.createElement(p1, p2) })
		end
	end,
	storyRoots = { AnalyticsMetricChart }
}