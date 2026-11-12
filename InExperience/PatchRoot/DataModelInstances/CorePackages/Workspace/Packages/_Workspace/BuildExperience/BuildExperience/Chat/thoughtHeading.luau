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
	end
}