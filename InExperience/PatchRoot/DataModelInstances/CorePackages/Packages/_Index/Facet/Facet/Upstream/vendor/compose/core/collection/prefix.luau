return {
	create = function(Count: number, p1)
		local Buffer = table.create(Count + 1, 0)
		local Buffer1 = table.create(Count, p1)
		
		for i = 1, Count do
			Buffer[i] += p1
			local NewI = i + bit32.band(i, -i)
			
			if NewI <= Count then
				Buffer[NewI] += Buffer[i]
			end
		end
		return {
			count = Count,
			tree = Buffer,
			extents = Buffer1,
			sum = p1 * Count
		}
	end,
	set = function(p2, NewBits, p3): boolean
		local v1 = p3 - p2.extents[NewBits]
		
		if v1 == 0 then
			return false
		end
		p2.extents[NewBits] = p3
		p2.sum += v1
		local Tree = p2.tree
		local Count = p2.count
		local Value: number = NewBits
		while Value <= Count do
			Tree[Value] += v1
			Value += bit32.band(Value, -Value)
		end
		return true
	end,
	startOf = function(p4, p5: number): number
		local Tree = p4.tree
		local Total = 0
		local Value = p5 - 1
		while Value > 0 do
			Total += Tree[Value]
			Value -= bit32.band(Value, -Value)
		end
		return Total
	end,
	extentOf = function(p6, p7)
		return p6.extents[p7]
	end,
	find = function(p6, Total: number)
		local Count = p6.count
		
		if Count == 0 then
			return 0, 0
		end
		if Total <= 0 then
			return 1, 0
		end
		local Tree = p6.tree
		local v2 = 0
		local Total1: number = Total
		local v3 = 1
		while v3 * 2 <= Count do
			v3 *= 2
		end
		while v3 > 0 do
			local v4 = v2 + v3
			
			if v4 <= Count and Tree[v4] <= Total1 then
				v2 = v4
				Total1 -= Tree[v4]
			end
			v3 //= 2
		end
		local v5 = v2 + 1
		
		if Count < v5 then
			return Count, p6.sum - p6.extents[Count]
		else
			return v5, Total - Total1
		end
	end
}