return function(p1, List, List1, Callback) --[[ Line: 12 | Named "reconcileSnapshot" ]]
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
	local Count1 = 0
	while Count1 < math.min(#Buffer, #Buffer1) - Count and Buffer[#Buffer - Count1] == Buffer1[#Buffer1 - Count1] do
		Count1 += 1
	end
	local function updateRetainedValues() --[[ Line: 63 ]]
		-- upvalues: List1 (copy), t (copy), Buffer1 (copy), p1 (copy)
		for i, value in List1 do
			if t[Buffer1[i]] ~= value then
				p1.setItem(i, value)
			end
		end
	end
	
	p1.transaction(function() --[[ Line: 71 ]]
		-- upvalues: Buffer (copy), Buffer1 (copy), Count (ref), updateRetainedValues (copy), Count1 (ref), p1 (copy), List1 (copy), List (copy), Flag (ref)
		if #Buffer == #Buffer1 and Count == #Buffer1 then
			updateRetainedValues()
			
			return
		end
		if Count + Count1 == math.min(#Buffer, #Buffer1) then
			local CountDelta = #Buffer - Count - Count1
			local CountDelta1 = #Buffer1 - Count - Count1
			
			if CountDelta > 0 then
				p1.remove(Count + 1, CountDelta)
			end
			for i = 1, CountDelta1 do
				p1.insert(Count + i, List1[Count + i])
			end
			for i1 = 1, Count do
				if List[i1] ~= List1[i1] then
					p1.setItem(i1, List1[i1])
				end
			end
			for i2 = 0, Count1 - 1 do
				local v1 = #List1 - i2
				
				if List[#List - i2] ~= List1[v1] then
					p1.setItem(v1, List1[v1])
				end
			end
			return
		else
			if not Flag then
				p1.reset(List1)
				
				return
			end
			local NewCount = Count + 1
			local FoundIndex: number? = table.find(Buffer, Buffer1[NewCount])
			local FoundIndex1: number? = NewCount
			
			local function matchesMove(Index, FoundIndex): boolean --[[ Line: 99 ]]
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
				p1.moveItem(FoundIndex, FoundIndex1)
			else
				p1.reorder(Buffer1)
			end
			updateRetainedValues()
		end
	end)
end