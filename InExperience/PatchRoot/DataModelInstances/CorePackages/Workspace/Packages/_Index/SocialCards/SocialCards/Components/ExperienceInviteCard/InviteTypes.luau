local _ = require(script:FindFirstAncestor("SocialCards").Parent.React)

return {
	InviteCardStatus = table.freeze({
		Loading = "Loading",
		Ready = "Ready",
		Unavailable = "Unavailable"
	})
}