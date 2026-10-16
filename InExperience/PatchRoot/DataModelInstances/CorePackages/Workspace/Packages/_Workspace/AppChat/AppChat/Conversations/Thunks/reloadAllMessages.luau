local CryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)
local ReloadMessagesForConversationsModule = require(script.Parent.reloadMessagesForConversations)

return function() --[[ Line: 7 | Named "reloadAllMessages" ]]
	-- upvalues: ReloadMessagesForConversationsModule (copy), CryoModule (copy)
	return function(p1) --[[ Line: 8 ]]
		-- upvalues: ReloadMessagesForConversationsModule (upval), CryoModule (upval)
		return p1:dispatch(ReloadMessagesForConversationsModule(CryoModule.Dictionary.keys(p1:getState().ChatAppReducer.Conversations)))
	end
end