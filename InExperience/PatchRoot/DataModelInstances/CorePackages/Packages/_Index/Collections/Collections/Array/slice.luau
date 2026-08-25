local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2)
	if typeof(p0) ~= "table" then
		error(string.format("Array.slice called on %s", typeof(p0)))
	end
	local p0Count = #p0
	p1 = p1 or 1
	local _ = nil
	local var2 = if p2 == nil or p0Count + 1 < p2 then p0Count + 1 else p2
	
	if p0Count + 1 < p1 then
		return {}
	end
	local t = {}
	
	if p1 < 1 then
		p1 = math.max(p0Count - math.abs(p1), 1)
	end
	if var2 < 1 then
		var2 = math.max(p0Count - math.abs(var2), 1)
	end
	local var4 = p1
	local var5 = 1
	while var4 < var2 do
		t[var5] = p0[var4]
		var4 += 1
		var5 += 1
	end
	return t
end