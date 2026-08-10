return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 9 ]]
	if p0 and not p1 and (p2 ~= nil and p3 ~= nil) then
		local maxValue = math.max(0, p2 - p4 * 2)
		local var1 = p5 + p6
		local var2 = maxValue < p3 + var1 * 2
		
		return {
			isPinned = var2,
			textLeft = if var2 then p4 + var1 else (p2 - p3) / 2,
			textWidth = math.min(p3, if var2 then math.max(0, maxValue - var1) else maxValue)
		}
	end
	return nil
end