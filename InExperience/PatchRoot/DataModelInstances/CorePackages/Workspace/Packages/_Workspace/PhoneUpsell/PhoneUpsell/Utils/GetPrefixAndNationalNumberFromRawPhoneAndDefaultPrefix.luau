return function(p0, p1)
	local var0 = p0:gsub("%D", "")
	local var1 = p1:gsub("%D", "")
	
	if string.find(var0, var1) == 1 then
		return p1, string.sub(var0, string.len(var1) + 1)
	end
	return p1, var0
end