return function(p0, p1) --[[ line: 13 | named "last" ]]
	for i = #p0, 1, -1 do
		local var0 = p0[i]
		
		if p1 then
			if not p1 or not p1(var0, i) then
				continue
			end
			return var0
		end
		return var0
	end
	return nil
end