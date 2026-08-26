return require(script:FindFirstAncestor("DeviceOrientationRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { deviceOrientation = p1 }
end)