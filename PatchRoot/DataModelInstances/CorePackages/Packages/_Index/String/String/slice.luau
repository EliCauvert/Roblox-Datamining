-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 16 | named "slice" ]]
	local charCount, charCount_1 = utf8.len(p0)
	assert(charCount ~= nil, ("string `%s` has an invalid byte at position %s"):format(p0, tostring(charCount_1)))
	local var2 = tonumber(p1)
	assert(typeof(var2) == "number", "startIndexStr should be a number")
	
	if var2 + charCount < 0 then
		var2 = 1
	end
	if charCount < var2 then
		return ""
	end
	local var3 = if p2 ~= nil then tonumber(p2) or -9223372036854775808 else charCount + 1
	assert(typeof(var3) == "number", "lastIndexStr should convert to number")
	
	if charCount < var3 then
		var3 = charCount + 1
	end
	return string.sub(p0, utf8.offset(p0, var2), utf8.offset(p0, var3) - 1)
end