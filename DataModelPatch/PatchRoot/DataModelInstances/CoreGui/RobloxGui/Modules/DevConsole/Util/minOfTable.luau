return function(List, p1)
	local t = {}
	
	for i, value in pairs(List) do
		if not p1[i] then
			error("tables did not have matching indices")
			
			return
		end
		t[i] = value < p1[i] and value or p1[i]
	end
	return t
end