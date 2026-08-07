return function(p0) --[[ line: 7 | named "decodeLuauUnicodeEscapes" ]]
	return p0:gsub("\\u{(%x+)}", function(p1) --[[ line: 9 ]]
		local var0 = tonumber(p1, 16)
		
		return if var0 == nil or var0 < 0 or var0 > 1114111 then "" else utf8.char(var0)
	end)
end