return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 6 ]]
	assert(type(p0) == "table", script.Name .. ": result must be a table")
	
	return { result = p0 }
end)