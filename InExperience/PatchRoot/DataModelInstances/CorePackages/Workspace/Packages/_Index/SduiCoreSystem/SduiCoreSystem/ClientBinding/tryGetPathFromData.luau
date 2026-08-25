return function(p0, p1, p2)
	if p0 == nil or p1 == nil then
		return false, nil
	end
	local var0 = p0
	
	for i = p2 or 1, #p1 do
		local var1 = p1[i]
		
		if var0 ~= nil then
			var0 = var0[var1]
			continue
		end
		return false, nil
	end
	return var0 ~= nil, var0
end