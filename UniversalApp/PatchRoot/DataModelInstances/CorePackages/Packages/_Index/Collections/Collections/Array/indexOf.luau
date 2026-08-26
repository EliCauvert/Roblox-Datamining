local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	p3 = p3 or 1
	local p0Count = #p1
	
	if p3 < 1 then
		p3 = math.max(p0Count - math.abs(p3), 1)
	end
	for i = p3, p0Count do
		if p1[i] ~= p2 then
			continue
		end
		return i
	end
	return -1
end