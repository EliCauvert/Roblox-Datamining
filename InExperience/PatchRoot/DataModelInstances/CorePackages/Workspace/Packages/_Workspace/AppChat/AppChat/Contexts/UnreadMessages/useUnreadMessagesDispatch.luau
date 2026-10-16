local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local UnreadMessagesDispatchContextModule = require(script.Parent.UnreadMessagesDispatchContext)

return function() --[[ Line: 7 | Named "useUnreadMessagesDispatch" ]]
	-- upvalues: ReactModule (copy), UnreadMessagesDispatchContextModule (copy)
	return ReactModule.useContext(UnreadMessagesDispatchContextModule)
end