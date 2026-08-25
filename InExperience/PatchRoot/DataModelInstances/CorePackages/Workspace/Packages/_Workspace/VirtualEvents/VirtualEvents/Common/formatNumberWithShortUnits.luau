return function(p0)
	local absValue = math.abs(p0)
	local var1 = if absValue >= 1000000000 then ("%.0fB"):format(math.floor(p0 / 1000000000)) elseif absValue >= 1000000 then if absValue >= 100000000 then ("%.0fM"):format(math.floor(p0 / 1000000)) else ("%.1fM"):format(p0 / 1000000) elseif absValue >= 1000 then if absValue >= 100000 then ("%.0fK"):format(math.floor(p0 / 1000)) else ("%.1fK"):format(p0 / 1000) else tostring(p0)
	local var2, var3 = var1:match("(%d+)%.0(%w+)")
	
	if var2 and var3 then
		var1 = var2 .. var3
	end
	return var1
end