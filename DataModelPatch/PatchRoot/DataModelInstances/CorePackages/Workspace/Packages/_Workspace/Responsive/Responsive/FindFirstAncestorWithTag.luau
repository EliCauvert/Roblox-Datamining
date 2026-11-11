function FindFirstAncestorWithTag(Object, Tag)
	return if Object == nil then nil elseif Object:HasTag(Tag) then Object else FindFirstAncestorWithTag(Object.Parent, Tag)
end

return FindFirstAncestorWithTag