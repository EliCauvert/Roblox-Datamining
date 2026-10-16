return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_MORE_MENU_OPEN", function(IsMainPageMoreMenuOpen) --[[ Line: 5 ]]
	return { isMainPageMoreMenuOpen = IsMainPageMoreMenuOpen }
end)