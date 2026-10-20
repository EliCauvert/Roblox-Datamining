local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ReplyingToMessageContextModule = require(script.Parent.ReplyingToMessageContext)

return function()
	-- upvalues: ReactModule (copy), ReplyingToMessageContextModule (copy)
	return ReactModule.useContext(ReplyingToMessageContextModule)
end