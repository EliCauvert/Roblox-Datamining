return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, NewState) --[[ Line: 13 ]]
	return { userId = tostring(p1), newState = NewState }
end)