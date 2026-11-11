local function prettyPrint(List, p1): string
	-- upvalues: prettyPrint (copy)
	local P1 = p1 or 0
	local List1 = {}
	
	if typeof(List) == "table" then
		table.insert(List1, "{\n")
		
		for i, value in pairs(List) do
			table.insert(List1, ("    "):rep(P1 + 1))
			table.insert(List1, (tostring(i)))
			table.insert(List1, " = ")
			table.insert(List1, prettyPrint(value, P1 + 1))
			table.insert(List1, "\n")
		end
		table.insert(List1, ("    "):rep(P1))
		table.insert(List1, "}")
	elseif typeof(List) == "string" then
		table.insert(List1, string.format("%q", List))
		table.insert(List1, " (string)")
	else
		table.insert(List1, (tostring(List)))
		table.insert(List1, " (")
		table.insert(List1, (typeof(List)))
		table.insert(List1, ")")
	end
	return table.concat(List1, "")
end

return prettyPrint