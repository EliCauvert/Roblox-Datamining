local diagEventTypes = require(script:FindFirstAncestor("ContactsToast").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes
local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.ContactsToastSeen] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ContactsToastSeen", "ContactsToastSeen")
	},
	[eventNamesModule.ContactsToastDismissed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ContactsToastDismissed", "ContactsToastDismissed")
	},
	[eventNamesModule.ContactsToastButtonPressed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ContactsToastButtonPressed", "ContactsToastButtonPressed")
	}
}