return function(p1, p2, p3)
	local canvasHeight = p1.canvasHeight
	local var1 = if canvasHeight then p2 - canvasHeight else 0
	local var2 = p1.historicalCount < p3
	p1.canvasHeight = p2
	p1.historicalCount = p3
	
	return if var2 and var1 > 0 then var1 else 0
end