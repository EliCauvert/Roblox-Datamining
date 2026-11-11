return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(IsSmallTouchScreen)
	return { isSmallTouchScreen = IsSmallTouchScreen }
end)