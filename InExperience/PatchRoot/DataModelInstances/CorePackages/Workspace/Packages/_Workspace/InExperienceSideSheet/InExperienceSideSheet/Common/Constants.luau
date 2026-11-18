local ConstantsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.InExperienceSideSheetStore.Constants)

return {
	TweenDuration = 0.35,
	MenuScreenMargin = 20,
	NominalSideSheetWidth = 320,
	MinMenuWidthBesideSideSheet = 200,
	SideSheetDisplayOrder = ConstantsModule.SideSheetDisplayOrder,
	IntegrationIds = ConstantsModule.IntegrationIds,
	LocalizationKeys = {
		QuitButton = "Feature.SettingsHub.Label.QuitButton",
		QuitConfirmation = "Feature.SettingsHub.Label.QuitConfirmation",
		LogoutButton = "Feature.SettingsHub.Label.LogoutButton",
		LogoutConfirmation = "Feature.SettingsHub.Label.LogoutConfirmation",
		Resume = "InGame.HelpMenu.Resume"
	},
	SessionActionButtonNames = { SwitchServer = "SwitchServerButton" }
}