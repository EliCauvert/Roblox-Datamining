return function(p1, p2)
	for i, v in p1 do
		local var1 = if p2 then p2(v, i) else v
		
		if var1 ~= nil then
			return var1
		end
	end
	return nil
end