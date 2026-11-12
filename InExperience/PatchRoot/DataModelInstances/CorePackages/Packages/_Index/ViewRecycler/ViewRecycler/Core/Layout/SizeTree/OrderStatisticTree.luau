local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
local _ = require(script.Parent.ISizeTree)
local WeightedOrderStatisticTreeModule = require(script.Parent.WeightedOrderStatisticTree)

local function prefixSumUpTo(Balanced, p1: number, EstimatedItemLength)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), prefixSumUpTo (copy), FFlagViewRecyclerReact084 (copy)
	if Balanced == nil or p1 <= 0 then
		return 0
	else
		local NewNodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left) + 1
		
		return if p1 < NewNodeItemCountResult then prefixSumUpTo(Balanced.left, p1, EstimatedItemLength) elseif NewNodeItemCountResult < p1 then WeightedOrderStatisticTreeModule.nodeEffectiveSum(Balanced.left, EstimatedItemLength) + ((if FFlagViewRecyclerReact084 then Balanced.measuredSize or Balanced.estimatedSize else Balanced.measuredSize) or EstimatedItemLength) + prefixSumUpTo(Balanced.right, p1 - NewNodeItemCountResult, EstimatedItemLength) else WeightedOrderStatisticTreeModule.nodeEffectiveSum(Balanced.left, EstimatedItemLength) + ((if FFlagViewRecyclerReact084 then Balanced.measuredSize or Balanced.estimatedSize else Balanced.measuredSize) or EstimatedItemLength)
	end
end

local function rankAtPrefixSum(Balanced, p1, EstimatedItemLength)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), rankAtPrefixSum (copy), FFlagViewRecyclerReact084 (copy)
	if Balanced == nil then
		return 0
	end
	local NodeEffectiveSumResult = WeightedOrderStatisticTreeModule.nodeEffectiveSum(Balanced.left, EstimatedItemLength)
	
	if p1 < NodeEffectiveSumResult then
		return rankAtPrefixSum(Balanced.left, p1, EstimatedItemLength)
	end
	local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
	local MeasuredSize = (if FFlagViewRecyclerReact084 then Balanced.measuredSize or Balanced.estimatedSize else Balanced.measuredSize) or EstimatedItemLength
	
	if p1 < NodeEffectiveSumResult + MeasuredSize then
		return NodeItemCountResult + 1
	else
		local RankAtPrefixSumResult = rankAtPrefixSum(Balanced.right, p1 - NodeEffectiveSumResult - MeasuredSize, EstimatedItemLength)
		
		return if RankAtPrefixSumResult == 0 then 0 else NodeItemCountResult + 1 + RankAtPrefixSumResult
	end
end

local function entryAtPrefixSum(Balanced, p1, EstimatedItemLength)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), entryAtPrefixSum (copy), FFlagViewRecyclerReact084 (copy)
	if Balanced == nil then
		return 0, 0, 0
	end
	local NodeEffectiveSumResult = WeightedOrderStatisticTreeModule.nodeEffectiveSum(Balanced.left, EstimatedItemLength)
	
	if p1 < NodeEffectiveSumResult then
		return entryAtPrefixSum(Balanced.left, p1, EstimatedItemLength)
	end
	local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
	local MeasuredSize = (if FFlagViewRecyclerReact084 then Balanced.measuredSize or Balanced.estimatedSize else Balanced.measuredSize) or EstimatedItemLength
	
	if p1 < NodeEffectiveSumResult + MeasuredSize then
		return NodeItemCountResult + 1, NodeEffectiveSumResult, MeasuredSize
	end
	local EntryAtPrefixSumResult, EntryAtPrefixSumResult2, EntryAtPrefixSumResult3 = entryAtPrefixSum(Balanced.right, p1 - NodeEffectiveSumResult - MeasuredSize, EstimatedItemLength)
	
	if EntryAtPrefixSumResult == 0 then
		return 0, 0, 0
	else
		return NodeItemCountResult + 1 + EntryAtPrefixSumResult, NodeEffectiveSumResult + MeasuredSize + EntryAtPrefixSumResult2, EntryAtPrefixSumResult3
	end
end

return {
	new = function(p1)
		-- upvalues: WeightedOrderStatisticTreeModule (copy), prefixSumUpTo (copy), rankAtPrefixSum (copy), FFlagViewRecyclerReact084 (copy), entryAtPrefixSum (copy)
		local InsertUnitAtResult = nil
		local P9 = p1 or 0
		
		local function length()
			-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref)
			return WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult)
		end
		
		local function prefixSum(p2: number)
			-- upvalues: prefixSumUpTo (upval), InsertUnitAtResult (ref), P9 (ref)
			return if p2 <= 1 then 0 else prefixSumUpTo(InsertUnitAtResult, p2 - 1, P9)
		end
		
		local function indexAtPrefixSum(p2: number)
			-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref), P9 (ref), rankAtPrefixSum (upval)
			local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult)
			
			return if NodeItemCountResult == 0 or p2 <= 0 then 1 elseif WeightedOrderStatisticTreeModule.nodeEffectiveSum(InsertUnitAtResult, P9) <= p2 then NodeItemCountResult + 1 else rankAtPrefixSum(InsertUnitAtResult, p2, P9)
		end
		
		local function getEntryAtPrefixSum(p2: number)
			-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref), FFlagViewRecyclerReact084 (upval), P9 (ref), entryAtPrefixSum (upval)
			local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult)
			
			if NodeItemCountResult == 0 then
				return 1, 0, 0
			elseif p2 > 0 then
				local NodeEffectiveSumResult = WeightedOrderStatisticTreeModule.nodeEffectiveSum(InsertUnitAtResult, P9)
				
				if NodeEffectiveSumResult <= p2 then
					return NodeItemCountResult + 1, NodeEffectiveSumResult, 0
				else
					return entryAtPrefixSum(InsertUnitAtResult, p2, P9)
				end
			elseif FFlagViewRecyclerReact084 then
				return 1, 0, WeightedOrderStatisticTreeModule.unitSizeAt(InsertUnitAtResult, 1, P9)
			else
				return 1, 0, WeightedOrderStatisticTreeModule.measuredAt(InsertUnitAtResult, 1) or P9
			end
		end
		
		local function getSize(p2: number)
			-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref), FFlagViewRecyclerReact084 (upval), P9 (ref)
			return if p2 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult) < p2 then 0 elseif FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.unitSizeAt(InsertUnitAtResult, p2, P9) else WeightedOrderStatisticTreeModule.measuredAt(InsertUnitAtResult, p2) or P9
		end
		
		local function fillRange(p2, p3, p4)
			-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref), P9 (ref)
			WeightedOrderStatisticTreeModule.fillRangeFromNode(InsertUnitAtResult, 0, 0, p2, p3, P9, p4)
			
			for i = #p4, p3 - p2 + 2, -1 do
				p4[i] = nil
			end
		end
		
		local function update(p5, p6)
			-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref)
			WeightedOrderStatisticTreeModule.updateUnitAt(InsertUnitAtResult, p5, p6)
		end
		
		local Insert = if FFlagViewRecyclerReact084 then function(p5, p6, p7)
			-- upvalues: InsertUnitAtResult (ref), WeightedOrderStatisticTreeModule (upval)
			InsertUnitAtResult = WeightedOrderStatisticTreeModule.insertUnitAt(InsertUnitAtResult, p5, p6, p7)
		end else function(p5, p6)
			-- upvalues: InsertUnitAtResult (ref), WeightedOrderStatisticTreeModule (upval)
			InsertUnitAtResult = WeightedOrderStatisticTreeModule.insertUnitAt(InsertUnitAtResult, p5, p6)
		end
		
		local function remove(p5)
			-- upvalues: InsertUnitAtResult (ref), WeightedOrderStatisticTreeModule (upval)
			InsertUnitAtResult = WeightedOrderStatisticTreeModule.removeUnitAt(InsertUnitAtResult, p5)
		end
		
		local function buildFromArray(List)
			-- upvalues: InsertUnitAtResult (ref), WeightedOrderStatisticTreeModule (upval)
			local Buffer = table.create(#List)
			
			for i, MeasuredSize in List do
				Buffer[i] = { itemCount = 1, measuredSize = MeasuredSize }
			end
			InsertUnitAtResult = WeightedOrderStatisticTreeModule.buildBalanced(Buffer, 1, #Buffer)
		end
		
		local SetItemEstimate: ((number, any) -> boolean)? = nil
		
		if FFlagViewRecyclerReact084 then
			SetItemEstimate = function(p5: number, p6): boolean
				-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref), FFlagViewRecyclerReact084 (upval), P9 (ref)
				if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult) < p5 or WeightedOrderStatisticTreeModule.estimatedAt(InsertUnitAtResult, p5) == p6 then
					return false
				else
					local MeasuredAtResult = WeightedOrderStatisticTreeModule.measuredAt(InsertUnitAtResult, p5)
					InsertUnitAtResult = WeightedOrderStatisticTreeModule.removeUnitAt(InsertUnitAtResult, p5)
					InsertUnitAtResult = WeightedOrderStatisticTreeModule.insertUnitAt(InsertUnitAtResult, p5, MeasuredAtResult, p6)
					
					return (if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult) < p5 then 0 elseif FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.unitSizeAt(InsertUnitAtResult, p5, P9) else WeightedOrderStatisticTreeModule.measuredAt(InsertUnitAtResult, p5) or P9) ~= (if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult) < p5 then 0 elseif FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.unitSizeAt(InsertUnitAtResult, p5, P9) else WeightedOrderStatisticTreeModule.measuredAt(InsertUnitAtResult, p5) or P9)
				end
			end
			
			local function buildFromMeasurements(p5, Callback, Callback1)
				-- upvalues: InsertUnitAtResult (ref), WeightedOrderStatisticTreeModule (upval)
				local Buffer = table.create(p5)
				
				for i = 1, p5 do
					Buffer[i] = {
						itemCount = 1,
						measuredSize = Callback(i),
						estimatedSize = if Callback1 == nil then nil else Callback1(i)
					}
				end
				InsertUnitAtResult = WeightedOrderStatisticTreeModule.buildBalanced(Buffer, 1, p5)
			end
		else
			local function buildFromMeasurements(p6, Callback)
				-- upvalues: InsertUnitAtResult (ref), WeightedOrderStatisticTreeModule (upval)
				local Buffer = table.create(p6)
				
				for i = 1, p6 do
					Buffer[i] = { itemCount = 1, measuredSize = Callback(i) }
				end
				InsertUnitAtResult = WeightedOrderStatisticTreeModule.buildBalanced(Buffer, 1, p6)
			end
		end
		return {
			prefixSum = prefixSum,
			indexAtPrefixSum = indexAtPrefixSum,
			entryAtPrefixSum = getEntryAtPrefixSum,
			getSize = getSize,
			fillRange = fillRange,
			update = update,
			insert = Insert,
			remove = remove,
			setItemEstimate = if FFlagViewRecyclerReact084 then SetItemEstimate else nil,
			buildFromArray = buildFromArray,
			buildFromMeasurements = buildFromMeasurements,
			toArray = function()
				-- upvalues: length (copy), WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref), P9 (ref)
				local Buffer = table.create(length())
				WeightedOrderStatisticTreeModule.appendToArray(InsertUnitAtResult, Buffer, P9)
				
				return Buffer
			end,
			setEstimatedItemLength = function(Value): boolean
				-- upvalues: P9 (ref), FFlagViewRecyclerReact084 (upval), WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref)
				local IsNodeItemCountResultAbove: boolean = P9 ~= Value and (if FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.nodeFixedCount else WeightedOrderStatisticTreeModule.nodeMeasuredCount)(InsertUnitAtResult) < WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult)
				P9 = Value
				
				return IsNodeItemCountResultAbove
			end,
			getEstimatedItemLength = function()
				-- upvalues: P9 (ref)
				return P9
			end,
			getMeasuredItemCount = function()
				-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref)
				return WeightedOrderStatisticTreeModule.nodeMeasuredCount(InsertUnitAtResult)
			end,
			prefersIncremental = function(p6): boolean
				-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref)
				local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(InsertUnitAtResult)
				
				return NodeItemCountResult ~= 0 and p6 < NodeItemCountResult / math.log(NodeItemCountResult, 2)
			end,
			length = length,
			totalSum = function()
				-- upvalues: WeightedOrderStatisticTreeModule (upval), InsertUnitAtResult (ref), P9 (ref)
				return WeightedOrderStatisticTreeModule.nodeEffectiveSum(InsertUnitAtResult, P9)
			end
		}
	end
}