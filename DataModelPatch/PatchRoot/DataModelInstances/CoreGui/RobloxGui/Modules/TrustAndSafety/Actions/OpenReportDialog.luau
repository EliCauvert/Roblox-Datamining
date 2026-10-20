return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportType, TargetPlayer, OnGoBack)
	return {
		reportType = ReportType,
		targetPlayer = TargetPlayer,
		onGoBack = OnGoBack
	}
end)