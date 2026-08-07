local inGameMenu = script.Parent.Parent.InGameMenu

return {
	BarOnTopScrollingFrame = inGameMenu.Components.BarOnTopScrollingFrame,
	Divider = inGameMenu.Components.Divider,
	FocusHandler = inGameMenu.Components.Connection.FocusHandler,
	ThemedTextLabel = inGameMenu.Components.ThemedTextLabel,
	PlayerCell = inGameMenu.Components.PlayerCell,
	GameIcon = inGameMenu.Components.GameIcon,
	PlayerSearchPredicate = inGameMenu.Utility.PlayerSearchPredicate,
	SearchBar = inGameMenu.Components.SearchBar,
	Localization = if game:DefineFastFlag("SwitchTnSTranslationsPackage", false) then require(game:GetService("CorePackages").Workspace.Packages.InExperienceLocales).Localization else require(inGameMenu.Localization.Localization),
	LocalizationProvider = inGameMenu.Localization.LocalizationProvider,
	withLocalization = inGameMenu.Localization.withLocalization,
	playerInterface = script.Parent.Parent.Interfaces.playerInterface
}