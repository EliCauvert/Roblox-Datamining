return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("OPEN_REPORT_DIALOG", function(UserId, UserName)
	return { userId = UserId, userName = UserName }
end)