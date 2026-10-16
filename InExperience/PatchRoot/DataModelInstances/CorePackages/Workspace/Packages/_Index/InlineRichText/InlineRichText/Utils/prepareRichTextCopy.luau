local FFlagInlineRichTextSkipPlaintextEscape = require(script:FindFirstAncestor("InlineRichText").Parent.SharedFlags).FFlagInlineRichTextSkipPlaintextEscape
local Character = utf8.char(8220)
local Character1 = utf8.char(8221)
local Character2 = utf8.char(8217)

local function decodeQuoteEntities(Text: string) --[[ Line: 24 ]]
	return Text:gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&#34;", "\""):gsub("&#39;", "'")
end

local function toTypographicQuotesOutsideTags(Text: string): string --[[ Line: 31 ]]
	-- upvalues: Character (copy), Character1 (copy), Character2 (copy)
	local List = {}
	local Flag = false
	local v1 = true
	
	for i = 1, #Text do
		local Segment = Text:sub(i, i)
		
		if Segment == "<" then
			Flag = true
			table.insert(List, Segment)
		elseif Segment == ">" then
			Flag = false
			table.insert(List, Segment)
		elseif Flag then
			table.insert(List, Segment)
		elseif Segment == "\"" then
			table.insert(List, if v1 then Character else Character1)
			v1 = not v1
		elseif Segment == "'" then
			table.insert(List, Character2)
		else
			table.insert(List, Segment)
		end
	end
	return table.concat(List)
end

return function(p1) --[[ Line: 60 | Named "prepareRichTextCopy" ]]
	-- upvalues: decodeQuoteEntities (copy), FFlagInlineRichTextSkipPlaintextEscape (copy), toTypographicQuotesOutsideTags (copy)
	local DecodeQuoteEntitiesResult = decodeQuoteEntities(p1)
	
	return if FFlagInlineRichTextSkipPlaintextEscape then DecodeQuoteEntitiesResult else toTypographicQuotesOutsideTags(DecodeQuoteEntitiesResult)
end