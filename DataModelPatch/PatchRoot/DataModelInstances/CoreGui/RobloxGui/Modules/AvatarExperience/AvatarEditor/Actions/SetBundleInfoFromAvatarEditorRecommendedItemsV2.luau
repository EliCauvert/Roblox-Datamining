return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Bundles)
	return { bundles = Bundles }
end)