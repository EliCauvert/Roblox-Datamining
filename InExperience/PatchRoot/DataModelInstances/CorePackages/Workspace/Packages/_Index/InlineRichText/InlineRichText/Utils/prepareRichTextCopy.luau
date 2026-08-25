local char = utf8.char(8220)
local char_1 = utf8.char(8221)
local char_2 = utf8.char(8217)

local function decodeQuoteEntities(p0)
	return p0:gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&#34;", "\""):gsub("&#39;", "'")
end

local function toTypographicQuotesOutsideTags(p1)
	-- upvalues: char (ref), char_1 (ref), char_2 (ref)
	local var8
	local t = {}
	local var6 = false
	local var7 = true
	
	for i = 1, #p1 do
		var8 = p1:sub(i, i)
		
		if var8 == "<" then
			var6 = true
			table.insert(t, var8)
			continue
		end
		if var8 == ">" then
			var6 = false
			table.insert(t, var8)
		elseif var6 then
			table.insert(t, var8)
		elseif var8 == "\"" then
			table.insert(t, if var7 then char else char_1)
			var7 = not var7
		elseif var8 == "'" then
			table.insert(t, char_2)
		else
			table.insert(t, var8)
		end
	end
	return table.concat(t)
end

return function(p2)
	-- upvalues: toTypographicQuotesOutsideTags (ref), decodeQuoteEntities (ref)
	return toTypographicQuotesOutsideTags(decodeQuoteEntities(p2))
end