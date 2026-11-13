return function(Object, p1, p2)
	local Tags = {}
	
	for _, Tag in if type(p1) == "string" then { p1 } else p1 do
		assert(type(Tag) == "string", "Facet.tag: tags must contain strings")
		
		if p2 and p2[Tag] or not Object:HasTag(Tag) then
			Tags[Tag] = true
		end
	end
	local P2 = p2 or {}
	for Tag1 in P2 do
		if not Tags[Tag1] then
			Object:RemoveTag(Tag1)
		end
	end
	for tag in Tags do
		Object:AddTag(tag)
	end
	return Tags
end