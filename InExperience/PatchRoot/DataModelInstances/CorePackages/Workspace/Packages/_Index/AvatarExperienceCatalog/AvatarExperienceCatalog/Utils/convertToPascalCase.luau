local function _(p0) --[[ line: 1 | named "toPascalCase" ]]
	return if type(p0) == "string" then p0:gsub("^%l", string.upper) else tostring(p0)
end

local function convertToPascalCase(p1) --[[ line: 10 ]]
	-- upvalues: convertToPascalCase (ref)
	local t = {}
	
	for i, v in p1 do
		if type(i) == "string" then
			local var2 = if type(i) ~= "string" then i:gsub("^%l", string.upper) else tostring(i)
			
			if type(v) == "table" then
				t[var2] = convertToPascalCase(v)
			else
				t[var2] = v
			end
		else
			t[i] = v
		end
	end
	return t
end

return convertToPascalCase