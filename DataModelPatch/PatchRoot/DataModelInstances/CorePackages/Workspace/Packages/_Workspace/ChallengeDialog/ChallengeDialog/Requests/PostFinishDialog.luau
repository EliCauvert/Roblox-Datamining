local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("ChallengeDialog").Parent.Http).Url

return function(Callback, Dialog, Action)
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(string.format("%schallenge-dialog-service/v1/dialogs", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({ dialog = Dialog, action = Action })
	})
end