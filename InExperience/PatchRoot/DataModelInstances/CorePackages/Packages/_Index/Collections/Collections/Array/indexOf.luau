local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 27 ]]
	p2 = p2 or 1
	local p0Count = #p0
	
	if p2 < 1 then
		p2 = math.max(p0Count - math.abs(p2), 1)
	end
	for i = p2, p0Count do
		if p0[i] ~= p1 then
			continue
		end
		return i
	end
	return -1
end