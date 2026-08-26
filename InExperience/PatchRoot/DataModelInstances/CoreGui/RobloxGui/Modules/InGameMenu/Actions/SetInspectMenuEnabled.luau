return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_INSPECT_MENU_ENABLED", function(p1)
	return { enabled = p1 }
end)