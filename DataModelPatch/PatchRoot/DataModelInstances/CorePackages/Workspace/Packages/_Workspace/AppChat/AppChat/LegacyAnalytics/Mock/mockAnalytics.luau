local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local MockAnalyticsProviderModule = require(script.Parent.MockAnalyticsProvider)

return function(AnalyticsElement)
	-- upvalues: RoactModule (copy), MockAnalyticsProviderModule (copy)
	return RoactModule.createElement(MockAnalyticsProviderModule, {}, { AnalyticsElement = AnalyticsElement })
end