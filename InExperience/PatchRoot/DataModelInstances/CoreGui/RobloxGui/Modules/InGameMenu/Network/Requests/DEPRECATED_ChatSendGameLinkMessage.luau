local HttpService = game:GetService("HttpService")
local UrlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(Callback, ConversationId, UniverseId, Decorators) --[[ Line: 7 ]]
	-- upvalues: HttpService (copy), UrlModule (copy)
	assert(Callback, "requestImpl is required")
	assert(ConversationId, "conversationId is required")
	assert(UniverseId, "universeId is required")
	
	return Callback(string.format("%s/send-game-link-message", UrlModule.CHAT_URL), "POST", {
		postBody = HttpService:JSONEncode({
			conversationId = ConversationId,
			universeId = UniverseId,
			decorators = Decorators
		})
	})
end