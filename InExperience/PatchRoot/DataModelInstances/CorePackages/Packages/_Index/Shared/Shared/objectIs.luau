return function(p1, p2)
	local var1
	if p1 == p2 then
		var1 = true
		
		if p1 == 0 then
			var1 = true
			
			if 1 / p1 ~= 1 / p2 then
				var1 = p1 ~= p1 and p2 ~= p2
			end
		end
		return var1
	end
end