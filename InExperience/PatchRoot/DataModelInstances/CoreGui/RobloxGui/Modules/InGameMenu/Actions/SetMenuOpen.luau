return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_MENU_OPEN", function(IsMenuOpen) --[[ Line: 5 ]]
	return { isMenuOpen = IsMenuOpen }
end)