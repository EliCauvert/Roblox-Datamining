return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ScreenSize)
	return { screenSize = ScreenSize }
end)