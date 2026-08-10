local function _(p0) --[[ line: 10 | named "ulp" ]]
	local absValue = math.abs(p0)
	
	if absValue == 0 then
		return 0
	end
	local _, var1 = math.frexp(absValue)
	
	return if var1 <= -1022 then 0 else 2 ^ (var1 - 53)
end

return {
	INTERVAL = 0.016666666667,
	slotAt = function(p1, p2) --[[ line: 23 ]]
		local var5
		local var2 = (p2 - p1) * 60
		local ceiled = math.ceil(var2)
		local absValue = math.abs(p2)
		
		if absValue == 0 then
			var5 = 0
		else
			local _, var6 = math.frexp(absValue)
			var5 = if var6 <= -1022 then 0 else 2 ^ (var6 - 53)
		end
		local var8
		local absValue_1 = math.abs(p1)
		
		if absValue_1 == 0 then
			var8 = 0
		else
			local _, var9 = math.frexp(absValue_1)
			var8 = if var9 <= -1022 then 0 else 2 ^ (var9 - 53)
		end
		local var12
		local var10 = (var5 + var8) * 60
		local absValue_2 = math.abs(var2)
		
		if absValue_2 == 0 then
			var12 = 0
		else
			local _, var13 = math.frexp(absValue_2)
			var12 = if var13 <= -1022 then 0 else 2 ^ (var13 - 53)
		end
		if ceiled - var2 <= var10 + var12 then
			var2 = ceiled
		end
		return math.floor(var2)
	end,
	idealTimeAt = function(p3, p4) --[[ line: 33 ]]
		return p3 + p4 * 0.016666666667
	end
}