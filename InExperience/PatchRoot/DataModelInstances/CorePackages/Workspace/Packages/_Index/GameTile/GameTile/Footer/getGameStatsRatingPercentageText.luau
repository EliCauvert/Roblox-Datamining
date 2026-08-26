return function(p1, p2)
	local var1 = "--"
	
	if p1 == nil or p1 < 0 then
		p1 = 0
	end
	if p2 == nil or p2 < 0 then
		p2 = 0
	end
	local var2 = p1 + p2
	
	if var2 > 0 then
		var1 = tostring(math.floor(p1 / var2 * 100))
	end
	return var1
end