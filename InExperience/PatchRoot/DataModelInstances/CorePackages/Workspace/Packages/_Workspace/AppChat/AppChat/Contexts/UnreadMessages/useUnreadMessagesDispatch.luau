local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local unreadMessagesDispatchContextModule = require(script.Parent.UnreadMessagesDispatchContext)

return function() --[[ line: 7 | named "useUnreadMessagesDispatch" ]]
	-- upvalues: reactModule (ref), unreadMessagesDispatchContextModule (ref)
	return reactModule.useContext(unreadMessagesDispatchContextModule)
end