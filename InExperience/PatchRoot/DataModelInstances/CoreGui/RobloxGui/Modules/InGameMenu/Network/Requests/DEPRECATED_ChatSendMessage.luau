local httpService = game:GetService("HttpService")
local urlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(p0, p1, p2, p3) --[[ line: 7 ]]
	-- upvalues: httpService (ref), urlModule (ref)
	return p0(string.format("%s/send-message", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({ conversationId = p1, message = p2, decorators = p3 })
	})
end