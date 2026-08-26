local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)
local reloadMessagesForConversationsModule = require(script.Parent.reloadMessagesForConversations)

return function()
	-- upvalues: reloadMessagesForConversationsModule (ref), cryoModule (ref)
	return function(p1)
		-- upvalues: reloadMessagesForConversationsModule (copy), cryoModule (copy)
		return p1:dispatch(reloadMessagesForConversationsModule(cryoModule.Dictionary.keys(p1:getState().ChatAppReducer.Conversations)))
	end
end