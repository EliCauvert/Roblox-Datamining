local url = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url

return function(p1, p2, p3)
	-- upvalues: url (ref)
	return p1(string.format("%snotifications/v1/can-prompt-experience-invite?%s", url.APIS_URL, url:makeQueryString({
		RecipientUserId = p3,
		Trigger = p2,
		PlaceId = game.PlaceId
	})), "GET")
end