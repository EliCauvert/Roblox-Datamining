local function applySplice(p1, p2, p3, p4: number, Count: number, List) --[[ Line: 12 ]]
	local v1 = #p2 - p4 - Count
	local v2 = #p3 - p4 - Count
	
	if v1 > 0 then
		p1.remove(p4 + 1, v1)
	end
	for i = 1, v2 do
		p1.insert(p4 + i, p3[p4 + i])
	end
	if List ~= nil then
		for _, value in List do
			p1.setItem(value, p3[value])
		end
	end
	for i1 = 0, Count - 1 do
		local v3 = #p3 - i1
		
		if p2[#p2 - i1] ~= p3[v3] then
			p1.setItem(v3, p3[v3])
		end
	end
end

local function reconcileSplice(p5, p6, p7, Callback): boolean --[[ Line: 45 ]]
	-- upvalues: applySplice (copy)
	local CountP7 = #p6
	local CountP8 = #p7
	local Smallest = math.min(CountP7, CountP8)
	local v4 = 0
	local List = nil
	while v4 < Smallest do
		local v5 = v4 + 1
		local v6 = p6[v5]
		local v7 = p7[v5]
		
		if v6 ~= v7 then
			if Callback(v6, v5) ~= Callback(v7, v5) then break end
			if List == nil then
				List = {}
			end
			table.insert(List, v5)
		end
		v4 = v5
	end
	local Count = 0
	while Count < Smallest - v4 do
		local CountPDelta = CountP7 - Count
		local CountPDelta1 = CountP8 - Count
		
		if Callback(p6[CountPDelta], CountPDelta) ~= Callback(p7[CountPDelta1], CountPDelta1) then break end
		Count += 1
	end
	if v4 + Count == Smallest then
		p5.transaction(function() --[[ Line: 83 ]]
			-- upvalues: applySplice (upval), p5 (copy), p6 (copy), p7 (copy), v4 (ref), Count (ref), List (ref)
			applySplice(p5, p6, p7, v4, Count, List)
		end)
		
		return true
	else
		return false
	end
end

return function(p8, List, List1, Callback) --[[ Line: 89 | Named "reconcileSnapshot" ]]
	-- upvalues: reconcileSplice (copy)
	if reconcileSplice(p8, List, List1, Callback) then return end
	local Buffer = table.create(#List)
	local Buffer1 = table.create(#List1)
	local t = {}
	local Tbl = {}
	
	for i, value in List do
		local CallbackResult = Callback(value, i)
		
		if Tbl[CallbackResult] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{CallbackResult}"`, 2)
		end
		Tbl[CallbackResult] = true
		Buffer[i] = CallbackResult
		t[CallbackResult] = value
	end
	table.clear(Tbl)
	
	for i1, value1 in List1 do
		local CallbackResult = Callback(value1, i1)
		
		if Tbl[CallbackResult] ~= nil then
			error(`DataSource.reconcileSnapshot: duplicate key "{CallbackResult}"`, 2)
		end
		Tbl[CallbackResult] = true
		Buffer1[i1] = CallbackResult
	end
	local Flag = #Buffer == #Buffer1
	
	if Flag then
		for _, value2 in Buffer1 do
			if t[value2] == nil then
				Flag = false
				break
			end
		end
	end
	local Count = 0
	while Count < math.min(#Buffer, #Buffer1) and Buffer[Count + 1] == Buffer1[Count + 1] do
		Count += 1
	end
	local function updateRetainedValues() --[[ Line: 136 ]]
		-- upvalues: List1 (copy), t (copy), Buffer1 (copy), p8 (copy)
		for i, value in List1 do
			if t[Buffer1[i]] ~= value then
				p8.setItem(i, value)
			end
		end
	end
	
	p8.transaction(function() --[[ Line: 144 ]]
		-- upvalues: Flag (ref), Count (ref), Buffer (copy), Buffer1 (copy), p8 (copy), updateRetainedValues (copy), List1 (copy)
		if not Flag then
			p8.reset(List1)
			
			return
		end
		local NewCount = Count + 1
		local FoundIndex: number? = table.find(Buffer, Buffer1[NewCount])
		local FoundIndex1: number? = NewCount
		
		local function matchesMove(Index, FoundIndex): boolean --[[ Line: 149 ]]
			-- upvalues: Buffer (upval), Buffer1 (upval)
			if Index == nil or FoundIndex == nil then
				return false
			end
			local Copy = table.clone(Buffer)
			table.insert(Copy, FoundIndex, (table.remove(Copy, Index)))
			
			for i, value in Buffer1 do
				if Copy[i] ~= value then
					return false
				end
			end
			return true
		end
		
		if not matchesMove(FoundIndex, FoundIndex1) then
			FoundIndex = NewCount
			FoundIndex1 = table.find(Buffer1, Buffer[NewCount])
		end
		if matchesMove(FoundIndex, FoundIndex1) then
			p8.moveItem(FoundIndex, FoundIndex1)
		else
			p8.reorder(Buffer1)
		end
		updateRetainedValues()
	end)
end