return function(p1, p2, p3, p4)
	local t = {}
	local p0Count = #p1
	
	for i_1 = 1, p2 do
		local var1 = p3
		
		if p0Count <= 0 then
			table.insert(t, var1)
			continue
		end
		local var2 = math.floor((i_1 - 1) / p2 * p0Count) + 1
		local var3 = 0
		
		for i = var2, math.max(var2, math.floor(i_1 / p2 * p0Count)) do
			var3 = math.max(var3, p1[i])
		end
		var1 = math.clamp(var3, p3, p4)
	end
	return t
end