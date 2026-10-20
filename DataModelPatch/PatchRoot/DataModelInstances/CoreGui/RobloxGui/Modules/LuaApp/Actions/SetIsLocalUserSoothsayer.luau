return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(IsSoothsayer)
	return { isSoothsayer = IsSoothsayer }
end)