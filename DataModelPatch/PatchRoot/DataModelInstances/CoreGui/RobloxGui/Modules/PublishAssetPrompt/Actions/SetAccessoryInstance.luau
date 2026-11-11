return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AccessoryInstance)
	return { accessoryInstance = AccessoryInstance }
end)