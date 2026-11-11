return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Tag)
	return { tag = Tag }
end)