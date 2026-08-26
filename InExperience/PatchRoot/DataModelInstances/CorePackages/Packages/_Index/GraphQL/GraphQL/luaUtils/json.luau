local t = {}

local function kind_of(p1)
	if type(p1) ~= "table" then
		return type(p1)
	end
	local var1 = 1
	
	for i in pairs(p1) do
		if p1[var1] ~= nil then
			return "table"
		end
		var1 += 1
	end
	return if var1 == 1 then "table" else "array"
end

local function escape_str(p2)
	local list = {
		"\\", "\"", "/", "b", "f", "n", "r", "t"
	}
	
	for i, v in ipairs({
		"\\", "\"", "/", "\b", "\f", "\n", "\r", "\t"
	}) do
		p2 = p2:gsub(v, "\\" .. list[i])
	end
	return p2
end

function t.stringify(p3, p4)
	-- upvalues: kind_of (ref), t (ref), escape_str (ref)
	local t_1 = {}
	local var2 = kind_of(p3)
	
	if var2 == "array" then
		if p4 then
			error("Can't encode array as key.")
		end
		t_1[#t_1 + 1] = "["
		
		for i, v in ipairs(p3) do
			if i > 1 then
				t_1[#t_1 + 1] = ", "
			end
			t_1[#t_1 + 1] = t.stringify(v)
		end
		t_1[#t_1 + 1] = "]"
	elseif var2 == "table" then
		if p4 then
			error("Can't encode table as key.")
		end
		t_1[#t_1 + 1] = "{"
		
		for i, v in pairs(p3) do
			if #t_1 > 1 then
				t_1[#t_1 + 1] = ", "
			end
			t_1[#t_1 + 1] = t.stringify(i, true)
			t_1[#t_1 + 1] = ":"
			t_1[#t_1 + 1] = t.stringify(v)
		end
		t_1[#t_1 + 1] = "}"
	elseif var2 == "string" then
		return "\"" .. escape_str(p3) .. "\""
	elseif var2 == "number" then
		return if p4 then "\"" .. tostring(p3) .. "\"" else tostring(p3)
	elseif var2 == "boolean" then
		return tostring(p3)
	elseif var2 == "nil" then
		return "null"
	end
	error("Unjsonifiable type: " .. var6 .. ".")
	return table.concat(t_1)
end

return t