return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(FieldOfViewDeg)
	return { fieldOfViewDeg = FieldOfViewDeg }
end)