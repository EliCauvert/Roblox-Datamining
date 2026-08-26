return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "table", script.Name .. ": result must be a table")
	
	return { result = p1 }
end)