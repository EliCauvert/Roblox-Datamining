return function(p0, p1) --[[ line: 3 | named "insertNewlineAtCursor" ]]
	if p1 < 1 then
		local charCount = utf8.len(p0)
		local text = p0 .. "\n"
		
		if charCount then
			return text, charCount + 1
		end
		return text, 1
	else
		local byteOffset = utf8.offset(p0, p1)
		
		if byteOffset ~= nil then
			return string.sub(p0, 1, byteOffset - 1) .. "\n" .. string.sub(p0, byteOffset), p1 + 1
		end
		local charCount = utf8.len(p0)
		local text = p0 .. "\n"
		
		if charCount then
			return text, charCount + 1
		end
		return text, 1
	end
end