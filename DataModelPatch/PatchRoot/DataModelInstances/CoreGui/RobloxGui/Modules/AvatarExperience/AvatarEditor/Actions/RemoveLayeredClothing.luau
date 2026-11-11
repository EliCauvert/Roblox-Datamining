return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(HasLayeredHair)
	return { hasLayeredHair = HasLayeredHair }
end)