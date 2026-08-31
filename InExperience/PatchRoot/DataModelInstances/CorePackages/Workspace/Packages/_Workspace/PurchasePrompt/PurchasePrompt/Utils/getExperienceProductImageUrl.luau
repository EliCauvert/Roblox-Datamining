return function(p1, p2)
	return if p1 and p1 ~= "" then p1 else string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", tostring(p2))
end