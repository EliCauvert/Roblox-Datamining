return function(p1, ...)
	local cloned = table.clone(p1)
	
	for i, v in { ... } do
		cloned[v] = nil
	end
	return cloned
end