return function(p1, p2, p3)
	if p1 == nil or p2 == nil then
		return false, nil
	end
	local var1 = p1
	
	for i = p3 or 1, #p2 do
		local var2 = p2[i]
		
		if var1 ~= nil then
			var1 = var1[var2]
			continue
		end
		return false, nil
	end
	return var1 ~= nil, var1
end