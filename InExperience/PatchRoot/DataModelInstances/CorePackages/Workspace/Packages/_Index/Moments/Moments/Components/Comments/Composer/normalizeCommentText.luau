local config = {
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = true,
	[133] = true,
	[8232] = true,
	[8233] = true
}
local config1 = {
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
local config2 = {
	[6158] = true,
	[8203] = true,
	[8288] = true,
	[65279] = true
}

local function normalizeAsciiWhitespace(Text: string): string --[[ Line: 48 ]]
	return (string.gsub(string.gsub(string.gsub(Text, "%s+", function(Text: string): string --[[ Line: 49 ]]
		return if string.find(Text, "[\n\11\f\r]") then "\n" else " "
	end), "^[ \n]", ""), "[ \n]$", ""))
end

return function(Text: string) --[[ Line: 57 | Named "normalizeCommentText" ]]
	-- upvalues: normalizeAsciiWhitespace (copy), config (copy), config1 (copy), config2 (copy)
	if utf8.len(Text) == nil then
		return (normalizeAsciiWhitespace(Text))
	end
	local List = {}
	local StartIndex: number? = nil
	local v1: string? = nil
	
	for i, value in utf8.codes(Text) do
		local IsEntry = config[value] == true
		local IsEntry1 = config1[value] == true
		
		if not IsEntry and not IsEntry1 and config2[value] ~= true then
			if StartIndex == nil then
				if v1 ~= nil and #List > 0 then
					table.insert(List, v1)
				end
				v1 = nil
				StartIndex = i
			end
			continue
		end
		if StartIndex ~= nil then
			table.insert(List, (string.sub(Text, StartIndex, i - 1)))
			StartIndex = nil
		end
		if IsEntry then
			v1 = "\n"
		elseif IsEntry1 and v1 ~= "\n" then
			v1 = " "
		elseif v1 == nil then
			v1 = ""
		end
	end
	if StartIndex ~= nil then
		table.insert(List, (string.sub(Text, StartIndex)))
	end
	return table.concat(List)
end