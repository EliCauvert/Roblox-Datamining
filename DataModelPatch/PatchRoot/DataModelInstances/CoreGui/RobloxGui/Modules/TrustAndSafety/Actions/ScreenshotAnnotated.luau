return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportCategory, ReportType, AnnotationPoints)
	return {
		reportCategory = ReportCategory,
		reportType = ReportType,
		annotationPoints = AnnotationPoints
	}
end)