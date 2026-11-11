local function _(Value: number): number
	local Ceiled = math.ceil(Value)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	return (math.max(0, Ceiled))
end

return function(p1: number): number
	local Ceiled = math.ceil(p1 * 3 / 4)
	
	if Ceiled % 2 == 1 then
		Ceiled += 1
	end
	return (math.max(0, Ceiled))
end