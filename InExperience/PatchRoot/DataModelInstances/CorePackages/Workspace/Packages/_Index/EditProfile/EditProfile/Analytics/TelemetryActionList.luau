local _ = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("EditProfileAnalyticsThrottlingThousandths", 1000)
	}
}