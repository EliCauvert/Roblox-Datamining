return function(p1, p2, p3: number, p4: number, p5: number, p6, p7) --[[ Line: 9 ]]
	if p1 and not p2 and p3 ~= nil and p4 ~= nil then
		local Largest = math.max(0, p3 - p5 * 2)
		local v1 = p6 + p7
		local IsLargestBelow = Largest < p4 + v1 * 2
		
		return {
			isPinned = IsLargestBelow,
			textLeft = if IsLargestBelow then p5 + v1 else (p3 - p4) / 2,
			textWidth = math.min(p4, if IsLargestBelow then math.max(0, Largest - v1) else Largest)
		}
	else
		return nil
	end
end