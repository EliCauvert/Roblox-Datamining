local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ReplyingToMessageDispatchContextModule = require(script.Parent.ReplyingToMessageDispatchContext)

return function()
	-- upvalues: ReactModule (copy), ReplyingToMessageDispatchContextModule (copy)
	return ReactModule.useContext(ReplyingToMessageDispatchContextModule)
end