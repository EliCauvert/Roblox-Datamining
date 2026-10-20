return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(View)
	return { view = View }
end)