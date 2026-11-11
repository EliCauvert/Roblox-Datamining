local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return {
	ConversationListViewRecycler = function(p1)
		-- upvalues: ReactModule (copy)
		return ReactModule.createElement(require(script.Parent.ConversationListViewRecycler), p1)
	end,
	ConversationRow = require(script.Parent.ConversationRow)
}