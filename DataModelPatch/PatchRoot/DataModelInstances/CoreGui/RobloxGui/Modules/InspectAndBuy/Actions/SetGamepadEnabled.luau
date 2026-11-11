return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(GamepadEnabled)
	return { gamepadEnabled = GamepadEnabled }
end)