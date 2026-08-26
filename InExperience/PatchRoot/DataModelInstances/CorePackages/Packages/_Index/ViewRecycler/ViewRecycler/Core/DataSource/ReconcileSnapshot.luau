return function(p1, p2, p3, p4)
	local list = table.create(#p2)
	local list_1 = table.create(#p3)
	local t = {}
	local t_1 = {}
	
	for i, v in p2 do
		local var1 = p4(v, i)
		
		if t_1[var1] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{var9}"`, 2)
		end
		t_1[var1] = true
		list[i] = var1
		t[var1] = v
	end
	table.clear(t_1)
	
	for i_1, v_1 in p3 do
		local var2 = p4(v_1, i_1)
		
		if t_1[var2] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{var8}"`, 2)
		end
		t_1[var2] = true
		list_1[i_1] = var2
	end
	local var3 = #list == #list_1
	
	if var3 then
		for i_2, v_2 in list_1 do
			if t[v_2] == nil then
				var3 = false
				break
			end
		end
	end
	local var4 = 0
	while var4 < math.min(#list, #list_1) and list[var4 + 1] == list_1[var4 + 1] do
		var4 += 1
	end
	local var5 = 0
	while var5 < math.min(#list, #list_1) - var4 and list[#list - var5] == list_1[#list_1 - var5] do
		var5 += 1
	end
	local function updateRetainedValues()
		-- upvalues: p3 (ref), t (ref), list_1 (ref), p1 (ref)
		for i, v in p3 do
			if t[list_1[i]] ~= v then
				p1.setItem(i, v)
			end
		end
	end
	
	p1.transaction(function()
		-- upvalues: list (ref), list_1 (ref), var4 (write), updateRetainedValues (ref), var5 (write), p1 (ref), p3 (ref), p2 (ref), var3 (write)
		if #list == #list_1 and var4 == #list_1 then
			updateRetainedValues()
			
			return
		elseif var4 + var5 == math.min(#list, #list_1) then
			local var6 = #list - var4 - var5
			local var7 = #list_1 - var4 - var5
			
			if var6 > 0 then
				p1.remove(var4 + 1, var6)
			end
			for i = 1, var7 do
				p1.insert(var4 + i, p3[var4 + i])
			end
			for i_1 = 1, var4 do
				if p2[i_1] ~= p3[i_1] then
					p1.setItem(i_1, p3[i_1])
				end
			end
			for i_2 = 0, var5 - 1 do
				local var8 = #p3 - i_2
				
				if p2[#p2 - i_2] ~= p3[var8] then
					p1.setItem(var8, p3[var8])
				end
			end
			return
		elseif not var3 then
			p1.reset(p3)
			
			return
		end
		local var9 = var4 + 1
		local index = table.find(list, list_1[var9])
		local var10 = var9
		
		local function matchesMove(p5, p6)
			-- upvalues: list (copy), list_1 (copy)
			if p5 == nil or p6 == nil then
				return false
			end
			local cloned = table.clone(list)
			table.insert(cloned, p6, table.remove(cloned, p5))
			
			for i, v in list_1 do
				if cloned[i] ~= v then
					return false
				end
			end
			return true
		end
		
		if not matchesMove(index, var10) then
			index = var9
			var10 = table.find(list_1, list[var9])
		end
		if matchesMove(index, var10) then
			p1.moveItem(index, var10)
		else
			p1.reorder(list_1)
		end
		updateRetainedValues()
	end)
end