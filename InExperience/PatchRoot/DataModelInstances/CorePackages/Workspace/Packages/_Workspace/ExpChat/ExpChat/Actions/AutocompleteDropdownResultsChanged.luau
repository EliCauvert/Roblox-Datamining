return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(Results, Query)
	return { results = Results, query = Query }
end)