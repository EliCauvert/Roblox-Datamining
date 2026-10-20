return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SourceLanguageName)
	return { sourceLanguageName = SourceLanguageName }
end)