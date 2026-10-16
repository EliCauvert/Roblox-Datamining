return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportType, TargetPlayer, OnGoBack) --[[ Line: 5 ]]
	return {
		reportType = ReportType,
		targetPlayer = TargetPlayer,
		onGoBack = OnGoBack
	}
end)