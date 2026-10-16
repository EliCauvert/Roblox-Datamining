local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "SetConversationUniverse" }, function(Callback, ConversationId, UniverseId) --[[ Line: 9 ]]
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("set-conversation-universe"):body({ conversationId = ConversationId, universeId = UniverseId }):setStatusIds({ ConversationId })
	end)
end