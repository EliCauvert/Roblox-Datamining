return function(Object, Text: string)
	Object:AddTag("facet-" .. string.lower(Text))
	
	return Object
end