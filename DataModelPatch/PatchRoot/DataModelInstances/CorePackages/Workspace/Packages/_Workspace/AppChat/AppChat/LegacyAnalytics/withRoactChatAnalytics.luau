local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local RoactChatAnalyticsConsumerModule = require(script.Parent.RoactChatAnalyticsConsumer)

return function(Callback)
	-- upvalues: RoactModule (copy), RoactChatAnalyticsConsumerModule (copy)
	assert(type(Callback) == "function", "Expect renderCallback to be a function.")
	
	return RoactModule.createElement(RoactChatAnalyticsConsumerModule, { render = Callback })
end