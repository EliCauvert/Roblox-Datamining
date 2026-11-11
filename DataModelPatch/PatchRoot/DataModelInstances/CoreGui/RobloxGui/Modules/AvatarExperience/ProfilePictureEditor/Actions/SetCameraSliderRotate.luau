return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(RotateSliderValue)
	return { rotateSliderValue = RotateSliderValue }
end)