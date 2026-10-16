local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ReplyingToMessageContextModule = require(script.Parent.ReplyingToMessageContext)

return function() --[[ Line: 7 | Named "useReplyingToMessage" ]]
	-- upvalues: ReactModule (copy), ReplyingToMessageContextModule (copy)
	return ReactModule.useContext(ReplyingToMessageContextModule)
end