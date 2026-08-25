local httpService = game:GetService("HttpService")
local http = script:FindFirstAncestor("Http")
local urlModule = require(http.Url)
local _ = require(http.RequestTypes)

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: httpService (ref), urlModule (ref)
	return p0(string.format("%s/send-message", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({
			conversationId = p1,
			message = p2,
			decorators = p3,
			isExperienceInvite = p4,
			userId = p5
		})
	})
end