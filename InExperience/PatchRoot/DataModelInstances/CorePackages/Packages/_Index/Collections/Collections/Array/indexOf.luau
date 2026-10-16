local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3): number --[[ Line: 27 ]]
	local Value = p3 or 1
	local CountP0 = #p1
	
	if Value < 1 then
		Value = math.max(CountP0 - math.abs(Value), 1)
	end
	for i = Value, CountP0 do
		if p1[i] == p2 then
			return i
		end
	end
	return -1
end