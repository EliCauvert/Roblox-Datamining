return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Query, Context)
	return { query = Query, context = Context }
end)