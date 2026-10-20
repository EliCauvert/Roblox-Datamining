local HttpService = game:GetService("HttpService")
local Http = script:FindFirstAncestor("Http")
local UrlModule = require(Http.Url)
local _ = require(Http.RequestTypes)

return function(Callback, ConversationId, Message, Decorators, IsExperienceInvite, UserId)
	-- upvalues: HttpService (copy), UrlModule (copy)
	return Callback(string.format("%s/send-message", UrlModule.CHAT_URL), "POST", {
		postBody = HttpService:JSONEncode({
			conversationId = ConversationId,
			message = Message,
			decorators = Decorators,
			isExperienceInvite = IsExperienceInvite,
			userId = UserId
		})
	})
end