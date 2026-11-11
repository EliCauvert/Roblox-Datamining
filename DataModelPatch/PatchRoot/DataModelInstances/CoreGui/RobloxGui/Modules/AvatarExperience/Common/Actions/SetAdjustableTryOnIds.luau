return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AdjustableTryOnIds)
	return { adjustableTryOnIds = AdjustableTryOnIds }
end)