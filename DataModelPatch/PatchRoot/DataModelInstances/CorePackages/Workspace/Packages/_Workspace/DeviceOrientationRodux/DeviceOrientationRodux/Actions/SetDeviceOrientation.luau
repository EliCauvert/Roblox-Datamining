return require(script:FindFirstAncestor("DeviceOrientationRodux").Parent.Rodux).makeActionCreator(script.Name, function(DeviceOrientation)
	return { deviceOrientation = DeviceOrientation }
end)