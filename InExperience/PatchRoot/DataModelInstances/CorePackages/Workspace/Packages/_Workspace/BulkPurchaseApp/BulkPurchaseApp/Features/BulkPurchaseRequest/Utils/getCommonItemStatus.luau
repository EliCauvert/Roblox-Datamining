return function(p0)
	local var0 = nil
	
	for i, v in p0 do
		if var0 == nil or v == var0 then
			if var0 == nil then
				var0 = v
			end
		end
		return nil
	end
	return var0
end