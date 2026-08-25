local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local mockAnalyticsProviderModule = require(script.Parent.MockAnalyticsProvider)

return function(p0)
	-- upvalues: roactModule (ref), mockAnalyticsProviderModule (ref)
	return roactModule.createElement(mockAnalyticsProviderModule, {}, { AnalyticsElement = p0 })
end