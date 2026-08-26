return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_SCREEN_SIZE", function(p1)
	return { newScreenSize = p1 }
end)