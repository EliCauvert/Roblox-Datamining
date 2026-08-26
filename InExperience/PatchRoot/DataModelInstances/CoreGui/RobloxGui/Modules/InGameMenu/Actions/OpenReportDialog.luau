return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("OPEN_REPORT_DIALOG", function(p1, p2)
	return { userId = p1, userName = p2 }
end)