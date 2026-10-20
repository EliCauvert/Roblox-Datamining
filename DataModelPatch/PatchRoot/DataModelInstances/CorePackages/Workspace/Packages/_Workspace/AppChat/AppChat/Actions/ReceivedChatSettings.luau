return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(Result)
	assert(type(Result) == "table", script.Name .. ": result must be a table")
	
	return { result = Result }
end)