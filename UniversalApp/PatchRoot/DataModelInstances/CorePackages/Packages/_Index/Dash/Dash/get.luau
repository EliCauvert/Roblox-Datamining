return function(p1, List, p2) --[[ Line: 22 | Named "get" ]]
	if p1 == nil then
		return p2
	end
	local v1 = p1
	
	for _, value in List do
		if type(v1) ~= "table" then
			return p2
		end
		v1 = v1[value]
		
		if v1 == nil then
			return p2
		end
	end
	return v1
end