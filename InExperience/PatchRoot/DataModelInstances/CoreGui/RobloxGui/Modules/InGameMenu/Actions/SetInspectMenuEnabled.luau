return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_INSPECT_MENU_ENABLED", function(Enabled)
	return { enabled = Enabled }
end)