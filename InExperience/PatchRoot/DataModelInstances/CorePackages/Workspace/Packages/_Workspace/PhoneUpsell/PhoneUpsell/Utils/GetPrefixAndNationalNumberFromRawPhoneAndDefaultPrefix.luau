return function(p1, p2)
	local var1 = p1:gsub("%D", "")
	local var2 = p2:gsub("%D", "")
	
	if string.find(var1, var2) == 1 then
		return p2, string.sub(var1, string.len(var2) + 1)
	end
	return p2, var1
end