local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local analyticsConsumerModule = require(script.Parent.AnalyticsConsumer)

return function(p1)
	-- upvalues: roactModule (ref), analyticsConsumerModule (ref)
	assert(type(p1) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(analyticsConsumerModule, { render = p1 })
end