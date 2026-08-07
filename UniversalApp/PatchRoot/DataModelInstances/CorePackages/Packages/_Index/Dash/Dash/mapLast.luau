return function(p0, p1) --[[ line: 12 | named "mapLast" ]]
	for i = #p0, 1, -1 do
		local var0 = p1(p0[i], i)
		
		if var0 == nil then
			continue
		end
		return var0
	end
	return nil
end