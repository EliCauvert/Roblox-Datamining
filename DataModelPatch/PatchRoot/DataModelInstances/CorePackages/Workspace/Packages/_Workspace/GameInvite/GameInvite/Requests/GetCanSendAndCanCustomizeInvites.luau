local Url = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url

return function(Callback, Trigger, RecipientUserId)
	-- upvalues: Url (copy)
	return Callback(string.format("%snotifications/v1/can-prompt-experience-invite?%s", Url.APIS_URL, (Url:makeQueryString({
		RecipientUserId = RecipientUserId,
		Trigger = Trigger,
		PlaceId = game.PlaceId
	}))), "GET")
end