return function(p1, p2)
	local t = {}
	
	for i, v in p1 do
		local var1 = if p2 then p2[v] else nil
		
		if var1 == 0 then
			table.insert(t, `{v} (must be empty)`)
		elseif var1 == nil then
			table.insert(t, v)
		else
			table.insert(t, `{v} (limit {var1} bytes)`)
		end
	end
	return table.concat(t, ", ")
end