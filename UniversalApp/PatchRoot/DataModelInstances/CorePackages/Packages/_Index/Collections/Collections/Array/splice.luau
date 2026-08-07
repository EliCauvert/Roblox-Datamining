local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2, ...) --[[ line: 24 ]]
	if #p0 < p1 then
		for i = 1, select("#", ...) do
			table.insert(p0, select(i, ...))
		end
		return {}
	else
		local p0Count = #p0
		
		if p1 < 1 then
			p1 = math.max(p0Count - math.abs(p1), 1)
		end
		local t = {}
		p2 = p2 or p0Count
		
		if p2 > 0 then
			for _ = p1, math.min(p0Count, p1 + math.max(0, p2 - 1)) do
				table.insert(t, table.remove(p0, p1))
			end
		end
		for i_1 = select("#", ...), 1, -1 do
			table.insert(p0, p1, select(i_1, ...))
		end
		return t
	end
end