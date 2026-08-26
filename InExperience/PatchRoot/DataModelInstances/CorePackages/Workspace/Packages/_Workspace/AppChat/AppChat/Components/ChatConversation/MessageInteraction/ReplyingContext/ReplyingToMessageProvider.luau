local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local replyingToMessageContextModule = require(script.Parent.ReplyingToMessageContext)
local replyingToMessageDispatchContextModule = require(script.Parent.ReplyingToMessageDispatchContext)

return function(p1)
	-- upvalues: reactModule (ref), replyingToMessageContextModule (ref), replyingToMessageDispatchContextModule (ref)
	local var1, var2 = reactModule.useState(nil)
	
	return reactModule.createElement(replyingToMessageContextModule.Provider, { value = var1 }, {
		ReplyingToMessageDispatch = reactModule.createElement(replyingToMessageDispatchContextModule.Provider, { value = var2 }, p1.children)
	})
end