return {
	create = function()
		return {}
	end,
	register = function(p1, Key, p2)
		if not p1[Key] then
			p1[Key] = {}
		end
		table.insert(p1[Key], p2)
	end
}