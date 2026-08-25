local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)
local reloadMessagesForConversationsModule = require(script.Parent.reloadMessagesForConversations)

return function()
	-- upvalues: reloadMessagesForConversationsModule (ref), cryoModule (ref)
	return function(p0)
		-- upvalues: reloadMessagesForConversationsModule (copy), cryoModule (copy)
		return p0:dispatch(reloadMessagesForConversationsModule(cryoModule.Dictionary.keys(p0:getState().ChatAppReducer.Conversations)))
	end
end