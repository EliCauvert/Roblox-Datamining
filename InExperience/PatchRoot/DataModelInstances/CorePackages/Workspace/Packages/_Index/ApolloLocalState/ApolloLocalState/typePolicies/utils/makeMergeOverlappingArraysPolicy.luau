return function(p1)
	return function(_, p2, p3, p4)
		-- upvalues: p1 (ref)
		p2 = p2 or {}
		p3 = p3 or {}
		
		if #p3 == 0 then
			return p2
		elseif #p2 == 0 then
			return p3
		end
		local t = {}
		local cloned = table.clone(p2)
		
		for i, v in cloned do
			local var1 = p4:readField(p1, v)
			
			if var1 then
				t[var1] = i
			end
		end
		for i_1, v_1 in p3 do
			local var2 = p4:readField(p1, v_1)
			
			if var2 and t[var2] then
				local var3 = t[var2]
				cloned[var3] = p4:mergeObjects(cloned[var3], v_1)
			else
				table.insert(cloned, v_1)
			end
		end
		return cloned
	end
end