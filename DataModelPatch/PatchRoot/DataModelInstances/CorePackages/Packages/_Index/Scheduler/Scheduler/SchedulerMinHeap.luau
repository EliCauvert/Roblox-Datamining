local Callback2 = nil
local Callback = nil
local Callback1 = nil
local SchedulerMinHeapModule = {
	push = function(p1, p2)
		-- upvalues: Callback (ref)
		local v1 = #p1 + 1
		p1[v1] = p2
		Callback(p1, p2, v1)
	end,
	peek = function(Entry)
		return Entry[1]
	end,
	pop = function(Entry)
		-- upvalues: Callback1 (ref)
		local Entry1 = Entry[1]
		
		if Entry1 == nil then
			return nil
		end
		local Entry2 = Entry[#Entry]
		Entry[#Entry] = nil
		
		if Entry2 ~= Entry1 then
			Entry[1] = Entry2
			Callback1(Entry, Entry2, 1)
		end
		return Entry1
	end
}

Callback = function(p1, p2, Floored: number)
	-- upvalues: Callback2 (ref)
	while true do
		local Floored1 = math.floor(Floored / 2)
		local v1 = p1[Floored1]
		if v1 == nil or Callback2(v1, p2) <= 0 then return end
		p1[Floored1] = p2
		p1[Floored] = v1
		Floored = Floored1
	end
end

Callback1 = function(p3, p4, Key: number)
	-- upvalues: Callback2 (ref)
	local CountP5 = #p3
	while Key < CountP5 do
		local ScaledKey = Key * 2
		local v2 = p3[ScaledKey]
		local NewScaledKey = ScaledKey + 1
		local v3 = p3[NewScaledKey]
		
		if v2 == nil or Callback2(v2, p4) >= 0 then
			if v3 == nil or Callback2(v3, p4) >= 0 then break end
			p3[Key] = v3
			p3[NewScaledKey] = p4
			Key = NewScaledKey
		elseif v3 == nil or Callback2(v3, v2) >= 0 then
			p3[Key] = v2
			p3[ScaledKey] = p4
			Key = ScaledKey
		else
			p3[Key] = v3
			p3[NewScaledKey] = p4
			Key = NewScaledKey
		end
	end
end

Callback2 = function(p5, p6)
	local SortIndexDelta = p5.sortIndex - p6.sortIndex
	
	return if SortIndexDelta == 0 then p5.id - p6.id else SortIndexDelta
end

return SchedulerMinHeapModule