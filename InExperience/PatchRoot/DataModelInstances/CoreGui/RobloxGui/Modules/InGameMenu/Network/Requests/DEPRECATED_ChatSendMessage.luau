local httpService = game:GetService("HttpService")
local urlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(p1, p2, p3, p4)
	-- upvalues: httpService (ref), urlModule (ref)
	return p1(string.format("%s/send-message", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({ conversationId = p2, message = p3, decorators = p4 })
	})
end