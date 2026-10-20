local HttpService = game:GetService("HttpService")
local UrlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(Callback, ConversationId, Message, Decorators)
	-- upvalues: HttpService (copy), UrlModule (copy)
	return Callback(string.format("%s/send-message", UrlModule.CHAT_URL), "POST", {
		postBody = HttpService:JSONEncode({
			conversationId = ConversationId,
			message = Message,
			decorators = Decorators
		})
	})
end