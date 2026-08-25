return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("OPEN_REPORT_DIALOG", function(p0, p1)
	return { userId = p0, userName = p1 }
end)