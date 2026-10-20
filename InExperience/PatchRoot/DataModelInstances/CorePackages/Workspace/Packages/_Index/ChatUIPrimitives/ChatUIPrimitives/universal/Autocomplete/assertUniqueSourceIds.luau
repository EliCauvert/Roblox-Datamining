return function(List)
	local t = {}
	
	for _, value in List do
		assert(type(value.id) == "string" and value.id ~= "", "Autocomplete source id is required")
		assert(t[value.id] == nil, "Duplicate autocomplete source id: " .. value.id)
		t[value.id] = true
	end
end