return {
	create = function() --[[ line: 6 ]]
		return {}
	end,
	register = function(p0, p1, p2) --[[ line: 11 ]]
		if not p0[p1] then
			p0[p1] = {}
		end
		table.insert(p0[p1], p2)
	end
}