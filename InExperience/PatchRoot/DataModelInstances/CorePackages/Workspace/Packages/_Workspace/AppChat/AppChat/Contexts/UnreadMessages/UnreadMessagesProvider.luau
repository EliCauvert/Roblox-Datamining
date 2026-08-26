local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local unreadMessagesDispatchContextModule = require(script.Parent.UnreadMessagesDispatchContext)

return function(p1)
	-- upvalues: reactModule (ref), unreadMessagesDispatchContextModule (ref)
	return reactModule.createElement(unreadMessagesDispatchContextModule.Provider, { value = p1.dispatch }, p1.children)
end