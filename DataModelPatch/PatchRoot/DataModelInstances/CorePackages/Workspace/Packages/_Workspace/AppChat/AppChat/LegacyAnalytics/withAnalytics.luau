local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local AnalyticsConsumerModule = require(script.Parent.AnalyticsConsumer)

return function(Callback)
	-- upvalues: RoactModule (copy), AnalyticsConsumerModule (copy)
	assert(type(Callback) == "function", "Expect renderCallback to be a function.")
	
	return RoactModule.createElement(AnalyticsConsumerModule, { render = Callback })
end