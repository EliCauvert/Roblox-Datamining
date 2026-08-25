return function(p0, p1, p2, p3)
	local list = table.create(#p1)
	local list_1 = table.create(#p2)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		local var9 = p3(v, i)
		
		if t_1[var9] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{var9}"`, 2)
		end
		t_1[var9] = true
		list[i] = var9
		t[var9] = v
	end
	table.clear(t_1)
	
	for i_1, v_1 in p2 do
		local var8 = p3(v_1, i_1)
		
		if t_1[var8] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{var8}"`, 2)
		end
		t_1[var8] = true
		list_1[i_1] = var8
	end
	local var4 = #list == #list_1
	
	if var4 then
		for i_2, v_2 in list_1 do
			if t[v_2] == nil then
				var4 = false
				break
			end
		end
	end
	local var5 = 0
	while var5 < math.min(#list, #list_1) and list[var5 + 1] == list_1[var5 + 1] do
		var5 += 1
	end
	local var6 = 0
	while var6 < math.min(#list, #list_1) - var5 and list[#list - var6] == list_1[#list_1 - var6] do
		var6 += 1
	end
	local function updateRetainedValues()
		-- upvalues: p2 (ref), t (ref), list_1 (ref), p0 (ref)
		for i, v in p2 do
			if t[list_1[i]] ~= v then
				p0.setItem(i, v)
			end
		end
	end
	
	p0.transaction(function()
		-- upvalues: list (ref), list_1 (ref), var5 (write), updateRetainedValues (ref), var6 (write), p0 (ref), p2 (ref), p1 (ref), var4 (write)
		if #list == #list_1 and var5 == #list_1 then
			updateRetainedValues()
			
			return
		elseif var5 + var6 == math.min(#list, #list_1) then
			local var10 = #list - var5 - var6
			local var11 = #list_1 - var5 - var6
			
			if var10 > 0 then
				p0.remove(var5 + 1, var10)
			end
			for i = 1, var11 do
				p0.insert(var5 + i, p2[var5 + i])
			end
			for i_1 = 1, var5 do
				if p1[i_1] ~= p2[i_1] then
					p0.setItem(i_1, p2[i_1])
				end
			end
			for i_2 = 0, var6 - 1 do
				local var12 = #p2 - i_2
				
				if p1[#p1 - i_2] ~= p2[var12] then
					p0.setItem(var12, p2[var12])
				end
			end
			return
		elseif not var4 then
			p0.reset(p2)
			
			return
		end
		local var13 = var5 + 1
		local index = table.find(list, list_1[var13])
		local var15 = var13
		
		local function matchesMove(p4, p5)
			-- upvalues: list (copy), list_1 (copy)
			if p4 == nil or p5 == nil then
				return false
			end
			local cloned = table.clone(list)
			table.insert(cloned, p5, table.remove(cloned, p4))
			
			for i, v in list_1 do
				if cloned[i] ~= v then
					return false
				end
			end
			return true
		end
		
		if not matchesMove(index, var15) then
			index = var13
			var15 = table.find(list_1, list[var13])
		end
		if matchesMove(index, var15) then
			p0.moveItem(index, var15)
		else
			p0.reorder(list_1)
		end
		updateRetainedValues()
	end)
end