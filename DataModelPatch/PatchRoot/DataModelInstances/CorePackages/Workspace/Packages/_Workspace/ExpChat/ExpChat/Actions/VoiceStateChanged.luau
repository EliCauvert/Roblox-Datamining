return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, NewState)
	return { userId = tostring(p1), newState = NewState }
end)