local Replacement = {
	["&"] = "&amp;",
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

local function _(Text: string): string
	-- upvalues: Replacement (copy)
	return (string.gsub(Text, "[&<>\"']", Replacement))
end

local function findMatchStart(Text: string, Pattern): number
	local FoundAt: number? = string.find(Text, Pattern, 1, true)
	local FoundAt1: number? = FoundAt
	while FoundAt1 ~= nil do
		if FoundAt1 == 1 or string.match(string.sub(Text, FoundAt1 - 1, FoundAt1 - 1), "%w") == nil then
			return FoundAt1
		end
		FoundAt1 = string.find(Text, Pattern, FoundAt1 + 1, true)
	end
	return FoundAt
end

return function(Text: string, Text1: string, p1): string
	-- upvalues: Replacement (copy), findMatchStart (copy)
	if Text1 == nil or Text1 == "" then
		return (string.gsub(Text, "[&<>\"']", Replacement))
	end
	local MatchStart: number = findMatchStart(string.lower(Text), string.lower(Text1))
	
	if MatchStart == nil then
		return (string.gsub(Text, "[&<>\"']", Replacement))
	else
		local EndIndex = MatchStart + #Text1 - 1
		local ColorName: string = `<font color="#{p0:ToHex()}">`
		
		local function _(Text: string): string
			-- upvalues: ColorName (copy), Replacement (upval)
			return if Text == "" then "" else `{ColorName}{string.gsub(Text, "[&<>\"']", Replacement)}</font>`
		end
		
		local Segment = string.sub(Text, 1, MatchStart - 1)
		local FontName: string = if Segment == "" then "" else `{ColorName}{string.gsub(Segment, "[&<>\"']", Replacement)}</font>`
		local Segment1 = string.sub(Text, EndIndex + 1)
		
		return FontName .. `<b>{string.gsub(string.sub(Text, MatchStart, EndIndex), "[&<>\"']", Replacement)}</b>` .. (if Segment1 == "" then "" else `{ColorName}{string.gsub(Segment1, "[&<>\"']", Replacement)}</font>`)
	end
end