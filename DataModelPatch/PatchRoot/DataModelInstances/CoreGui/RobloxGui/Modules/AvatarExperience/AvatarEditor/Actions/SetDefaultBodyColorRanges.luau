return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(DefaultBodyColorRanges)
	return { defaultBodyColorRanges = DefaultBodyColorRanges }
end)