return function(p1, p2, p3)
	local charCount, charCount_1 = utf8.len(p1)
	assert(charCount ~= nil, ("string `%s` has an invalid byte at position %s"):format(p1, tostring(charCount_1)))
	local var1 = tonumber(p2)
	assert(typeof(var1) == "number", "startIndexStr should be a number")
	
	if var1 + charCount < 0 then
		var1 = 1
	end
	if charCount < var1 then
		return ""
	end
	local var2 = if p3 ~= nil then tonumber(p3) or -9223372036854775808 else charCount + 1
	assert(typeof(var2) == "number", "lastIndexStr should convert to number")
	
	if charCount < var2 then
		var2 = charCount + 1
	end
	return string.sub(p1, utf8.offset(p1, var1), utf8.offset(p1, var2) - 1)
end