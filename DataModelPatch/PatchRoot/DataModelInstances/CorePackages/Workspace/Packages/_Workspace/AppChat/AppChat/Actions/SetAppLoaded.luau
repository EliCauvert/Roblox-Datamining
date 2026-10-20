return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(Value)
	return { value = Value }
end)