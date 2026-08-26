local function _(value)
	local ceiled = math.ceil(value)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return math.max(0, ceiled)
end

return function(p1)
	local ceiled = math.ceil(p1 * 3 / 4)
	
	if ceiled % 2 == 1 then
		ceiled += 1
	end
	return math.max(0, ceiled)
end