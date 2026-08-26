local httpService = game:GetService("HttpService")
local http = script:FindFirstAncestor("Http")
local urlModule = require(http.Url)
local _ = require(http.RequestTypes)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: httpService (ref), urlModule (ref)
	assert(p1, "requestImpl is required")
	assert(p2, "conversationId is required")
	assert(p3, "universeId is required")
	
	return p1(string.format("%s/send-game-link-message", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({
			conversationId = p2,
			universeId = p3,
			decorators = p4,
			isExperienceInvite = p5,
			userId = p6,
			placeId = p7
		})
	})
end