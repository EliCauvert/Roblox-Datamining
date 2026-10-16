local function serializeTable(List, Text, p1, p2): string --[[ Line: 3 ]]
	-- upvalues: serializeTable (copy)
	local P2 = p1 or false
	local Count = p2 or 0
	local Repeated = string.rep(" ", Count)
	
	if Text then
		Repeated ..= Text .. " = "
	end
	if type(List) == "table" then
		local Text1 = Repeated .. "{" .. (if P2 then "" else "\n")
		
		for i, value in pairs(List) do
			Text1 ..= serializeTable(value, i, P2, Count + 1) .. "," .. if P2 then "" else "\n"
		end
		Repeated = Text1 .. string.rep(" ", Count) .. "}"
		
		return Repeated
	elseif type(List) == "number" then
		Repeated ..= tostring(List)
		
		return Repeated
	elseif type(List) == "string" then
		Repeated ..= string.format("%q", List)
		
		return Repeated
	elseif type(List) == "boolean" then
		Repeated ..= if List then "true" else "false"
		
		return Repeated
	else
		return Repeated .. "\"[inserializeable datatype:" .. type(List) .. "]\""
	end
end

return serializeTable