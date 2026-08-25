return function(p0, p1)
	local var0 = "--"
	
	if p0 == nil or p0 < 0 then
		p0 = 0
	end
	if p1 == nil or p1 < 0 then
		p1 = 0
	end
	local var1 = p0 + p1
	
	if var1 > 0 then
		var0 = tostring(math.floor(p0 / var1 * 100))
	end
	return var0
end