local function serializeTable(p1, p2, p3, p4)
	-- upvalues: serializeTable (ref)
	p3 = p3 or false
	p4 = p4 or 0
	local repeated = string.rep(" ", p4)
	
	if p2 then
		repeated ..= p2 .. " = "
	end
	if type(p1) == "table" then
		repeated ..= "{" .. if not p3 then "\n" else ""
		
		for i, v in pairs(p1) do
			repeated ..= serializeTable(v, i, p3, p4 + 1) .. "," .. if not p3 then "\n" else ""
		end
		repeated ..= string.rep(" ", p4) .. "}"
		
		return repeated
	elseif type(p1) == "number" then
		repeated ..= tostring(p1)
		
		return repeated
	elseif type(p1) == "string" then
		repeated ..= string.format("%q", p1)
		
		return repeated
	elseif type(p1) == "boolean" then
		repeated ..= if p1 then "true" else "false"
		
		return repeated
	end
	return repeated .. "\"[inserializeable datatype:" .. type(p1) .. "]\""
end

return serializeTable