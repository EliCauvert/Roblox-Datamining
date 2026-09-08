local fFlagInlineRichTextSkipPlaintextEscape = require(script:FindFirstAncestor("InlineRichText").Parent.SharedFlags).FFlagInlineRichTextSkipPlaintextEscape
local char = utf8.char(8220)
local char_1 = utf8.char(8221)
local char_2 = utf8.char(8217)

local function decodeQuoteEntities(p1)
	return p1:gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&#34;", "\""):gsub("&#39;", "'")
end

local function toTypographicQuotesOutsideTags(p1)
	-- upvalues: char (ref), char_1 (ref), char_2 (ref)
	local var1
	local t = {}
	local var2 = false
	local var3 = true
	
	for i = 1, #p1 do
		var1 = p1:sub(i, i)
		
		if var1 == "<" then
			var2 = true
			table.insert(t, var1)
			continue
		end
		if var1 == ">" then
			var2 = false
			table.insert(t, var1)
		elseif var2 then
			table.insert(t, var1)
		elseif var1 == "\"" then
			table.insert(t, if var3 then char else char_1)
			var3 = not var3
		elseif var1 == "'" then
			table.insert(t, char_2)
		else
			table.insert(t, var1)
		end
	end
	return table.concat(t)
end

return function(p2)
	-- upvalues: decodeQuoteEntities (ref), fFlagInlineRichTextSkipPlaintextEscape (ref), toTypographicQuotesOutsideTags (ref)
	local var4 = decodeQuoteEntities(p2)
	
	return if fFlagInlineRichTextSkipPlaintextEscape then var4 else toTypographicQuotesOutsideTags(var4)
end