return function(List, p1) --[[ Line: 2 ]]
	local t = {}
	
	for i, value in pairs(List) do
		if not p1[i] then
			error("tables did not have matching indices")
			
			return
		end
		t[i] = value < p1[i] and p1[i] or value
	end
	return t
end