return function(p1: number, Callback, p2: number, p3: number)
	local Largest = math.max(1, p2)
	local Largest1 = math.max(0, math.min(p1, p3) - Largest + 1)
	local Buffer = table.create(Largest1)
	
	for i = 1, Largest1 do
		Buffer[i] = Callback(Largest + i - 1)
	end
	return Buffer
end