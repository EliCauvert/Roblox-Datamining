return function(p0, p1)
	local cloned = table.clone(p0)
	
	for i, v in p1 do
		cloned[i] = v
	end
	return cloned
end