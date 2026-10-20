return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ReportCategory)
	return { reportCategory = ReportCategory }
end)