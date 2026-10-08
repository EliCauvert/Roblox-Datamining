local function applySplice(p1, p2, p3, p4, p5, p6)
	local var1 = #p2 - p4 - p5
	local var2 = #p3 - p4 - p5
	
	if var1 > 0 then
		p1.remove(p4 + 1, var1)
	end
	for i = 1, var2 do
		p1.insert(p4 + i, p3[p4 + i])
	end
	if p6 ~= nil then
		for i_1, v in p6 do
			p1.setItem(v, p3[v])
		end
	end
	for i_1 = 0, p5 - 1 do
		local var3 = #p3 - i_1
		
		if p2[#p2 - i_1] ~= p3[var3] then
			p1.setItem(var3, p3[var3])
		end
	end
end

local function reconcileSplice(p7, p8, p9, p10)
	-- upvalues: applySplice (ref)
	local p7Count = #p8
	local p8Count = #p9
	local minValue = math.min(p7Count, p8Count)
	local var4 = 0
	local t = nil
	while var4 < minValue do
		local var5 = var4 + 1
		local var6 = p8[var5]
		local var7 = p9[var5]
		
		if var6 == var7 then
			var4 = var5
			continue
		elseif p10(var6, var5) ~= p10(var7, var5) then
			break
		elseif t == nil then
			t = {}
		end
		table.insert(t, var5)
	end
	local var8 = 0
	while var8 < minValue - var4 do
		local var9 = p7Count - var8
		local var10 = p8Count - var8
		
		if p10(p8[var9], var9) ~= p10(p9[var10], var10) then break end
		var8 += 1
	end
	if var4 + var8 == minValue then
		p7.transaction(function()
			-- upvalues: applySplice (copy), p7 (ref), p8 (ref), p9 (ref), var4 (write), var8 (write), t (write)
			applySplice(p7, p8, p9, var4, var8, t)
		end)
		
		return true
	end
	return false
end

return function(p11, p12, p13, p14)
	-- upvalues: reconcileSplice (ref)
	if reconcileSplice(p11, p12, p13, p14) then return end
	local list = table.create(#p12)
	local list_1 = table.create(#p13)
	local t = {}
	local t_1 = {}
	
	for i, v in p12 do
		local var11 = p14(v, i)
		
		if t_1[var11] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{var24}"`, 2)
		end
		t_1[var11] = true
		list[i] = var11
		t[var11] = v
	end
	table.clear(t_1)
	
	for i_1, v_1 in p13 do
		local var12 = p14(v_1, i_1)
		
		if t_1[var12] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{var23}"`, 2)
		end
		t_1[var12] = true
		list_1[i_1] = var12
	end
	local var13 = #list == #list_1
	
	if var13 then
		for i_2, v_2 in list_1 do
			if t[v_2] == nil then
				var13 = false
				break
			end
		end
	end
	local var14 = 0
	while var14 < math.min(#list, #list_1) and list[var14 + 1] == list_1[var14 + 1] do
		var14 += 1
	end
	local function updateRetainedValues()
		-- upvalues: p13 (ref), t (ref), list_1 (ref), p11 (ref)
		for i, v in p13 do
			if t[list_1[i]] ~= v then
				p11.setItem(i, v)
			end
		end
	end
	
	p11.transaction(function()
		-- upvalues: var13 (write), var14 (write), list (ref), list_1 (ref), p11 (ref), updateRetainedValues (ref), p13 (ref)
		if not var13 then
			p11.reset(p13)
			
			return
		end
		local var15 = var14 + 1
		local index = table.find(list, list_1[var15])
		local var16 = var15
		
		local function matchesMove(p15, p16)
			-- upvalues: list (copy), list_1 (copy)
			if p15 == nil or p16 == nil then
				return false
			end
			local cloned = table.clone(list)
			table.insert(cloned, p16, table.remove(cloned, p15))
			
			for i, v in list_1 do
				if cloned[i] ~= v then
					return false
				end
			end
			return true
		end
		
		if not matchesMove(index, var16) then
			index = var15
			var16 = table.find(list_1, list[var15])
		end
		if matchesMove(index, var16) then
			p11.moveItem(index, var16)
		else
			p11.reorder(list_1)
		end
		updateRetainedValues()
	end)
end