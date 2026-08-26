return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_LOCALE_ID", function(p1)
	return { newLocaleId = p1 }
end)