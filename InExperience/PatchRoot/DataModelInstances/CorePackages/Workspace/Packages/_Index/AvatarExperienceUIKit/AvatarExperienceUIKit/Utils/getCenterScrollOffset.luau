return function(p1, p2: number, p3: number, p4: number)
	if p4 <= 0 then
		return nil
	else
		local Largest = math.max(0, p1 + p2 * 0.5 - p4 * 0.5)
		
		return if math.abs(Largest - p3) < 1 then nil else Largest
	end
end