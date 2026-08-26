return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { segmentIndex = p1 }
end)