return function(p1, p2, p3)
	p3 = p3 or " "
	local var1 = p2 - p1:len()
	local var2 = var1 % p3:len()
	
	return p1 .. string.rep(p3 or " ", (var1 - var2) / p3:len()) .. p2:sub(1, var2)
end