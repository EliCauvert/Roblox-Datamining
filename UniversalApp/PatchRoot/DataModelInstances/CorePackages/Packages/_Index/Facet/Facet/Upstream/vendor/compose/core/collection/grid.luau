local function _(p1, p2): number
	return (math.clamp(math.floor(p1 / p2), -65536, 65535))
end

return {
	create = function(p1: number)
		return {
			count = 0,
			minX = 0,
			maxX = -1,
			minY = 0,
			maxY = -1,
			minZ = 0,
			maxZ = -1,
			cellSize = if p1 > 0 then p1 else 1,
			buckets = {},
			activeKeys = {},
			pool = {},
			lengths = {}
		}
	end,
	build = function(p1, p2, Callback)
		local Buckets = p1.buckets
		local Lengths = p1.lengths
		local ActiveKeys = p1.activeKeys
		local Pool = p1.pool
		
		for _, activeKey in ActiveKeys do
			Buckets[activeKey] = nil
			Lengths[activeKey] = nil
			Pool[#Pool + 1] = Buckets[activeKey]
		end
		table.clear(ActiveKeys)
		local CellSize = p1.cellSize
		local CountP7 = #p2
		p1.count = CountP7
		local MinX = 1e999
		local MaxX = -1e999
		local MinY = 1e999
		local MaxY = -1e999
		local MinZ = 1e999
		local MaxZ = -1e999
		
		for i = 1, CountP7 do
			local CallbackResult, CallbackResult2, CallbackResult3 = Callback(p2[i])
			local ClampedValue = math.clamp(math.floor(CallbackResult / CellSize), -65536, 65535)
			local ClampedValue1 = math.clamp(math.floor(CallbackResult2 / CellSize), -65536, 65535)
			local ClampedValue2 = math.clamp(math.floor((CallbackResult3 or 0) / CellSize), -65536, 65535)
			
			if ClampedValue < MinX then
				MinX = ClampedValue
			end
			if MaxX < ClampedValue then
				MaxX = ClampedValue
			end
			if ClampedValue1 < MinY then
				MinY = ClampedValue1
			end
			if MaxY < ClampedValue1 then
				MaxY = ClampedValue1
			end
			if ClampedValue2 < MinZ then
				MinZ = ClampedValue2
			end
			if MaxZ < ClampedValue2 then
				MaxZ = ClampedValue2
			end
			local NewClampedValue = ((ClampedValue + 65536) * 131072 + (ClampedValue1 + 65536)) * 131072 + (ClampedValue2 + 65536)
			local Bucket = Buckets[NewClampedValue]
			
			if Bucket == nil then
				Bucket = table.remove(Pool) or {}
				Buckets[NewClampedValue] = Bucket
				Lengths[NewClampedValue] = 0
				ActiveKeys[#ActiveKeys + 1] = NewClampedValue
			end
			local NewLength = Lengths[NewClampedValue] + 1
			Lengths[NewClampedValue] = NewLength
			Bucket[NewLength] = i
		end
		if CountP7 > 0 then
			p1.minX = MinX
			p1.maxX = MaxX
			p1.minY = MinY
			p1.maxY = MaxY
			p1.minZ = MinZ
			p1.maxZ = MaxZ
			
			return
		else
			p1.minX = 0
			p1.maxX = -1
			p1.minY = 0
			p1.maxY = -1
			p1.minZ = 0
			p1.maxZ = -1
		end
	end,
	query = function(p3, p4, p5, p6, p7, Callback: (any) -> ()): number
		local CellSize = p3.cellSize
		local Buckets = p3.buckets
		local Largest = math.max(math.clamp(math.floor((p4 - p7) / CellSize), -65536, 65535), p3.minX)
		local Smallest = math.min(math.clamp(math.floor((p4 + p7) / CellSize), -65536, 65535), p3.maxX)
		local Largest1 = math.max(math.clamp(math.floor((p5 - p7) / CellSize), -65536, 65535), p3.minY)
		local Smallest1 = math.min(math.clamp(math.floor((p5 + p7) / CellSize), -65536, 65535), p3.maxY)
		local Largest2 = math.max(math.clamp(math.floor((p6 - p7) / CellSize), -65536, 65535), p3.minZ)
		local Smallest2 = math.min(math.clamp(math.floor((p6 + p7) / CellSize), -65536, 65535), p3.maxZ)
		local Count = 0
		
		for i = Largest, Smallest do
			for i1 = Largest1, Smallest1 do
				for i2 = Largest2, Smallest2 do
					Count += 1
					local NewI = ((i + 65536) * 131072 + (i1 + 65536)) * 131072 + (i2 + 65536)
					local Length: number = p3.lengths[NewI]
					
					if Length ~= nil and Length > 0 then
						local Bucket = Buckets[NewI]
						
						for i3 = 1, Length do
							Callback(Bucket[i3])
						end
					end
				end
			end
		end
		return Count
	end,
	keyOf = function(p8: number, p9: number, p10: number): number
		return ((p8 + 65536) * 131072 + (p9 + 65536)) * 131072 + (p10 + 65536)
	end
}