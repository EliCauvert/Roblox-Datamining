return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0)
	return { targetPlayer = p0 }
end)