return function(p0, p1)
	for i, v in p0 do
		local var0 = if p1 then p1(v, i) else v
		
		if var0 ~= nil then
			return var0
		end
	end
	return nil
end