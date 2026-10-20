return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Name, Description)
	return { name = Name, description = Description }
end)