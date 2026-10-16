local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "SendGameLinkMessage" }, function(Callback, UniverseId, ConversationId, Decorators) --[[ Line: 9 ]]
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("send-game-link-message"):body({
			universeId = UniverseId,
			conversationId = ConversationId,
			decorators = Decorators
		}):setStatusIds({ ConversationId })
	end)
end