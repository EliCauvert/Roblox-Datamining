local _ = require(script.Parent.Parent.Parent.LeaderboardStore)

return function(p1, p2)
	if not p1 then
		return {}
	end
	local t = {}
	p1.iterateData(function(p3, p4)
		-- upvalues: t (ref)
		table.insert(t, { name = p3, order = p4.order(false) })
	end, false)
	table.sort(t, function(p3, p4)
		return p3.order < p4.order
	end)
	local t_1 = {}
	
	for i, v in ipairs(t) do
		if p2 < i then break end
		table.insert(t_1, { name = v.name, order = v.order })
	end
	return t_1
end