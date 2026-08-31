local function _(p1)
	return if type(p1) == "string" then p1:gsub("^%l", string.upper) else tostring(p1)
end

local function convertToPascalCase(p1)
	-- upvalues: convertToPascalCase (ref)
	local t = {}
	
	for i, v in p1 do
		if type(i) == "string" then
			local var1 = if type(i) ~= "string" then i:gsub("^%l", string.upper) else tostring(i)
			
			if type(v) == "table" then
				t[var1] = convertToPascalCase(v)
			else
				t[var1] = v
			end
		else
			t[i] = v
		end
	end
	return t
end

return convertToPascalCase