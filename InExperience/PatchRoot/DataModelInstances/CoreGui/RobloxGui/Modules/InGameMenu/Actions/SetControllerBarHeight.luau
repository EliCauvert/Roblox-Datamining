return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_CONTROLLER_BAR_HEIGHT", function(p1)
	return { controllerBarHeight = p1 }
end)