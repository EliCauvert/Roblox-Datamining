return function(p1, p2, p3, p4, p5)
	local var1 = p1 - p2
	
	return p3.X - p5 <= var1.X and (var1.X <= p3.X + p4.X + p5 and (p3.Y - p5 <= var1.Y and var1.Y <= p3.Y + p4.Y + p5))
end