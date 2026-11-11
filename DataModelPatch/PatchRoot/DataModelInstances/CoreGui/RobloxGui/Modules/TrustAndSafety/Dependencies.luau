local CorePackages = game:GetService("CorePackages")
local InGameMenu = script.Parent.Parent.InGameMenu

return {
	BarOnTopScrollingFrame = InGameMenu.Components.BarOnTopScrollingFrame,
	Divider = InGameMenu.Components.Divider,
	FocusHandler = InGameMenu.Components.Connection.FocusHandler,
	ThemedTextLabel = InGameMenu.Components.ThemedTextLabel,
	PlayerCell = InGameMenu.Components.PlayerCell,
	GameIcon = InGameMenu.Components.GameIcon,
	PlayerSearchPredicate = InGameMenu.Utility.PlayerSearchPredicate,
	SearchBar = InGameMenu.Components.SearchBar,
	Localization = if game:DefineFastFlag("SwitchTnSTranslationsPackage", false) then require(CorePackages.Workspace.Packages.InExperienceLocales).Localization else require(InGameMenu.Localization.Localization),
	LocalizationProvider = InGameMenu.Localization.LocalizationProvider,
	withLocalization = InGameMenu.Localization.withLocalization,
	playerInterface = script.Parent.Parent.Interfaces.playerInterface
}