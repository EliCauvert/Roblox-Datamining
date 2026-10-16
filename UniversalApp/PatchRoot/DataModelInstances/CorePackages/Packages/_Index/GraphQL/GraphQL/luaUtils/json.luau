local JsonModule = {}

local function kind_of(List): string --[[ Line: 5 ]]
	if type(List) ~= "table" then
		return (type(List))
	end
	local Count = 1
	
	for _ in pairs(List) do
		if List[Count] == nil then
			return "table"
		end
		Count += 1
	end
	return if Count == 1 then "table" else "array"
end

local function escape_str(Text: string): string --[[ Line: 24 ]]
	local list = {
		"\\", "\"", "/", "b", "f", "n", "r", "t"
	}
	
	for i, value in ipairs({
		"\\", "\"", "/", "\b", "\f", "\n", "\r", "\t"
	}) do
		Text = Text:gsub(value, "\\" .. list[i])
	end
	return Text
end

function JsonModule.stringify(List, p1): string --[[ Line: 33 ]]
	-- upvalues: kind_of (copy), JsonModule (copy), escape_str (copy)
	local StringifyResults = {}
	local Kind_ofResult = kind_of(List)
	
	if Kind_ofResult == "array" then
		if p1 then
			error("Can't encode array as key.")
		end
		StringifyResults[#StringifyResults + 1] = "["
		
		for i, value in ipairs(List) do
			if i > 1 then
				StringifyResults[#StringifyResults + 1] = ", "
			end
			StringifyResults[#StringifyResults + 1] = JsonModule.stringify(value)
		end
		StringifyResults[#StringifyResults + 1] = "]"
	elseif Kind_ofResult == "table" then
		if p1 then
			error("Can't encode table as key.")
		end
		StringifyResults[#StringifyResults + 1] = "{"
		
		for i1, value1 in pairs(List) do
			if #StringifyResults > 1 then
				StringifyResults[#StringifyResults + 1] = ", "
			end
			StringifyResults[#StringifyResults + 1] = JsonModule.stringify(i1, true)
			StringifyResults[#StringifyResults + 1] = ":"
			StringifyResults[#StringifyResults + 1] = JsonModule.stringify(value1)
		end
		StringifyResults[#StringifyResults + 1] = "}"
	else
		if Kind_ofResult == "string" then
			return "\"" .. escape_str(List) .. "\""
		end
		if Kind_ofResult == "number" then
			return if p1 then "\"" .. tostring(List) .. "\"" else tostring(List)
		end
		if Kind_ofResult == "boolean" then
			return (tostring(List))
		end
		if Kind_ofResult == "nil" then
			return "null"
		end
		error("Unjsonifiable type: " .. Kind_ofResult .. ".")
	end
	return table.concat(StringifyResults)
end

return JsonModule