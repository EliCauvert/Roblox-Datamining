return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_SCREEN_SIZE", function(NewScreenSize)
	return { newScreenSize = NewScreenSize }
end)