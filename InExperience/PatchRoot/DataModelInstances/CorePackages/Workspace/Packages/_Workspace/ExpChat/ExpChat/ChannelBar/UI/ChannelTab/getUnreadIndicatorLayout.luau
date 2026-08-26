return function(p1, p2, p3, p4, p5, p6, p7)
	if p1 and not p2 and (p3 ~= nil and p4 ~= nil) then
		local maxValue = math.max(0, p3 - p5 * 2)
		local var1 = p6 + p7
		local var2 = maxValue < p4 + var1 * 2
		
		return {
			isPinned = var2,
			textLeft = if var2 then p5 + var1 else (p3 - p4) / 2,
			textWidth = math.min(p4, if var2 then math.max(0, maxValue - var1) else maxValue)
		}
	end
	return nil
end