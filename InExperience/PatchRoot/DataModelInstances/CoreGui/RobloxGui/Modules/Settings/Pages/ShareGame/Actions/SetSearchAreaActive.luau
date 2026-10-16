return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(IsActive) --[[ Line: 5 ]]
	return { isActive = IsActive }
end)