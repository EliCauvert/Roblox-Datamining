local httpService = game:GetService("HttpService")
local http = script:FindFirstAncestor("Http")
local urlModule = require(http.Url)
local _ = require(http.RequestTypes)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: httpService (ref), urlModule (ref)
	return p1(string.format("%s/send-message", urlModule.CHAT_URL), "POST", {
		postBody = httpService:JSONEncode({
			conversationId = p2,
			message = p3,
			decorators = p4,
			isExperienceInvite = p5,
			userId = p6
		})
	})
end