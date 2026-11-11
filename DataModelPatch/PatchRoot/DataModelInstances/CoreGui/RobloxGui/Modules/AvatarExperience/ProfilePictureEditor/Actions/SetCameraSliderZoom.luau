return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ZoomSliderValue)
	return { zoomSliderValue = ZoomSliderValue }
end)