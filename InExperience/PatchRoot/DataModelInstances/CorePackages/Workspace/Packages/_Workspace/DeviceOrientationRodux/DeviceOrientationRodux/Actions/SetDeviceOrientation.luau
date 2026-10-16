return require(script:FindFirstAncestor("DeviceOrientationRodux").Parent.Rodux).makeActionCreator(script.Name, function(DeviceOrientation) --[[ Line: 5 ]]
	return { deviceOrientation = DeviceOrientation }
end)