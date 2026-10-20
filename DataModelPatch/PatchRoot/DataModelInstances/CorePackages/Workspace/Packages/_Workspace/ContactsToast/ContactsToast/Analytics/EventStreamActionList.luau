local Parent = script:FindFirstAncestor("ContactsToast").Parent
local EventNamesModule = require(script.Parent.EventNames)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local DashModule = require(Parent.Dash)

return {
	[EventNamesModule.ContactsToastSeen] = {
		context = Contexts.ContactsToast,
		eventType = EventTypes.UserSeen,
		formatRulesForAdditionalInfo = { variant = DashModule.identity }
	},
	[EventNamesModule.ContactsToastDismissed] = {
		context = Contexts.ContactsToast,
		eventType = EventTypes.Dismissed,
		formatRulesForAdditionalInfo = { variant = DashModule.identity }
	},
	[EventNamesModule.ContactsToastButtonPressed] = {
		context = Contexts.ContactsToast,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = require(script.Parent.BtnValues).FindFriendsButton },
		formatRulesForAdditionalInfo = { variant = DashModule.identity }
	}
}