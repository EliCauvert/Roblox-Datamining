return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_MENU_OPEN", function(IsMenuOpen)
	return { isMenuOpen = IsMenuOpen }
end)