local t = {}

local function kind_of(p0)
	if type(p0) ~= "table" then
		return type(p0)
	end
	local var3 = 1
	
	for i in pairs(p0) do
		if p0[var3] ~= nil then
			return "table"
		end
		var3 += 1
	end
	return if var3 == 1 then "table" else "array"
end

local function escape_str(p1)
	local list = {
		"\\", "\"", "/", "b", "f", "n", "r", "t"
	}
	
	for i, v in ipairs({
		"\\", "\"", "/", "\b", "\f", "\n", "\r", "\t"
	}) do
		p1 = p1:gsub(v, "\\" .. list[i])
	end
	return p1
end

function t.stringify(p2, p3)
	-- upvalues: kind_of (ref), t (ref), escape_str (ref)
	local t_1 = {}
	local var6 = kind_of(p2)
	
	if var6 == "array" then
		if p3 then
			error("Can't encode array as key.")
		end
		t_1[#t_1 + 1] = "["
		
		for i, v in ipairs(p2) do
			if i > 1 then
				t_1[#t_1 + 1] = ", "
			end
			t_1[#t_1 + 1] = t.stringify(v)
		end
		t_1[#t_1 + 1] = "]"
	elseif var6 == "table" then
		if p3 then
			error("Can't encode table as key.")
		end
		t_1[#t_1 + 1] = "{"
		
		for i, v in pairs(p2) do
			if #t_1 > 1 then
				t_1[#t_1 + 1] = ", "
			end
			t_1[#t_1 + 1] = t.stringify(i, true)
			t_1[#t_1 + 1] = ":"
			t_1[#t_1 + 1] = t.stringify(v)
		end
		t_1[#t_1 + 1] = "}"
	elseif var6 == "string" then
		return "\"" .. escape_str(p2) .. "\""
	elseif var6 == "number" then
		return if p3 then "\"" .. tostring(p2) .. "\"" else tostring(p2)
	elseif var6 == "boolean" then
		return tostring(p2)
	elseif var6 == "nil" then
		return "null"
	end
	error("Unjsonifiable type: " .. var6 .. ".")
	return table.concat(t_1)
end

return t