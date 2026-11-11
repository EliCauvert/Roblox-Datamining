return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(BodyColor3s)
	return { bodyColor3s = BodyColor3s }
end)