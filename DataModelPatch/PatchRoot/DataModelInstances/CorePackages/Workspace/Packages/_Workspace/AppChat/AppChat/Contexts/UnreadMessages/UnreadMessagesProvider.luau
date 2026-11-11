local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local UnreadMessagesDispatchContextModule = require(script.Parent.UnreadMessagesDispatchContext)

return function(p1)
	-- upvalues: ReactModule (copy), UnreadMessagesDispatchContextModule (copy)
	return ReactModule.createElement(UnreadMessagesDispatchContextModule.Provider, { value = p1.dispatch }, p1.children)
end