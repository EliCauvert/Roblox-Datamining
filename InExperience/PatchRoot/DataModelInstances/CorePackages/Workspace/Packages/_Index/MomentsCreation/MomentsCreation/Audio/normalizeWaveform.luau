return function(p0)
	local var0 = 0
	local t = {}
	
	for i, v in p0 do
		local absValue = math.abs(v)
		table.insert(t, absValue)
		var0 = math.max(var0, absValue)
	end
	if var0 == 0 then
		return t
	end
	local t_1 = {}
	
	for i_1, v_1 in t do
		table.insert(t_1, v_1 / var0)
	end
	return t_1
end