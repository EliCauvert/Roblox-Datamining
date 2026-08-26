return function(p1, p2)
	if p2 < 1 then
		local charCount = utf8.len(p1)
		local text = p1 .. "\n"
		
		if charCount then
			return text, charCount + 1
		end
		return text, 1
	else
		local byteOffset = utf8.offset(p1, p2)
		
		if byteOffset ~= nil then
			return string.sub(p1, 1, byteOffset - 1) .. "\n" .. string.sub(p1, byteOffset), p2 + 1
		end
		local charCount = utf8.len(p1)
		local text = p1 .. "\n"
		
		if charCount then
			return text, charCount + 1
		end
		return text, 1
	end
end