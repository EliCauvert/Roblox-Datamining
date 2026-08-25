return function(p0, p1, p2)
	local var0 = p2
	
	for i, v in p0 do
		var0 = p1(var0, v, i)
	end
	return var0
end