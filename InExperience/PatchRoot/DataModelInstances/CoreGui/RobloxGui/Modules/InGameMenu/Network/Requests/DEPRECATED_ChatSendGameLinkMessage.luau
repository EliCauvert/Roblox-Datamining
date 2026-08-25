local httpService = game:GetService("HttpService")
local urlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(p0, p1, p2, p3)
	-- upvalues: httpService (ref), urlModule (ref)
	assert(p0, "requestImpl is required")
	assert(p1, "conversationId is required")
	assert(p2, "universeId is required")
	
	return p0(string.format("%s/send-game-link-message", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({ conversationId = p1, universeId = p2, decorators = p3 })
	})
end