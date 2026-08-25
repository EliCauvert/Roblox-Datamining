return function(p0, p1)
	for i, v in ipairs(p0) do
		local var0 = p1(v, i)
		
		if var0 ~= nil then
			return var0
		end
	end
	return nil
end