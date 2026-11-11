return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(RangeId, p1, SliderValue)
	return {
		rangeId = RangeId,
		color3 = p1,
		sliderValue = SliderValue
	}
end)