return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return {
		reportCategory = p1,
		reportType = p2,
		annotationPoints = p3
	}
end)