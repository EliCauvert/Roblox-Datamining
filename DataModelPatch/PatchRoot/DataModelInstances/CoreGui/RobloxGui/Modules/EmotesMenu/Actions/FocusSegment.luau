return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SegmentIndex)
	return { segmentIndex = SegmentIndex }
end)