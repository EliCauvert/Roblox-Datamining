return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChildName, Property, Value) --[[ Line: 11 ]]
	return {
		childName = ChildName,
		property = Property,
		value = Value
	}
end)