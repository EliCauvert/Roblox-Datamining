return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return {
		reportCategory = p0,
		reportType = p1,
		annotationPoints = p2
	}
end)