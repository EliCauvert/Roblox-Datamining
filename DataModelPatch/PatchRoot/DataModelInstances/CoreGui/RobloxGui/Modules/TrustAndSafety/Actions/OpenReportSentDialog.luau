return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportType, TargetPlayer, ReportCategory)
	return {
		reportType = ReportType,
		targetPlayer = TargetPlayer,
		reportCategory = ReportCategory
	}
end)