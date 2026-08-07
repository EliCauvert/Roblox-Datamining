return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 13 ]]
	return { userId = tostring(p0), newState = p1 }
end)