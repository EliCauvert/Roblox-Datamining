local _ = require("../types")
local PrefixModule = require("./prefix")

local function _(p1: number, p2): number
	return if p1 <= 0 then 0 else math.ceil(p1 / p2)
end

local _ = function(p1)
	-- upvalues: PrefixModule (copy)
	if p1.rows == nil then
		p1.rows = PrefixModule.create(p1.rowCount, p1.rowSize + p1.gap)
		p1.itemSizes = table.create(p1.count, p1.rowSize)
		p1.uniform = false
		
		return
	end
end

local _ = function(p1, p2: number)
	-- upvalues: PrefixModule (copy)
	if p1.uniform then
		return (p2 - 1) * (p1.rowSize + p1.gap), p1.rowSize
	else
		local v1 = assert(p1.rows)
		
		return PrefixModule.startOf(v1, p2), PrefixModule.extentOf(v1, p2) - p1.gap
	end
end

local function rowAt(p1, Largest): number
	-- upvalues: PrefixModule (copy)
	if p1.rowCount == 0 then
		return 0
	elseif p1.uniform then
		local NewRowSize = p1.rowSize + p1.gap
		
		return if NewRowSize <= 0 then 1 else math.clamp(math.floor(Largest / NewRowSize) + 1, 1, p1.rowCount)
	else
		return (math.clamp(PrefixModule.find(assert(p1.rows), Largest), 1, p1.rowCount))
	end
end

local function rangeInto(p1, p2: number, p3: number, p4: number, p5)
	-- upvalues: rowAt (copy), PrefixModule (copy)
	if p1.rowCount == 0 then
		p5.first = 1
		p5.last = 0
		p5.firstRow = 1
		p5.lastRow = 0
		
		return p5
	end
	local RowAtResult: number = rowAt(p1, (math.max(0, p2)))
	local Count = nil
	
	if p3 <= 0 then
		Count = RowAtResult
	else
		Count = rowAt(p1, math.max(0, p2) + p3)
		local ScaledCount = nil
		
		if p1.uniform then
			ScaledCount = (Count - 1) * (p1.rowSize + p1.gap)
			local _ = p1.rowSize
		else
			local v1 = assert(p1.rows)
			ScaledCount = PrefixModule.startOf(v1, Count)
			local _ = PrefixModule.extentOf(v1, Count) - p1.gap
		end
		if RowAtResult < Count and p2 + p3 <= ScaledCount then
			Count -= 1
		end
	end
	local Largest = math.max(1, RowAtResult - p4)
	local Smallest = math.min(p1.rowCount, Count + p4)
	local Columns = p1.columns
	p5.first = (Largest - 1) * Columns + 1
	p5.last = math.min(p1.count, Smallest * Columns)
	p5.firstRow = Largest
	p5.lastRow = Smallest
	
	return p5
end

return {
	create = function(RowCount)
		local Largest = math.max(1, (math.floor(RowCount.columns)))
		local Count: number = RowCount.count
		
		return {
			uniform = true,
			rows = nil,
			itemSizes = nil,
			count = RowCount.count,
			columns = Largest,
			rowCount = if Count <= 0 then 0 else math.ceil(Count / Largest),
			gap = RowCount.gap,
			crossSize = RowCount.crossSize,
			crossGap = RowCount.crossGap,
			rowSize = RowCount.rowSize
		}
	end,
	totalExtent = function(p1)
		return if p1.rowCount == 0 then 0 elseif p1.uniform then p1.rowCount * (p1.rowSize + p1.gap) - p1.gap else assert(p1.rows).sum - p1.gap
	end,
	setItemSize = function(p1, Key: number, RowSize)
		-- upvalues: PrefixModule (copy)
		if Key < 1 or p1.count < Key then
			return false
		end
		if p1.uniform then
			if RowSize == p1.rowSize then
				return false
			end
			if p1.rows == nil then
				p1.rows = PrefixModule.create(p1.rowCount, p1.rowSize + p1.gap)
				p1.itemSizes = table.create(p1.count, p1.rowSize)
				p1.uniform = false
			end
		end
		local RowSizes = assert(p1.itemSizes)
		
		if RowSizes[Key] == RowSize then
			return false
		end
		RowSizes[Key] = RowSize
		local Columns = p1.columns
		local Ceiled = math.ceil(Key / Columns)
		local RowSize1 = nil
		
		if Columns == 1 then
			RowSize1 = RowSize
		else
			RowSize1 = 0
			
			for i = (Ceiled - 1) * Columns + 1, math.min(p1.count, Ceiled * Columns) do
				local RowSize2 = RowSizes[i]
				
				if RowSize1 < RowSize2 then
					RowSize1 = RowSize2
				end
			end
		end
		return PrefixModule.set(assert(p1.rows), Ceiled, RowSize1 + p1.gap)
	end,
	placementOf = function(p2, Index)
		-- upvalues: PrefixModule (copy)
		local Columns = p2.columns
		local Ceiled = math.ceil(Index / Columns)
		local IndexDelta = Index - (Ceiled - 1) * Columns
		local ScaledCeiled = nil
		local RowSize = nil
		
		if p2.uniform then
			ScaledCeiled = (Ceiled - 1) * (p2.rowSize + p2.gap)
			RowSize = p2.rowSize
		else
			local v1 = assert(p2.rows)
			ScaledCeiled = PrefixModule.startOf(v1, Ceiled)
			RowSize = PrefixModule.extentOf(v1, Ceiled) - p2.gap
		end
		return {
			index = Index,
			row = Ceiled,
			column = IndexDelta,
			offset = ScaledCeiled,
			size = RowSize,
			crossOffset = (IndexDelta - 1) * (p2.crossSize + p2.crossGap),
			crossSize = p2.crossSize
		}
	end,
	offsetOf = function(p2, Value: number)
		-- upvalues: PrefixModule (copy)
		if p2.count == 0 then
			return 0
		end
		local Ceiled = math.ceil(math.clamp(Value, 1, p2.count) / p2.columns)
		
		if p2.uniform then
			local _ = p2.rowSize
			
			return (Ceiled - 1) * (p2.rowSize + p2.gap)
		else
			local v1 = assert(p2.rows)
			local _ = PrefixModule.extentOf(v1, Ceiled) - p2.gap
			
			return (PrefixModule.startOf(v1, Ceiled))
		end
	end,
	rangeFor = function(p2, p3, p4, p5)
		-- upvalues: rangeInto (copy)
		return (rangeInto(p2, p3, p4, p5, { first = 1, last = 0, firstRow = 1, lastRow = 0 }))
	end,
	rangeInto = rangeInto
}