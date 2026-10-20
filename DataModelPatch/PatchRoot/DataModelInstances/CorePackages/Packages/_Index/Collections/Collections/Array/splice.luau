local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(List, Value: number, p1, ...)
	if #List < Value then
		for i = 1, select("#", ...) do
			table.insert(List, (select(i, ...)))
		end
		return {}
	else
		local CountList = #List
		
		if Value < 1 then
			Value = math.max(CountList - math.abs(Value), 1)
		end
		local List1 = {}
		local P0 = p1 or CountList
		
		if P0 > 0 then
			for _ = Value, math.min(CountList, Value + math.max(0, P0 - 1)) do
				table.insert(List1, (table.remove(List, Value)))
			end
		end
		for i1 = select("#", ...), 1, -1 do
			table.insert(List, Value, (select(i1, ...)))
		end
		return List1
	end
end