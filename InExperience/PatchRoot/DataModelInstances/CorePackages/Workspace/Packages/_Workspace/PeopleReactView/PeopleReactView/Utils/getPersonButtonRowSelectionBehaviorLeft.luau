return function(p1, p2) --[[ Line: 1 ]]
	return if p1 or p2 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
end