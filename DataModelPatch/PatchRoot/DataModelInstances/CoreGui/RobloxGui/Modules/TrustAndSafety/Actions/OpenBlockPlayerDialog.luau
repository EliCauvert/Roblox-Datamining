return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(TargetPlayer)
	return { targetPlayer = TargetPlayer }
end)