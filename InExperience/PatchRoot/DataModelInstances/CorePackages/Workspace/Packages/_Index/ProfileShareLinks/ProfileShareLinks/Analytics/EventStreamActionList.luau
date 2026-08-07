local parent = script:FindFirstAncestor("ProfileShareLinks").Parent
local dashModule = require(parent.Dash)
local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.ProfileShareLinkActivated] = {
		context = "",
		eventType = require(parent.SocialLuaAnalytics).Analytics.Enums.EventTypes.ButtonClick,
		additionalInfo = { btn = eventNamesModule.ProfileShareLinkActivated },
		formatRulesForAdditionalInfo = {
			context = dashModule.identity,
			shareType = dashModule.identity,
			stamp = dashModule.identity
		}
	}
}