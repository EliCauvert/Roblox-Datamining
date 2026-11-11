local Url = require(script:FindFirstAncestor("ChallengeDialog").Parent.Http).Url

return function(Callback)
	-- upvalues: Url (copy)
	return Callback(string.format("%schallenge-dialog-service/v1/dialogs", Url.APIS_URL), "GET")
end