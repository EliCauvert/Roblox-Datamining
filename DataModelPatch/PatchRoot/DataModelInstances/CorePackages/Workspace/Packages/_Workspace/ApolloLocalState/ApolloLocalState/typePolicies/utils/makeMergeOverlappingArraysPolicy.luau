return function(p1)
	return function(_, p2, p3, p4)
		-- upvalues: p1 (copy)
		local Tbl = p2 or {}
		local P3 = p3 or {}
		
		if #P3 == 0 then
			return Tbl
		end
		if #Tbl == 0 then
			return P3
		end
		local t = {}
		local Copy = table.clone(Tbl)
		
		for i, value in Copy do
			local Field = p4:readField(p1, value)
			
			if Field then
				t[Field] = i
			end
		end
		for _, value1 in P3 do
			local Field = p4:readField(p1, value1)
			
			if Field and t[Field] then
				local Entry = t[Field]
				Copy[Entry] = p4:mergeObjects(Copy[Entry], value1)
			else
				table.insert(Copy, value1)
			end
		end
		return Copy
	end
end