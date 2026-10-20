local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url
game:DefineFastFlag("LuaAppExperienceJoinIdempotencyKey", false)

return function(Callback, RecipientUserId, PlaceId, Trigger, InviteMessageId, LaunchData)
	-- upvalues: HttpService (copy), Url (copy)
	return Callback(string.format("%snotifications/v1/send-experience-invite", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({
			recipientUserId = RecipientUserId,
			inviteMessageId = InviteMessageId,
			placeId = PlaceId,
			launchData = LaunchData,
			trigger = Trigger,
			idempotencyKey = if game:GetFastFlag("LuaAppExperienceJoinIdempotencyKey") then HttpService:GenerateGUID(false) else nil
		})
	})
end