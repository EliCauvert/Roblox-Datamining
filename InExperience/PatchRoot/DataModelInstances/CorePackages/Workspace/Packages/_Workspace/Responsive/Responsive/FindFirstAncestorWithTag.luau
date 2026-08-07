function FindFirstAncestorWithTag(p0, p1) --[[ line: 1 ]]
	return if p0 == nil then nil elseif p0:HasTag(p1) then p0 else FindFirstAncestorWithTag(p0.Parent, p1)
end

return FindFirstAncestorWithTag