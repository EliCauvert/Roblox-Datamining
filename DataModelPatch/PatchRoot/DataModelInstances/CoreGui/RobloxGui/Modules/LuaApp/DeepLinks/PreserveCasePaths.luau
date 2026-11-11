local FFlagEnableSearchDeepLinkModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.FFlagEnableSearchDeepLink)
game:DefineFastString("ContactsDeepLinkPrefix", "roblox://navigation/contacts")
game:DefineFastString("AppealsPortalPrefix", "roblox://navigation/appeals")
game:DefineFastString("SecurityAlertDeepLinkPrefix", "roblox://navigation/security_alert")
game:DefineFastString("SortDeeplinkPrefix", "roblox://navigation/experience_sort")
game:DefineFastString("AmpWizardDeepLinkPrefix", "roblox://navigation/amp_wizard")
game:DefineFastString("SearchDeepLinkPrefix", "roblox://navigation/search")
game:DefineFastString("NotificationSettingsDeepLinkPrefix", "roblox://navigation/notification_settings")

return {
	game:GetFastString("ContactsDeepLinkPrefix"),
	game:GetFastString("AppealsPortalPrefix"),
	game:GetFastString("SecurityAlertDeepLinkPrefix"),
	game:GetFastString("SortDeeplinkPrefix"),
	game:GetFastString("AmpWizardDeepLinkPrefix"),
	if FFlagEnableSearchDeepLinkModule then game:GetFastString("SearchDeepLinkPrefix") else nil,
	game:GetFastString("NotificationSettingsDeepLinkPrefix")
}