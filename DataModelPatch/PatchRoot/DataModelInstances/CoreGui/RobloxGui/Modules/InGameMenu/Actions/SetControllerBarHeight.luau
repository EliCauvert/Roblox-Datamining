return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_CONTROLLER_BAR_HEIGHT", function(ControllerBarHeight)
	return { controllerBarHeight = ControllerBarHeight }
end)