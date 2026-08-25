return function(p0)
	return function(_, p1, p2, p3)
		-- upvalues: p0 (ref)
		p1 = p1 or {}
		p2 = p2 or {}
		
		if #p2 == 0 then
			return p1
		elseif #p1 == 0 then
			return p2
		end
		local t = {}
		local cloned = table.clone(p1)
		
		for i, v in cloned do
			local var6 = p3:readField(p0, v)
			
			if var6 then
				t[var6] = i
			end
		end
		for i_1, v_1 in p2 do
			local var4 = p3:readField(p0, v_1)
			
			if var4 and t[var4] then
				local var5 = t[var4]
				cloned[var5] = p3:mergeObjects(cloned[var5], v_1)
			else
				table.insert(cloned, v_1)
			end
		end
		return cloned
	end
end