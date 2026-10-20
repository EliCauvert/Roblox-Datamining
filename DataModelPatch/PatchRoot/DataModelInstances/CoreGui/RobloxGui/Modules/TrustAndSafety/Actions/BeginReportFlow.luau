return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportType, TargetPlayer)
	return { reportType = ReportType, targetPlayer = TargetPlayer }
end)