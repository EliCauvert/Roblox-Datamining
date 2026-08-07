local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local replyingToMessageDispatchContextModule = require(script.Parent.ReplyingToMessageDispatchContext)

return function() --[[ line: 7 | named "useReplyingToMessageDispatch" ]]
	-- upvalues: reactModule (ref), replyingToMessageDispatchContextModule (ref)
	return reactModule.useContext(replyingToMessageDispatchContextModule)
end