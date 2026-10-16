return function(p1, p2, MinValue: number, MaxValue: number) --[[ Line: 9 | Named "resampleWaveformPeaks" ]]
	local ClampedValues = {}
	local CountP0 = #p1
	
	for i = 1, p2 do
		local ClampedValue: number = MinValue
		
		if CountP0 > 0 then
			local NewFloored = math.floor((i - 1) / p2 * CountP0) + 1
			local Value = 0
			
			for i1 = NewFloored, math.max(NewFloored, (math.floor(i / p2 * CountP0))) do
				Value = math.max(Value, p1[i1])
			end
			ClampedValue = math.clamp(Value, MinValue, MaxValue)
		end
		table.insert(ClampedValues, ClampedValue)
	end
	return ClampedValues
end