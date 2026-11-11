return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(BodyPartRangeIds)
	return { bodyPartRangeIds = BodyPartRangeIds }
end)