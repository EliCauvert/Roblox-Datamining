local T = require(script:FindFirstAncestor("SocialTab").dependencies).t

return T.interface({
	id = T.string,
	username = T.string,
	displayName = T.string,
	thumbnail = T.string,
	isPremium = T.boolean,
	userPresenceType = T.optional(T.userdata),
	lastLocation = T.optional(T.string)
})