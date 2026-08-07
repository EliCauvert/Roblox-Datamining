local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local analyticsConsumerModule = require(script.Parent.AnalyticsConsumer)

return function(p0) --[[ line: 11 ]]
	-- upvalues: roactModule (ref), analyticsConsumerModule (ref)
	assert(type(p0) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(analyticsConsumerModule, { render = p0 })
end