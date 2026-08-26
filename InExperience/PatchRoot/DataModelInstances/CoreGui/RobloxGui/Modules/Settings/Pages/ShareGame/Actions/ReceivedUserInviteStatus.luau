return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { userId = tostring(p1), inviteStatus = p2 }
end)