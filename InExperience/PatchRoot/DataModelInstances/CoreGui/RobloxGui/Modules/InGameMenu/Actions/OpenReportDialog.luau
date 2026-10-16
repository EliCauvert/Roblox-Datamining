return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("OPEN_REPORT_DIALOG", function(UserId, UserName) --[[ Line: 5 ]]
	return { userId = UserId, userName = UserName }
end)