return function(p1, p2, p3)
	local var1 = p2:len()
	
	if var1 == 0 then
		return true
	end
	local var2 = p1:len()
	p3 = p3 or var2
	
	if var2 < p3 then
		p3 = var2
	end
	if p3 < 1 then
		return false
	end
	local var3 = p3 - var1 + 1
	
	return p1:find(p2, var3, true) == var3
end