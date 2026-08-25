return function(p0)
	p0 += 59
	local var0 = 0
	local var1 = 0
	local var2 = 0
	
	if p0 >= 86400 then
		var0 = math.floor(p0 / 86400)
		p0 -= var0 * 86400
	end
	if p0 >= 3600 then
		var1 = math.floor(p0 / 3600)
		p0 -= var1 * 3600
	end
	if p0 > 0 then
		var2 = math.floor(p0 / 60)
	end
	return { days = var0, hours = var1, minutes = var2 }
end