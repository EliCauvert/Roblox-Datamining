return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(EntryPage)
	return { entryPage = EntryPage }
end)