return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportType, TargetPlayer, ReportCategory) --[[ Line: 5 ]]
	return {
		reportType = ReportType,
		targetPlayer = TargetPlayer,
		reportCategory = ReportCategory
	}
end)