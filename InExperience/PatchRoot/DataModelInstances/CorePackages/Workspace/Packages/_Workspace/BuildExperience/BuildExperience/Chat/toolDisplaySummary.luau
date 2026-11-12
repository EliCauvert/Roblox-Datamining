local config = { execute_luau = true, verify_luau = true }

local function _(Text: string)
	if typeof(Text) == "string" then
		local Match: string? = string.match(Text, "^%s*(.-)%s*$")
		
		return if Match == "" then nil else string.sub(Match, 1, (utf8.offset(Match, 121) or #Match + 1) - 1)
	else
		return nil
	end
end

local function getLeadingComment(Text: string)
	if typeof(Text) ~= "string" then
		return nil
	end
	local Match = nil
	for i in string.gmatch(Text, "[^\r\n]+") do
		Match = string.match(i, "^%s*(.-)%s*$")
		
		if Match ~= "" and string.sub(Match, 1, 3) ~= "--!" then
			if string.sub(Match, 1, 2) ~= "--" or string.match(Match, "^%-%-%[=*%[") ~= nil then
				return nil
			end
			local Match1: string? = string.match(Match, "^%-%-+%s*(.*)$")
			
			if typeof(Match1) == "string" then
				local Match2: string? = string.match(Match1, "^%s*(.-)%s*$")
				
				return if Match2 == "" then nil else string.sub(Match2, 1, (utf8.offset(Match2, 121) or #Match2 + 1) - 1)
			else
				return nil
			end
		end
	end
	return nil
end

return {
	getToolDisplaySummary = function(p1, p2)
		-- upvalues: config (copy), getLeadingComment (copy)
		if typeof(p2) ~= "table" then
			return nil
		end
		local DisplaySummary: string = p2._display_summary
		local Segment = nil
		
		if typeof(DisplaySummary) == "string" then
			local Match: string? = string.match(DisplaySummary, "^%s*(.-)%s*$")
			Segment = if Match == "" then nil else string.sub(Match, 1, (utf8.offset(Match, 121) or #Match + 1) - 1)
		else
			Segment = nil
		end
		return if Segment == nil then if p1 == nil or not config[p1] then nil else getLeadingComment(p2.code) else Segment
	end
}