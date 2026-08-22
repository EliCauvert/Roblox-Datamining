return function(p0, p1) --[[ line: 4 | named "describeProblematicProperties" ]]
	local t = {}
	
	for i, v in p0 do
		local var1 = if p1 then p1[v] else nil
		
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