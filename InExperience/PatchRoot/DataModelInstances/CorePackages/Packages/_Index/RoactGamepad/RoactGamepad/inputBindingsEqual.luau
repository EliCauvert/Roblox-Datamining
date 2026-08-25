return function(p0, p1)
	if p0 == p1 then
		return true
	end
	for i, v in pairs(p0) do
		local var0 = p1[i]
		
		if var0 ~= nil then
			if v.kind == var0.kind and v.keyCode == var0.keyCode and v.action == var0.action then
				local meta = v.meta
				local meta_1 = var0.meta
				
				if meta ~= meta_1 then
					if typeof(meta) == "table" and typeof(meta_1) == "table" then
						for i_1, v_1 in pairs(meta) do
							if v_1 ~= meta_1[i_1] then
								return false
							end
						end
						for i_1 in pairs(meta_1) do
							if meta[i_1] == nil then
								return false
							end
						end
					end
					return false
				end
			end
			return false
		end
		return false
	end
	for i_1 in pairs(p1) do
		if p0[i_1] == nil then
			return false
		end
	end
	return true
end