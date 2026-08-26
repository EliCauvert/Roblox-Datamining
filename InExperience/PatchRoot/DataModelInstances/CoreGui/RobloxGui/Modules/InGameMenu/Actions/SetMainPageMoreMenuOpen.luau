return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_MORE_MENU_OPEN", function(p1)
	return { isMainPageMoreMenuOpen = p1 }
end)