local httpService = game:GetService("HttpService")
local urlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(p1, p2, p3, p4)
	-- upvalues: httpService (ref), urlModule (ref)
	assert(p1, "requestImpl is required")
	assert(p2, "conversationId is required")
	assert(p3, "universeId is required")
	
	return p1(string.format("%s/send-game-link-message", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({ conversationId = p2, universeId = p3, decorators = p4 })
	})
end