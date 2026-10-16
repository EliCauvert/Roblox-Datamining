return function(List) --[[ Line: 3 ]]
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = #value
	end
	return t
end