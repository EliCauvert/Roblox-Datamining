return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(MinimumDeltaEBodyColorDifference, ScalesRules, AccessoryRefinementTypes, AccessoryRefinementLowerBounds, AccessoryRefinementUpperBounds)
	return {
		minimumDeltaEBodyColorDifference = MinimumDeltaEBodyColorDifference,
		scalesRules = ScalesRules,
		accessoryRefinementTypes = AccessoryRefinementTypes,
		accessoryRefinementLowerBounds = AccessoryRefinementLowerBounds,
		accessoryRefinementUpperBounds = AccessoryRefinementUpperBounds
	}
end)