return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AdjustmentType)
	return { adjustmentType = AdjustmentType }
end)