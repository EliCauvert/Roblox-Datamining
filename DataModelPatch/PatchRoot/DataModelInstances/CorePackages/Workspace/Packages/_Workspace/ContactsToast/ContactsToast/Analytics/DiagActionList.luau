local DiagEventTypes = require(script:FindFirstAncestor("ContactsToast").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.ContactsToastSeen] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ContactsToastSeen", "ContactsToastSeen")
	},
	[EventNamesModule.ContactsToastDismissed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ContactsToastDismissed", "ContactsToastDismissed")
	},
	[EventNamesModule.ContactsToastButtonPressed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ContactsToastButtonPressed", "ContactsToastButtonPressed")
	}
}