local httpService = game:GetService("HttpService")
local urlModule = require(script.Parent.Parent.Url)

return function(p1, p2, _)
	-- upvalues: httpService (ref), urlModule (ref)
	return p1(string.format("%s/start-one-to-one-conversation", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({ participantuserId = p2 })
	})
end