local function serializeTable(p0, p1, p2, p3) --[[ line: 3 ]]
	-- upvalues: serializeTable (ref)
	p2 = p2 or false
	p3 = p3 or 0
	local repeated = string.rep(" ", p3)
	
	if p1 then
		repeated ..= p1 .. " = "
	end
	if type(p0) == "table" then
		repeated ..= "{" .. if not p2 then "\n" else ""
		
		for i, v in pairs(p0) do
			repeated ..= serializeTable(v, i, p2, p3 + 1) .. "," .. if not p2 then "\n" else ""
		end
		repeated ..= string.rep(" ", p3) .. "}"
		
		return repeated
	elseif type(p0) == "number" then
		repeated ..= tostring(p0)
		
		return repeated
	elseif type(p0) == "string" then
		repeated ..= string.format("%q", p0)
		
		return repeated
	elseif type(p0) == "boolean" then
		repeated ..= if p0 then "true" else "false"
		
		return repeated
	end
	return repeated .. "\"[inserializeable datatype:" .. type(p0) .. "]\""
end

return serializeTable