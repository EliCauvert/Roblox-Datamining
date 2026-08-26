return function(p1, p2)
	for i = #p1, 1, -1 do
		local var1 = p1[i]
		
		if p2 then
			if not p2 or not p2(var1, i) then
				continue
			end
			return var1
		end
		return var1
	end
	return nil
end