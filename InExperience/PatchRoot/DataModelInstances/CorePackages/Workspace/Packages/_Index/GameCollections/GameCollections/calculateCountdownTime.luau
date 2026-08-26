return function(p1)
	p1 += 59
	local var1 = 0
	local var2 = 0
	local var3 = 0
	
	if p1 >= 86400 then
		var1 = math.floor(p1 / 86400)
		p1 -= var1 * 86400
	end
	if p1 >= 3600 then
		var2 = math.floor(p1 / 3600)
		p1 -= var2 * 3600
	end
	if p1 > 0 then
		var3 = math.floor(p1 / 60)
	end
	return { days = var1, hours = var2, minutes = var3 }
end