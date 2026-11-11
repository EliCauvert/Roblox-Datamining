return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportType, TargetPlayer, SortedUserIds)
	return {
		reportType = ReportType,
		targetPlayer = TargetPlayer,
		sortedUserIds = SortedUserIds
	}
end)