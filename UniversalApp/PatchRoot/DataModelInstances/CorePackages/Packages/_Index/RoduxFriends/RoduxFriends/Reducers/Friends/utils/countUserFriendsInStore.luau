return function(p0)
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = #v
	end
	return t
end