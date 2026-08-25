return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("RECEIVED_USER_INVITE_STATUS", function(p0, p1)
	return { userId = tostring(p0), inviteStatus = p1 }
end)