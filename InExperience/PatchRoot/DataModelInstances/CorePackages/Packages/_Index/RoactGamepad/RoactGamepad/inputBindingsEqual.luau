return function(p1, p2)
	if p1 == p2 then
		return true
	end
	for i, v in pairs(p1) do
		local var1 = p2[i]
		
		if var1 ~= nil then
			if v.kind == var1.kind and v.keyCode == var1.keyCode and v.action == var1.action then
				local meta = v.meta
				local meta_1 = var1.meta
				
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
	for i_1 in pairs(p2) do
		if p1[i_1] == nil then
			return false
		end
	end
	return true
end