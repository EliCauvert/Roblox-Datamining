local function prettyPrint(p1, p2)
	-- upvalues: prettyPrint (ref)
	p2 = p2 or 0
	local t = {}
	
	if typeof(p1) == "table" then
		table.insert(t, "{\n")
		
		for i, v in pairs(p1) do
			table.insert(t, ("    "):rep(p2 + 1))
			table.insert(t, tostring(i))
			table.insert(t, " = ")
			table.insert(t, prettyPrint(v, p2 + 1))
			table.insert(t, "\n")
		end
		table.insert(t, ("    "):rep(p2))
		table.insert(t, "}")
	elseif typeof(p1) == "string" then
		table.insert(t, string.format("%q", p1))
		table.insert(t, " (string)")
	else
		table.insert(t, tostring(p1))
		table.insert(t, " (")
		table.insert(t, typeof(p1))
		table.insert(t, ")")
	end
	return table.concat(t, "")
end

return prettyPrint