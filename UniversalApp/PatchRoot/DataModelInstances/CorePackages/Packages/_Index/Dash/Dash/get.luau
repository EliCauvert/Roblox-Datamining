return function(p1, p2, p3)
	if p1 == nil then
		return p3
	end
	local var1 = p1
	
	for i, v in p2 do
		if type(var1) == "table" then
			var1 = var1[v]
			
			if var1 == nil then
				return p3
			end
		end
		return p3
	end
	return var1
end