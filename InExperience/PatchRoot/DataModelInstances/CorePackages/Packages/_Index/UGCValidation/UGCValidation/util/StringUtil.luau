return {
	keysToString = function(p1, p2, p3)
		local t = {}
		
		for i in p1 do
			table.insert(t, tostring(i))
		end
		if p3 then
			table.sort(t)
		end
		return table.concat(t, p2)
	end
}