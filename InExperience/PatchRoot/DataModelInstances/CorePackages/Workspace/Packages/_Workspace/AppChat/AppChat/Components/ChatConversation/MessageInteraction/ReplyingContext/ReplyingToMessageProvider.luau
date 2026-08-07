local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local replyingToMessageContextModule = require(script.Parent.ReplyingToMessageContext)
local replyingToMessageDispatchContextModule = require(script.Parent.ReplyingToMessageDispatchContext)

return function(p0) --[[ line: 13 | named "ReplyingToMessageProvider" ]]
	-- upvalues: reactModule (ref), replyingToMessageContextModule (ref), replyingToMessageDispatchContextModule (ref)
	local var3, var4 = reactModule.useState(nil)
	
	return reactModule.createElement(replyingToMessageContextModule.Provider, { value = var3 }, {
		ReplyingToMessageDispatch = reactModule.createElement(replyingToMessageDispatchContextModule.Provider, { value = var4 }, p0.children)
	})
end