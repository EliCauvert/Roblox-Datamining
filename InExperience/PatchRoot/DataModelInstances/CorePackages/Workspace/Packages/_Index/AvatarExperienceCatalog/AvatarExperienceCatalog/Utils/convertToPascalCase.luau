local function _(Text: string): string --[[ Line: 1 | Named "toPascalCase" ]]
	return if type(Text) == "string" then Text:gsub("^%l", string.upper) else tostring(Text)
end

local function convertToPascalCase(List) --[[ Line: 10 ]]
	-- upvalues: convertToPascalCase (copy)
	local t = {}
	
	for Text, value in List do
		if type(Text) ~= "string" then
			t[Text] = value
			continue
		end
		local L = if type(Text) == "string" then Text:gsub("^%l", string.upper) else tostring(Text)
		
		if type(value) == "table" then
			t[L] = convertToPascalCase(value)
		else
			t[L] = value
		end
	end
	return t
end

return convertToPascalCase