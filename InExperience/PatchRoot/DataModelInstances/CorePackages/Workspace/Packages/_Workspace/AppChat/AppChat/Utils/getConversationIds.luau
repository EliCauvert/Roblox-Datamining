return function(p0)
	local t = {}
	
	for i, v in p0 do
		t[i] = tostring(v.id)
	end
	return t
end