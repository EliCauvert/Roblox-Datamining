local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url
game:DefineFastFlag("LuaAppExperienceJoinIdempotencyKey", false)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: httpService (ref), url (ref)
	return p1(string.format("%snotifications/v1/send-experience-invite", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({
			recipientUserId = p2,
			inviteMessageId = p5,
			placeId = p3,
			launchData = p6,
			trigger = p4,
			idempotencyKey = if game:GetFastFlag("LuaAppExperienceJoinIdempotencyKey") then httpService:GenerateGUID(false) else nil
		})
	})
end