return function(p1)
	local var1 = 0
	local t = {}
	
	for i, v in p1 do
		local absValue = math.abs(v)
		table.insert(t, absValue)
		var1 = math.max(var1, absValue)
	end
	if var1 == 0 then
		return t
	end
	local t_1 = {}
	
	for i_1, v_1 in t do
		table.insert(t_1, v_1 / var1)
	end
	return t_1
end