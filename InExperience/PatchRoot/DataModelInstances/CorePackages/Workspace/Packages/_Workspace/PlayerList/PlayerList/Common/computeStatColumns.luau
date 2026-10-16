local _ = require(script.Parent.Parent.Parent.LeaderboardStore)

return function(p1, p2) --[[ Line: 19 | Named "computeStatColumns" ]]
	if not p1 then
		return {}
	end
	local List = {}
	p1.iterateData(function(Name, p3) --[[ Line: 25 ]]
		-- upvalues: List (copy)
		table.insert(List, { name = Name, order = p3.order(false) })
	end, false)
	table.sort(List, function(A, B): boolean --[[ Line: 29 ]]
		return A.order < B.order
	end)
	local List1 = {}
	
	for i, value in ipairs(List) do
		if p2 < i then break end
		table.insert(List1, { name = value.name, order = value.order })
	end
	return List1
end