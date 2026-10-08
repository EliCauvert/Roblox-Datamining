return function(p1, p2)
	local var1 = utf8.len(p1) or #p1
	local var2 = if p2 >= 1 and p2 <= var1 + 1 then p2 else var1 + 1
	local var3 = (if var2 > 1 then utf8.offset(p1, var2) else 1) or #p1 + 1
	
	return string.sub(p1, 1, var3 - 1) .. "\n" .. string.sub(p1, var3), var2 + 1
end