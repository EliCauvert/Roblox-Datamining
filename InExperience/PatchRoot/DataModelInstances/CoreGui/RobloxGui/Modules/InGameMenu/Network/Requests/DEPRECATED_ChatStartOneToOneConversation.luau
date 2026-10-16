local HttpService = game:GetService("HttpService")
local UrlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(Callback, ParticipantuserId, _) --[[ Line: 7 ]]
	-- upvalues: HttpService (copy), UrlModule (copy)
	return Callback(string.format("%s/start-one-to-one-conversation", UrlModule.CHAT_URL), "POST", {
		postBody = HttpService:JSONEncode({ participantuserId = ParticipantuserId })
	})
end