return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(RangeId)
	return { rangeId = RangeId }
end)