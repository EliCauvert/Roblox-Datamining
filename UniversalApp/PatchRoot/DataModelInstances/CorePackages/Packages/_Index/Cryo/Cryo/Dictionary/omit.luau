return function(p0, ...) --[[ line: 6 | named "omit" ]]
	local cloned = table.clone(p0)
	
	for i, v in { ... } do
		cloned[v] = nil
	end
	return cloned
end