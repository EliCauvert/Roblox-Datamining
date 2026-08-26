function FindFirstAncestorWithTag(p1, p2)
	return if p1 == nil then nil elseif p1:HasTag(p2) then p1 else FindFirstAncestorWithTag(p1.Parent, p2)
end

return FindFirstAncestorWithTag