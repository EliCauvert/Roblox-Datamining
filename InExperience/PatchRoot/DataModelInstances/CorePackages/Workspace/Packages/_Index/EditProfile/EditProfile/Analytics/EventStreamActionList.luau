local enums = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics).Analytics.Enums

return {
	[require(script.Parent.Enums.EventNames).UsernameSaved] = {
		context = enums.Contexts.EditProfile,
		eventType = enums.EventTypes.UsernameSaved
	}
}