local parent = script:FindFirstAncestor("ContactsToast").Parent
local eventNamesModule = require(script.Parent.EventNames)
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local btnValuesModule = require(script.Parent.BtnValues)
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local dashModule = require(parent.Dash)

return {
	[eventNamesModule.ContactsToastSeen] = {
		context = contexts.ContactsToast,
		eventType = eventTypes.UserSeen,
		formatRulesForAdditionalInfo = { variant = dashModule.identity }
	},
	[eventNamesModule.ContactsToastDismissed] = {
		context = contexts.ContactsToast,
		eventType = eventTypes.Dismissed,
		formatRulesForAdditionalInfo = { variant = dashModule.identity }
	},
	[eventNamesModule.ContactsToastButtonPressed] = {
		context = contexts.ContactsToast,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.FindFriendsButton },
		formatRulesForAdditionalInfo = { variant = dashModule.identity }
	}
}