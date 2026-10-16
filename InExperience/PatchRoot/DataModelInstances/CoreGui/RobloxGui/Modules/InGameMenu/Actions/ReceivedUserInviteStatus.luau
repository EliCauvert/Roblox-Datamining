return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("RECEIVED_USER_INVITE_STATUS", function(p1, InviteStatus) --[[ Line: 5 ]]
	return { userId = tostring(p1), inviteStatus = InviteStatus }
end)