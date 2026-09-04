return {
	formatDescription = function(p1)
		local t = {}
		
		for i, v in p1 do
			if v.username ~= nil and v.username ~= "" then
				table.insert(t, `@{v.username}`)
			end
		end
		return table.concat(t, ", ")
	end,
	formatTitle = function(p2)
		local list = table.create(#p2)
		
		for i, v in p2 do
			list[i] = v.displayName
		end
		return table.concat(list, ", ")
	end
}