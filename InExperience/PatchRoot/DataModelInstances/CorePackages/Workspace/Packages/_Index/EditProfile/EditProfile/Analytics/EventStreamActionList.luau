local Enums = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics).Analytics.Enums

return {
	[require(script.Parent.Enums.EventNames).UsernameSaved] = {
		context = Enums.Contexts.EditProfile,
		eventType = Enums.EventTypes.UsernameSaved
	}
}