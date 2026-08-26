return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_MENU_OPEN", function(p1)
	return { isMenuOpen = p1 }
end)