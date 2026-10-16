return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportType, TargetPlayer) --[[ Line: 5 ]]
	return { reportType = ReportType, targetPlayer = TargetPlayer }
end)