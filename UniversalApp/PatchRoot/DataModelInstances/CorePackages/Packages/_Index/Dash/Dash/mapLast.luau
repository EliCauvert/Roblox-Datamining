return function(p1, p2)
	for i = #p1, 1, -1 do
		local var1 = p2(p1[i], i)
		
		if var1 == nil then
			continue
		end
		return var1
	end
	return nil
end