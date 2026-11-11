return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_LOCALE_ID", function(NewLocaleId)
	return { newLocaleId = NewLocaleId }
end)