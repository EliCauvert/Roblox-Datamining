return function(p0, p1, p2, p3) --[[ line: 9 | named "resampleWaveformPeaks" ]]
	local t = {}
	local p0Count = #p0
	
	for i_1 = 1, p1 do
		local var2 = p2
		
		if p0Count <= 0 then
			table.insert(t, var2)
			continue
		end
		local var3 = math.floor((i_1 - 1) / p1 * p0Count) + 1
		local var4 = 0
		
		for i = var3, math.max(var3, math.floor(i_1 / p1 * p0Count)) do
			var4 = math.max(var4, p0[i])
		end
		var2 = math.clamp(var4, p2, p3)
	end
	return t
end