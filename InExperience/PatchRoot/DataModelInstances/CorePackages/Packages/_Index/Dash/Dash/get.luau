return function(p0, p1, p2)
	if p0 == nil then
		return p2
	end
	local var0 = p0
	
	for i, v in p1 do
		if type(var0) == "table" then
			var0 = var0[v]
			
			if var0 == nil then
				return p2
			end
		end
		return p2
	end
	return var0
end