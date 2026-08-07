local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local roactChatAnalyticsConsumerModule = require(script.Parent.RoactChatAnalyticsConsumer)

return function(p0) --[[ line: 12 ]]
	-- upvalues: roactModule (ref), roactChatAnalyticsConsumerModule (ref)
	assert(type(p0) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(roactChatAnalyticsConsumerModule, { render = p0 })
end