return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(DeviceLayout)
	return { deviceLayout = DeviceLayout }
end)