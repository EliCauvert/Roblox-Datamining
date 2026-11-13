local Parent = script:FindFirstAncestor("ProfileShareLinks").Parent
local DashModule = require(Parent.Dash)
local EventTypes = require(Parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.ProfileShareLinkActivated] = {
		context = "",
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = EventNamesModule.ProfileShareLinkActivated },
		formatRulesForAdditionalInfo = {
			context = DashModule.identity,
			shareType = DashModule.identity,
			stamp = DashModule.identity
		}
	}
}