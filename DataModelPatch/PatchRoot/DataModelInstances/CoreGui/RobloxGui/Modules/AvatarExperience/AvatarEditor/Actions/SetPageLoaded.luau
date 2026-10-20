return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Value)
	return { value = Value }
end)