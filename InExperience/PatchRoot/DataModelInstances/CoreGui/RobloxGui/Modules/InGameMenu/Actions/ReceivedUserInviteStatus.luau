return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("RECEIVED_USER_INVITE_STATUS", function(p1, p2)
	return { userId = tostring(p1), inviteStatus = p2 }
end)