return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, InviteStatus)
	return { userId = tostring(p1), inviteStatus = InviteStatus }
end)