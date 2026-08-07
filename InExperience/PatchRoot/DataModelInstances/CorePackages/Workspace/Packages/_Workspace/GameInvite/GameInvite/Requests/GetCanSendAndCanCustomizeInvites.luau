local url = require(script:FindFirstAncestor("GameInvite").Parent.Http).Url

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: url (ref)
	return p0(string.format("%snotifications/v1/can-prompt-experience-invite?%s", url.APIS_URL, url:makeQueryString({
		RecipientUserId = p2,
		Trigger = p1,
		PlaceId = game.PlaceId
	})), "GET")
end