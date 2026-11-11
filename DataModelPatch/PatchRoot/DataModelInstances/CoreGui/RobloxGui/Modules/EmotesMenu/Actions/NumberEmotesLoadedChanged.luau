return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(NumberEmotesLoaded)
	return { numberEmotesLoaded = NumberEmotesLoaded }
end)