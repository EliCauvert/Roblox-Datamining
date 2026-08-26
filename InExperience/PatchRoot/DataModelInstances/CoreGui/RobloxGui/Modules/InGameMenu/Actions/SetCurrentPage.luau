return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_CURRENT_PAGE", function(p1)
	return { newPage = p1 }
end)