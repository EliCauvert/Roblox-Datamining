return function(p1, p2, p3)
	if p1 == nil or p2 == nil then
		return false, nil
	end
	local v1 = p1
	
	for i = p3 or 1, #p2 do
		local v2 = p2[i]
		
		if v1 == nil then
			return false, nil
		end
		v1 = v1[v2]
	end
	return v1 ~= nil, v1
end