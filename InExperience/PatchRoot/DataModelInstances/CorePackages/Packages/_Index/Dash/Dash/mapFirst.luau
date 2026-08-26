return function(p1, p2)
	for i, v in ipairs(p1) do
		local var1 = p2(v, i)
		
		if var1 ~= nil then
			return var1
		end
	end
	return nil
end