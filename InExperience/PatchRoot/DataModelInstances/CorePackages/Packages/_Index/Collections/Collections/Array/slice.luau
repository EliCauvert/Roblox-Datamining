local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	if typeof(p1) ~= "table" then
		error(string.format("Array.slice called on %s", typeof(p1)))
	end
	local p0Count = #p1
	p2 = p2 or 1
	local _ = nil
	local var1 = if p3 == nil or p0Count + 1 < p3 then p0Count + 1 else p3
	
	if p0Count + 1 < p2 then
		return {}
	end
	local t = {}
	
	if p2 < 1 then
		p2 = math.max(p0Count - math.abs(p2), 1)
	end
	if var1 < 1 then
		var1 = math.max(p0Count - math.abs(var1), 1)
	end
	local var2 = p2
	local var3 = 1
	while var2 < var1 do
		t[var3] = p1[var2]
		var2 += 1
		var3 += 1
	end
	return t
end