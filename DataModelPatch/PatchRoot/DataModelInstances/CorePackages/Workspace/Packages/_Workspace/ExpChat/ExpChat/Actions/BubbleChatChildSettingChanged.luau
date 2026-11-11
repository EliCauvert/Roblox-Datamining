return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChildName, Property, Value)
	return {
		childName = ChildName,
		property = Property,
		value = Value
	}
end)