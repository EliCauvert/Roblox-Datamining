return function(List)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = #value
	end
	return t
end