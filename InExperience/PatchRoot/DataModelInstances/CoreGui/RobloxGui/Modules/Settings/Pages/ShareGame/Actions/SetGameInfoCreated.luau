return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Created)
	return { Created = Created }
end)