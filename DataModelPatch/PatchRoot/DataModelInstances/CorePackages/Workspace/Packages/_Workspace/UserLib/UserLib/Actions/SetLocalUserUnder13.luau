return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(IsUnder13)
	return { isUnder13 = IsUnder13 }
end)