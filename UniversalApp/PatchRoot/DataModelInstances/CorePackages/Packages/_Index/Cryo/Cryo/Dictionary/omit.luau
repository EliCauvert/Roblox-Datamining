return function(p0, ...)
	local cloned = table.clone(p0)
	
	for i, v in { ... } do
		cloned[v] = nil
	end
	return cloned
end