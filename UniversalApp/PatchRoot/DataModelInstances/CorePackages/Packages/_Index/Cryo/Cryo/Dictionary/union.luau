return function(p1, p2)
	local cloned = table.clone(p1)
	
	for i, v in p2 do
		cloned[i] = v
	end
	return cloned
end