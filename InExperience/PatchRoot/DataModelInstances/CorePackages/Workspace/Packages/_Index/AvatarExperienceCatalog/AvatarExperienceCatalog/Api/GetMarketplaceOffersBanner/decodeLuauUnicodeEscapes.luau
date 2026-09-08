return function(p1)
	return p1:gsub("\\u{(%x+)}", function(p2)
		local var1 = tonumber(p2, 16)
		
		return if var1 == nil or var1 < 0 or var1 > 1114111 then "" else utf8.char(var1)
	end)
end