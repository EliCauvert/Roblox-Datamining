return function(p1, p2, p3)
	local var1 = p3
	
	for i = #p1, 1, -1 do
		var1 = p2(var1, p1[i], i)
	end
	return var1
end