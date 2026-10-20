return function(List, p1, p2): boolean
	local Flag = false
	
	for _, value in List do
		local v1 = value[p2]
		
		if v1 and not p1[v1] then
			p1[v1] = true
			Flag = true
		end
	end
	return Flag
end