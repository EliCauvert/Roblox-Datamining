local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local UnreadMessagesDispatchContextModule = require(script.Parent.UnreadMessagesDispatchContext)

return function()
	-- upvalues: ReactModule (copy), UnreadMessagesDispatchContextModule (copy)
	return ReactModule.useContext(UnreadMessagesDispatchContextModule)
end