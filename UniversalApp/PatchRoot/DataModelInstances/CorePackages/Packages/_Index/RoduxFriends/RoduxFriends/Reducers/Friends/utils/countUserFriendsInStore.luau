return function(p1)
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = #v
	end
	return t
end