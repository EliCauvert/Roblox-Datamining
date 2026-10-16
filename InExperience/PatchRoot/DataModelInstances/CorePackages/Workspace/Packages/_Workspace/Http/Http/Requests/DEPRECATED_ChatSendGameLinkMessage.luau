local HttpService = game:GetService("HttpService")
local Http = script:FindFirstAncestor("Http")
local UrlModule = require(Http.Url)
local _ = require(Http.RequestTypes)

return function(Callback, ConversationId, UniverseId, Decorators, IsExperienceInvite, UserId, PlaceId) --[[ Line: 8 ]]
	-- upvalues: HttpService (copy), UrlModule (copy)
	assert(Callback, "requestImpl is required")
	assert(ConversationId, "conversationId is required")
	assert(UniverseId, "universeId is required")
	
	return Callback(string.format("%s/send-game-link-message", UrlModule.CHAT_URL), "POST", {
		postBody = HttpService:JSONEncode({
			conversationId = ConversationId,
			universeId = UniverseId,
			decorators = Decorators,
			isExperienceInvite = IsExperienceInvite,
			userId = UserId,
			placeId = PlaceId
		})
	})
end