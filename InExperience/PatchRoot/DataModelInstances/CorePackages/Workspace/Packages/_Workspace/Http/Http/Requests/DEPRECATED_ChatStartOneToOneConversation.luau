local httpService = game:GetService("HttpService")
local urlModule = require(script.Parent.Parent.Url)

return function(p0, p1, _)
	-- upvalues: httpService (ref), urlModule (ref)
	return p0(string.format("%s/start-one-to-one-conversation", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({ participantuserId = p1 })
	})
end