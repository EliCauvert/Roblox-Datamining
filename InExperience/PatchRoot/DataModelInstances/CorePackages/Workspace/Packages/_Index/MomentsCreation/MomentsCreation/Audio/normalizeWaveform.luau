return function(List)
	local Largest = 0
	local List1 = {}
	
	for _, value in List do
		local Magnitude = math.abs(value)
		table.insert(List1, Magnitude)
		Largest = math.max(Largest, Magnitude)
	end
	if Largest == 0 then
		return List1
	end
	local List2 = {}
	
	for _, value1 in List1 do
		table.insert(List2, value1 / Largest)
	end
	return List2
end