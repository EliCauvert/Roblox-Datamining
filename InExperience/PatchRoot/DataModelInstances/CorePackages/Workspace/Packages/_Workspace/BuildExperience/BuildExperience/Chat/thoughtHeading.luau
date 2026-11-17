local list = {
	{ 192, 591 },
	{ 880, 1023 },
	{ 1024, 1327 },
	{ 1424, 1535 },
	{ 1536, 1791 },
	{ 3584, 3711 },
	{ 12352, 12543 },
	{ 13312, 19903 },
	{ 19968, 40959 },
	{ 44032, 55215 }
}

local function isWordCodepoint(Codepoint: number): boolean
	-- upvalues: list (copy)
	if Codepoint < 128 then
		return string.find(string.char(Codepoint), "[%w_]") ~= nil
	end
	if Codepoint == 215 or Codepoint == 247 then
		return false
	end
	for _, value in list do
		if value[1] <= Codepoint and Codepoint <= value[2] then
			return true
		end
	end
	return false
end

local function isWordBefore(Text: string, EndIndex: number, HasLength)
	-- upvalues: isWordCodepoint (copy)
	if EndIndex <= 1 then
		return false
	elseif HasLength then
		local OffsetResult = utf8.offset(Text, -1, EndIndex)
		
		return OffsetResult ~= nil and isWordCodepoint(utf8.codepoint(Text, OffsetResult))
	else
		return string.find(string.sub(Text, EndIndex - 1, EndIndex - 1), "[%w_]") ~= nil
	end
end

local function _(Text: string, Index: number, p1)
	-- upvalues: isWordCodepoint (copy)
	return #Text >= Index and (if p1 then isWordCodepoint(utf8.codepoint(Text, Index)) else string.find(string.sub(Text, Index, Index), "[%w_]") ~= nil)
end

local function stripEmphasis(Text: string, p1): string
	-- upvalues: isWordBefore (copy), isWordCodepoint (copy)
	local HasLength = utf8.len(Text) ~= nil
	local Text1: string = `{p1}+([^{p1}%s][^{p1}]-){p1}+`
	local List = {}
	local StartIndex = 1
	while true do
		local StartIndex1, EndIndex, FoundAt3 = string.find(Text, Text1, StartIndex)
		if StartIndex1 == nil or (EndIndex == nil or FoundAt3 == nil) then break end
		local IsWordBefore = isWordBefore(Text, StartIndex1, HasLength)
		
		if not IsWordBefore then
			local Index = EndIndex + 1
			IsWordBefore = Index <= #Text and (if HasLength then isWordCodepoint(utf8.codepoint(Text, Index)) else string.find(string.sub(Text, Index, Index), "[%w_]") ~= nil)
		end
		if IsWordBefore then
			table.insert(List, (string.sub(Text, StartIndex, StartIndex1)))
			StartIndex = StartIndex1 + 1
		else
			table.insert(List, (string.sub(Text, StartIndex, StartIndex1 - 1)))
			table.insert(List, FoundAt3)
			StartIndex = EndIndex + 1
		end
	end
	table.insert(List, (string.sub(Text, StartIndex)))
	
	return table.concat(List)
end

local function cleanThoughtBody(Text: string): string
	-- upvalues: stripEmphasis (copy)
	local List = {}
	
	return (string.match(string.gsub(string.gsub(string.gsub(stripEmphasis(stripEmphasis(string.gsub(string.gsub(string.gsub(Text, "\r\n", "\n"), "`([^`]+)`", function(Match): string
		-- upvalues: List (copy)
		table.insert(List, Match)
		
		return `\1{#List}\2`
	end), "%*%*", ""), "_"), "%*"), "\1(%d+)\2", function(Match)
		-- upvalues: List (copy)
		return List[tonumber(Match)]
	end), "`", ""), "\n\n\n+", "\n\n"), "^%s*(.-)%s*$"))
end

return {
	getThoughtHeading = function(Text: string)
		if typeof(Text) ~= "string" then
			return nil
		end
		local Match: string? = string.match(Text, "^%s*%*%*([^\r\n]-)%*%*")
		
		if Match == nil then
			return nil
		else
			local Match1: string? = string.match(Match, "^%s*(.-)%s*$")
			
			return if Match1 == "" then nil else string.sub(Match1, 1, (utf8.offset(Match1, 81) or #Match1 + 1) - 1)
		end
	end,
	splitThought = function(Text: string)
		-- upvalues: cleanThoughtBody (copy)
		local Match, Match2 = string.match(Text, "^%s*%*%*([^\r\n]-)%*%*(.*)$")
		local CleanThoughtBodyResult = if Match == nil then "" else cleanThoughtBody(Match)
		
		return if Match2 == nil or CleanThoughtBodyResult == "" then { title = nil, body = cleanThoughtBody(Text) } else {
			title = CleanThoughtBodyResult,
			body = cleanThoughtBody(Match2)
		}
	end
}