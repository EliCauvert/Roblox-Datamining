return function(p1, p2)
	return if p1 or p2 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
end