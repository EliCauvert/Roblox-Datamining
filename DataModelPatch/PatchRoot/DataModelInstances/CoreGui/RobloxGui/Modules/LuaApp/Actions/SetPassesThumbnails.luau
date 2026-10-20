return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PassesThumbnails)
	return { passesThumbnails = PassesThumbnails }
end)