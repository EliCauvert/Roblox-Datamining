return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Locale)
	return { locale = Locale }
end)