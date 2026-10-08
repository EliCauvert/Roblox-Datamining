local function fitKeypoints(p1)
	local t = {}
	
	for i, v in p1 do
		local clampedValue = math.clamp(v.Time, 0, 1)
		local value = v.Value
		local var1 = t[#t]
		
		if var1 == nil then
			table.insert(t, NumberSequenceKeypoint.new(0, value))
		elseif var1.Time < clampedValue then
			table.insert(t, NumberSequenceKeypoint.new(clampedValue, value))
		end
	end
	local var2 = t[#t]
	
	if var2 == nil then
		return {
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 1)
		}
	elseif var2.Time < 1 then
		table.insert(t, NumberSequenceKeypoint.new(1, var2.Value))
	end
	return t
end

return {
	fittedGradientTransparency = function(p2, p3, p4)
		-- upvalues: fitKeypoints (ref)
		local var3 = 1 - p4
		local clampedValue = math.clamp(var3 * p2[1], 0, 1)
		local clampedValue_1 = math.clamp(var3 * p2[2], 0, 1)
		local var4 = p2[3]
		
		if var4 < 1 then
			return nil
		end
		local var5 = if var4 < p3 then 1 else p3 / var4
		local var6 = (if clampedValue > 0 then var5 * (clampedValue + 1) else 0) + (if clampedValue_1 > 0 then var5 * (clampedValue_1 + 1) else 0)
		
		if var6 > 1 then
			var5 /= var6
		end
		local t = {}
		
		if clampedValue > 0 then
			table.insert(t, NumberSequenceKeypoint.new(0, 1 - clampedValue))
			table.insert(t, NumberSequenceKeypoint.new(var5, 1 - clampedValue))
			table.insert(t, NumberSequenceKeypoint.new(var5 + var5 * clampedValue, 1))
		else
			table.insert(t, NumberSequenceKeypoint.new(0, 1))
		end
		if clampedValue_1 > 0 then
			table.insert(t, NumberSequenceKeypoint.new(1 - var5 * clampedValue_1 - var5, 1))
			table.insert(t, NumberSequenceKeypoint.new(1 - var5, 1 - clampedValue_1))
			table.insert(t, NumberSequenceKeypoint.new(1, 1 - clampedValue_1))
		else
			table.insert(t, NumberSequenceKeypoint.new(1, 1))
		end
		return NumberSequence.new(fitKeypoints(t))
	end
}