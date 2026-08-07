local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url
game:DefineFastFlag("LuaAppExperienceJoinIdempotencyKey", false)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 9 ]]
	-- upvalues: httpService (ref), url (ref)
	return p0(string.format("%snotifications/v1/send-experience-invite", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({
			recipientUserId = p1,
			inviteMessageId = p4,
			placeId = p2,
			launchData = p5,
			trigger = p3,
			idempotencyKey = if game:GetFastFlag("LuaAppExperienceJoinIdempotencyKey") then httpService:GenerateGUID(false) else nil
		})
	})
end