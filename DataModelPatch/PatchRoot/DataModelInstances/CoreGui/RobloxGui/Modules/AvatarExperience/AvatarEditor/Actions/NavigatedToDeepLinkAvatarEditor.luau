return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { category = p1.category, subcategory = p1.subcategory }
end)