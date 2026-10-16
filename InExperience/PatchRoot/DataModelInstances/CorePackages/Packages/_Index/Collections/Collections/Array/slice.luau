local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3) --[[ Line: 23 ]]
	if typeof(p1) ~= "table" then
		error(string.format("Array.slice called on %s", (typeof(p1))))
	end
	local CountP0 = #p1
	local Value = p2 or 1
	local Value1 = if p3 == nil or CountP0 + 1 < p3 then CountP0 + 1 else p3
	
	if CountP0 + 1 < Value then
		return {}
	end
	local t = {}
	
	if Value < 1 then
		Value = math.max(CountP0 - math.abs(Value), 1)
	end
	if Value1 < 1 then
		Value1 = math.max(CountP0 - math.abs(Value1), 1)
	end
	local Count: number = Value
	local Count1 = 1
	while Count < Value1 do
		t[Count1] = p1[Count]
		Count += 1
		Count1 += 1
	end
	return t
end