return function(p1)
	local var1 = nil
	
	for i, v in p1 do
		if var1 == nil or v == var1 then
			if var1 == nil then
				var1 = v
			end
		end
		return nil
	end
	return var1
end