return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(IsActive)
	return { isActive = IsActive }
end)