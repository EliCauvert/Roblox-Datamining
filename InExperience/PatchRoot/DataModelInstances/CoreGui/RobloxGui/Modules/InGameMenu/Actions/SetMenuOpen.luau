return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_MENU_OPEN", function(p0)
	return { isMenuOpen = p0 }
end)