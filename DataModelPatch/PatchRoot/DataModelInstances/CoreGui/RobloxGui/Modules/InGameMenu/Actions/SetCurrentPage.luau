return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_CURRENT_PAGE", function(NewPage)
	return { newPage = NewPage }
end)