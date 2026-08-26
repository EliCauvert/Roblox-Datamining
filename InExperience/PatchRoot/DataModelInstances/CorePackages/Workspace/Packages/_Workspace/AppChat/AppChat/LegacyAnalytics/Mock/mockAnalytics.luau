local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local mockAnalyticsProviderModule = require(script.Parent.MockAnalyticsProvider)

return function(p1)
	-- upvalues: roactModule (ref), mockAnalyticsProviderModule (ref)
	return roactModule.createElement(mockAnalyticsProviderModule, {}, { AnalyticsElement = p1 })
end