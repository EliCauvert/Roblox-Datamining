return function(p1)
	local var1 = (os.clock() - p1) * 1000
	
	return if var1 <= 0 then 0 else math.round(var1 * 100) / 100
end