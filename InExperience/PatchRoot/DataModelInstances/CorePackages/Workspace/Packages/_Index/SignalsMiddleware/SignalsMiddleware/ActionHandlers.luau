return {
	create = function()
		return {}
	end,
	register = function(p1, p2, p3)
		if not p1[p2] then
			p1[p2] = {}
		end
		table.insert(p1[p2], p3)
	end
}