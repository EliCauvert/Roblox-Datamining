local t = {
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = true,
	[133] = true,
	[8232] = true,
	[8233] = true
}
local t_1 = {
	[9] = true,
	[32] = true,
	[160] = true,
	[5760] = true,
	[8192] = true,
	[8193] = true,
	[8194] = true,
	[8195] = true,
	[8196] = true,
	[8197] = true,
	[8198] = true,
	[8199] = true,
	[8200] = true,
	[8201] = true,
	[8202] = true,
	[8239] = true,
	[8287] = true,
	[12288] = true
}
local t_2 = {
	[6158] = true,
	[8203] = true,
	[8288] = true,
	[65279] = true
}

local function normalizeAsciiWhitespace(p1)
	return string.gsub(string.gsub(string.gsub(p1, "%s+", function(p2)
		return if string.find(p2, "[\n\11\f\r]") then "\n" else " "
	end), "^[ \n]", ""), "[ \n]$", "")
end

return function(p1)
	-- upvalues: normalizeAsciiWhitespace (ref), t (ref), t_1 (ref), t_2 (ref)
	if utf8.len(p1) == nil then
		return normalizeAsciiWhitespace(p1)
	end
	local t_3 = {}
	local var1 = nil
	local var2 = nil
	
	for i, v in utf8.codes(p1) do
		local var3 = t[v] == true
		local var4 = t_1[v] == true
		
		if not var3 and not var4 and t_2[v] ~= true then
			if var1 == nil then
				if var2 ~= nil and #t_3 > 0 then
					table.insert(t_3, var2)
				end
				var2 = nil
				var1 = i
			end
		end
		if var1 ~= nil then
			table.insert(t_3, string.sub(p1, var1, i - 1))
			var1 = nil
		end
		if var3 then
			var2 = "\n"
		elseif var4 and var2 ~= "\n" then
			var2 = " "
		elseif var2 == nil then
			var2 = ""
		end
	end
	if var1 ~= nil then
		table.insert(t_3, string.sub(p1, var1))
	end
	return table.concat(t_3)
end