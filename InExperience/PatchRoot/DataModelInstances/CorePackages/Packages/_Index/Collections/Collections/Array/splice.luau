local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3, ...)
	if #p1 < p2 then
		for i = 1, select("#", ...) do
			table.insert(p1, select(i, ...))
		end
		return {}
	else
		local p0Count = #p1
		
		if p2 < 1 then
			p2 = math.max(p0Count - math.abs(p2), 1)
		end
		local t = {}
		p3 = p3 or p0Count
		
		if p3 > 0 then
			for _ = p2, math.min(p0Count, p2 + math.max(0, p3 - 1)) do
				table.insert(t, table.remove(p1, p2))
			end
		end
		for i_1 = select("#", ...), 1, -1 do
			table.insert(p1, p2, select(i_1, ...))
		end
		return t
	end
end