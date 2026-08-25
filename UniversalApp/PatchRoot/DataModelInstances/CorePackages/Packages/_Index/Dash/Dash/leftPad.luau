return function(p0, p1, p2)
	p2 = p2 or " "
	local var1 = p1 - p0:len()
	local var2 = var1 % p2:len()
	
	return string.rep(p2 or " ", (var1 - var2) / p2:len()) .. p2:sub(1, var2) .. p0
end