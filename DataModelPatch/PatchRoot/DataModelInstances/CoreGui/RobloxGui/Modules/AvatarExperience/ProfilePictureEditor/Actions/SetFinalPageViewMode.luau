return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(FinalPageViewMode)
	return { finalPageViewMode = FinalPageViewMode }
end)