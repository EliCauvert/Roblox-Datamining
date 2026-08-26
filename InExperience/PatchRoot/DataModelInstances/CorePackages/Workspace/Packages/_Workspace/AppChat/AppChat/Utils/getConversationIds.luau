return function(p1)
	local t = {}
	
	for i, v in p1 do
		t[i] = tostring(v.id)
	end
	return t
end