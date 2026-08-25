return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { userId = tostring(p0), inviteStatus = p1 }
end)