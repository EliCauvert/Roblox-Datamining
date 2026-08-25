return function(p0, p1)
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