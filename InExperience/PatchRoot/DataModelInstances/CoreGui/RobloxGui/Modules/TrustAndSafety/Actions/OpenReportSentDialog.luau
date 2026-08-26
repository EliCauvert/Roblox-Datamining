return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { reportType = p1, targetPlayer = p2, reportCategory = p3 }
end)