local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local unreadMessagesDispatchContextModule = require(script.Parent.UnreadMessagesDispatchContext)

return function(p0)
	-- upvalues: reactModule (ref), unreadMessagesDispatchContextModule (ref)
	return reactModule.createElement(unreadMessagesDispatchContextModule.Provider, { value = p0.dispatch }, p0.children)
end