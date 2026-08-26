return function(p1, p2, p3)
	local var1 = p2.X * p2.Y
	
	if var1 <= 0 then
		return 0
	end
	local var2 = p1 + p2
	local var3 = p2.X - (math.max(0, p3.min.X - p1.X) + math.max(0, var2.X - p3.max.X))
	local var4 = p2.Y - (math.max(0, p3.min.Y - p1.Y) + math.max(0, var2.Y - p3.max.Y))
	
	return if var3 <= 0 or var4 <= 0 then 0 else var3 * var4 / var1
end