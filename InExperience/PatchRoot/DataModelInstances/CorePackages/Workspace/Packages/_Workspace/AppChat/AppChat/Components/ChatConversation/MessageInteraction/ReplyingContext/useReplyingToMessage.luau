local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local replyingToMessageContextModule = require(script.Parent.ReplyingToMessageContext)

return function()
	-- upvalues: reactModule (ref), replyingToMessageContextModule (ref)
	return reactModule.useContext(replyingToMessageContextModule)
end