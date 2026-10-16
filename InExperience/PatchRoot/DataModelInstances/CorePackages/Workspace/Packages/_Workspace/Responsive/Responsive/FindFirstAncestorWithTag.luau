function FindFirstAncestorWithTag(Object, Tag) --[[ Line: 1 ]]
	return if Object == nil then nil elseif Object:HasTag(Tag) then Object else FindFirstAncestorWithTag(Object.Parent, Tag)
end

return FindFirstAncestorWithTag