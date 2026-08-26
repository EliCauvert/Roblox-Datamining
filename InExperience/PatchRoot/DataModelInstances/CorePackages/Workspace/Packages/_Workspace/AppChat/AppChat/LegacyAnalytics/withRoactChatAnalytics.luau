local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local roactChatAnalyticsConsumerModule = require(script.Parent.RoactChatAnalyticsConsumer)

return function(p1)
	-- upvalues: roactModule (ref), roactChatAnalyticsConsumerModule (ref)
	assert(type(p1) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(roactChatAnalyticsConsumerModule, { render = p1 })
end