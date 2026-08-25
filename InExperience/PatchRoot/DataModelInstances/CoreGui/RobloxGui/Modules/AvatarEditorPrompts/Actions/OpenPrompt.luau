return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { promptType = p0, promptInfo = p1 }
end)