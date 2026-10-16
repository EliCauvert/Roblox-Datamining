local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ReplyingToMessageDispatchContextModule = require(script.Parent.ReplyingToMessageDispatchContext)

return function() --[[ Line: 7 | Named "useReplyingToMessageDispatch" ]]
	-- upvalues: ReactModule (copy), ReplyingToMessageDispatchContextModule (copy)
	return ReactModule.useContext(ReplyingToMessageDispatchContextModule)
end