local _ = require(script.Parent.Parent.Parent.LeaderboardStore)

return function(p0, p1) --[[ line: 19 | named "computeStatColumns" ]]
	if not p0 then
		return {}
	end
	local t = {}
	p0.iterateData(function(p2, p3) --[[ line: 25 ]]
		-- upvalues: t (ref)
		table.insert(t, { name = p2, order = p3.order(false) })
	end, false)
	table.sort(t, function(p4, p5) --[[ line: 29 ]]
		return p4.order < p5.order
	end)
	local t_1 = {}
	
	for i, v in ipairs(t) do
		if p1 < i then break end
		table.insert(t_1, { name = v.name, order = v.order })
	end
	return t_1
end