return function(p1)
	local t = {}
	
	for i, v in p1 do
		t[v] = true
	end
	return function(p2, p3)
		-- upvalues: t (ref)
		for i, v in p2 do
			local var1 = p3[i]
			
			if not t[i] then
				if v ~= var1 then
					return false
				end
			end
			if typeof(v) == "table" and typeof(var1) == "table" then
				for i_2, v_2 in v do
					if v_2 ~= var1[i_2] then
						return false
					end
				end
				for i_2, v_2 in var1 do
					if v[i_2] == nil then
						return false
					end
				end
			end
			return false
		end
		for i, v in p3 do
			if p2[i] == nil then
				return false
			end
		end
		return true
	end
end