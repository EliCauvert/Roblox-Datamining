return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(Property, Value)
	return { property = Property, value = Value }
end)