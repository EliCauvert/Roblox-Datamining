return {
	create = function()
		return {}
	end,
	register = function(p0, p1, p2)
		if not p0[p1] then
			p0[p1] = {}
		end
		table.insert(p0[p1], p2)
	end
}