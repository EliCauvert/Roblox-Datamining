return require(script:FindFirstAncestor("DeviceOrientationRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { deviceOrientation = p0 }
end)