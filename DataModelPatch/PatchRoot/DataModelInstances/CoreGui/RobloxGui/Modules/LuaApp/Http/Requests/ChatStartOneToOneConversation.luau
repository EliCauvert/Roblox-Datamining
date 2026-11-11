local HttpService = game:GetService("HttpService")
local Url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url

return function(Callback, ParticipantuserId)
	-- upvalues: HttpService (copy), Url (copy)
	return Callback(string.format("%s/start-one-to-one-conversation", Url.CHAT_URL), "POST", {
		postBody = HttpService:JSONEncode({ participantuserId = ParticipantuserId })
	})
end