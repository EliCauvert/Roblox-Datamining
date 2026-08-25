local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local replyingToMessageDispatchContextModule = require(script.Parent.ReplyingToMessageDispatchContext)

return function()
	-- upvalues: reactModule (ref), replyingToMessageDispatchContextModule (ref)
	return reactModule.useContext(replyingToMessageDispatchContextModule)
end