return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { reportType = p0, targetPlayer = p1 }
end)