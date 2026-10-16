return function(Text: string): string --[[ Line: 7 | Named "decodeLuauUnicodeEscapes" ]]
	return (Text:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 9 ]]
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end))
end