return function(p1, p2, p3)
	local var1 = p3
	
	for i, v in p1 do
		var1 = p2(var1, v, i)
	end
	return var1
end