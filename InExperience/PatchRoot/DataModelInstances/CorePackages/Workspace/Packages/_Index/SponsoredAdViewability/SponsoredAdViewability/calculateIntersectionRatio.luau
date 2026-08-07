return function(p0, p1, p2) --[[ line: 8 | named "calculateIntersectionRatio" ]]
	local var0 = p1.X * p1.Y
	
	if var0 <= 0 then
		return 0
	end
	local var1 = p0 + p1
	local var2 = p1.X - (math.max(0, p2.min.X - p0.X) + math.max(0, var1.X - p2.max.X))
	local var3 = p1.Y - (math.max(0, p2.min.Y - p0.Y) + math.max(0, var1.Y - p2.max.Y))
	
	return if var2 <= 0 or var3 <= 0 then 0 else var2 * var3 / var0
end