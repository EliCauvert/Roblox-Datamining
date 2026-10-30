local _ = require(script.Parent.ISizeTree)
local WeightedOrderStatisticTreeModule = require(script.Parent.WeightedOrderStatisticTree)

local function concatenateMergingUnmeasured(Left, Node)
	-- upvalues: WeightedOrderStatisticTreeModule (copy)
	if Left == nil then
		return Node
	elseif Node == nil then
		return Left
	else
		local PopMaximumResult, PopMaximumResult2 = WeightedOrderStatisticTreeModule.popMaximum(Left)
		local PopMinimumResult, PopMinimumResult2 = WeightedOrderStatisticTreeModule.popMinimum(Node)
		
		return if PopMaximumResult2.measuredSize == nil and PopMinimumResult2.measuredSize == nil then WeightedOrderStatisticTreeModule.join(PopMaximumResult, WeightedOrderStatisticTreeModule.newNode(PopMaximumResult2.itemCount + PopMinimumResult2.itemCount, nil), PopMinimumResult) else WeightedOrderStatisticTreeModule.concatenate(WeightedOrderStatisticTreeModule.join(PopMaximumResult, PopMaximumResult2, nil), WeightedOrderStatisticTreeModule.join(nil, PopMinimumResult2, PopMinimumResult))
	end
end

local function concatenatePieces(Left, p1: number, Node, ItemCountDelta: number, Right)
	-- upvalues: concatenateMergingUnmeasured (copy), WeightedOrderStatisticTreeModule (copy)
	local Left1 = Left
	
	if p1 > 0 then
		Left1 = concatenateMergingUnmeasured(Left1, WeightedOrderStatisticTreeModule.newNode(p1, nil))
	end
	local ConcatenateMergingUnmeasuredResult = concatenateMergingUnmeasured(Left1, Node)
	
	if ItemCountDelta > 0 then
		ConcatenateMergingUnmeasuredResult = concatenateMergingUnmeasured(ConcatenateMergingUnmeasuredResult, WeightedOrderStatisticTreeModule.newNode(ItemCountDelta, nil))
	end
	return (concatenateMergingUnmeasured(ConcatenateMergingUnmeasuredResult, Right))
end

local function growUnmeasuredRun(Balanced, p1)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), growUnmeasuredRun (copy)
	if Balanced == nil then
		return nil, false
	end
	local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
	
	if p1 <= NodeItemCountResult then
		local GrowUnmeasuredRunResult2
		Balanced.left, GrowUnmeasuredRunResult2 = growUnmeasuredRun(Balanced.left, p1)
		
		if GrowUnmeasuredRunResult2 then
			WeightedOrderStatisticTreeModule.refresh(Balanced)
		end
		return Balanced, GrowUnmeasuredRunResult2
	elseif NodeItemCountResult + Balanced.itemCount < p1 then
		local GrowUnmeasuredRunResult2_1
		Balanced.right, GrowUnmeasuredRunResult2_1 = growUnmeasuredRun(Balanced.right, p1 - NodeItemCountResult - Balanced.itemCount)
		
		if GrowUnmeasuredRunResult2_1 then
			WeightedOrderStatisticTreeModule.refresh(Balanced)
		end
		return Balanced, GrowUnmeasuredRunResult2_1
	elseif Balanced.measuredSize == nil then
		Balanced.itemCount += 1
		WeightedOrderStatisticTreeModule.refresh(Balanced)
		
		return Balanced, true
	else
		return Balanced, false
	end
end

local function shrinkUnmeasuredRun(Balanced, p1)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), shrinkUnmeasuredRun (copy)
	if Balanced == nil then
		return nil, false
	end
	local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
	
	if p1 <= NodeItemCountResult then
		local ShrinkUnmeasuredRunResult2
		Balanced.left, ShrinkUnmeasuredRunResult2 = shrinkUnmeasuredRun(Balanced.left, p1)
		
		if ShrinkUnmeasuredRunResult2 then
			WeightedOrderStatisticTreeModule.refresh(Balanced)
		end
		return Balanced, ShrinkUnmeasuredRunResult2
	elseif NodeItemCountResult + Balanced.itemCount < p1 then
		local ShrinkUnmeasuredRunResult2_1
		Balanced.right, ShrinkUnmeasuredRunResult2_1 = shrinkUnmeasuredRun(Balanced.right, p1 - NodeItemCountResult - Balanced.itemCount)
		
		if ShrinkUnmeasuredRunResult2_1 then
			WeightedOrderStatisticTreeModule.refresh(Balanced)
		end
		return Balanced, ShrinkUnmeasuredRunResult2_1
	elseif Balanced.measuredSize == nil and Balanced.itemCount > 1 then
		Balanced.itemCount -= 1
		WeightedOrderStatisticTreeModule.refresh(Balanced)
		
		return Balanced, true
	else
		return Balanced, false
	end
end

local function mergeAdjacentUnmeasured(p1)
	-- upvalues: WeightedOrderStatisticTreeModule (copy)
	if p1.measuredSize == nil then
		if p1.left ~= nil then
			local PopMaximumResult, PopMaximumResult2 = WeightedOrderStatisticTreeModule.popMaximum(p1.left)
			
			if PopMaximumResult2.measuredSize == nil then
				p1.itemCount += PopMaximumResult2.itemCount
				p1.left = PopMaximumResult
			else
				p1.left = WeightedOrderStatisticTreeModule.join(PopMaximumResult, PopMaximumResult2, nil)
			end
		end
		if p1.right ~= nil then
			local PopMinimumResult, PopMinimumResult2 = WeightedOrderStatisticTreeModule.popMinimum(p1.right)
			
			if PopMinimumResult2.measuredSize == nil then
				p1.itemCount += PopMinimumResult2.itemCount
				p1.right = PopMinimumResult
			else
				p1.right = WeightedOrderStatisticTreeModule.join(nil, PopMinimumResult2, PopMinimumResult)
			end
		end
	end
	return WeightedOrderStatisticTreeModule.balance(p1)
end

local function measureAt(Balanced, p1, MeasuredSize)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), measureAt (copy), mergeAdjacentUnmeasured (copy), concatenatePieces (copy)
	if Balanced == nil then
		return nil
	end
	local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
	
	if p1 <= NodeItemCountResult then
		Balanced.left = measureAt(Balanced.left, p1, MeasuredSize)
		
		return mergeAdjacentUnmeasured(Balanced)
	elseif NodeItemCountResult + Balanced.itemCount < p1 then
		Balanced.right = measureAt(Balanced.right, p1 - NodeItemCountResult - Balanced.itemCount, MeasuredSize)
		
		return mergeAdjacentUnmeasured(Balanced)
	elseif Balanced.itemCount == 1 then
		Balanced.measuredSize = MeasuredSize
		
		return mergeAdjacentUnmeasured(Balanced)
	else
		local v1 = p1 - NodeItemCountResult
		
		return (concatenatePieces(Balanced.left, v1 - 1, WeightedOrderStatisticTreeModule.newNode(1, MeasuredSize), Balanced.itemCount - v1, Balanced.right))
	end
end

local function unmeasureAt(Balanced, p1)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), unmeasureAt (copy), mergeAdjacentUnmeasured (copy)
	if Balanced == nil then
		return nil
	end
	local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
	
	if p1 <= NodeItemCountResult then
		Balanced.left = unmeasureAt(Balanced.left, p1)
	elseif NodeItemCountResult + Balanced.itemCount < p1 then
		Balanced.right = unmeasureAt(Balanced.right, p1 - NodeItemCountResult - Balanced.itemCount)
	else
		assert(Balanced.itemCount == 1, "CollapsedEstimatedTree: unmeasure requires a unit node")
		Balanced.measuredSize = nil
	end
	return mergeAdjacentUnmeasured(Balanced)
end

local function insertMeasuredAt(Balanced, p1, p2)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), insertMeasuredAt (copy), mergeAdjacentUnmeasured (copy), concatenateMergingUnmeasured (copy), concatenatePieces (copy)
	if Balanced == nil then
		return WeightedOrderStatisticTreeModule.newNode(1, p2)
	end
	local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
	
	if p1 <= NodeItemCountResult then
		Balanced.left = insertMeasuredAt(Balanced.left, p1, p2)
		
		return mergeAdjacentUnmeasured(Balanced)
	elseif NodeItemCountResult + Balanced.itemCount < p1 then
		Balanced.right = insertMeasuredAt(Balanced.right, p1 - NodeItemCountResult - Balanced.itemCount, p2)
		
		return mergeAdjacentUnmeasured(Balanced)
	elseif Balanced.measuredSize == nil then
		local v1 = p1 - NodeItemCountResult
		
		return (concatenatePieces(Balanced.left, v1 - 1, WeightedOrderStatisticTreeModule.newNode(1, p2), Balanced.itemCount - v1 + 1, Balanced.right))
	else
		local Left = Balanced.left
		local Right = Balanced.right
		Balanced.left = nil
		Balanced.right = nil
		WeightedOrderStatisticTreeModule.refresh(Balanced)
		
		return (concatenateMergingUnmeasured(concatenateMergingUnmeasured(Left, (WeightedOrderStatisticTreeModule.newNode(1, p2))), (WeightedOrderStatisticTreeModule.concatenate(Balanced, Right))))
	end
end

return {
	new = function(p1)
		-- upvalues: WeightedOrderStatisticTreeModule (copy), measureAt (copy), unmeasureAt (copy), growUnmeasuredRun (copy), concatenateMergingUnmeasured (copy), insertMeasuredAt (copy), shrinkUnmeasuredRun (copy)
		local UpdateAtResult = nil
		local P20 = p1 or 0
		
		local function length()
			-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
			return WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
		end
		
		return {
			prefixSum = function(p2: number)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P20 (ref)
				return if p2 <= 1 then 0 else WeightedOrderStatisticTreeModule.prefixSumUpTo(UpdateAtResult, p2 - 1, P20)
			end,
			indexAtPrefixSum = function(p2: number)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P20 (ref)
				local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
				
				return if NodeItemCountResult == 0 or p2 <= 0 then 1 elseif WeightedOrderStatisticTreeModule.nodeEffectiveSum(UpdateAtResult, P20) <= p2 then NodeItemCountResult + 1 else WeightedOrderStatisticTreeModule.entryAtPrefixSum(UpdateAtResult, p2, P20)
			end,
			entryAtPrefixSum = function(Balanced: number)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P20 (ref)
				local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
				
				if NodeItemCountResult == 0 then
					return 1, 0, 0
				elseif Balanced <= 0 then
					return 1, 0, WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, 1) or P20
				else
					local NodeEffectiveSumResult = WeightedOrderStatisticTreeModule.nodeEffectiveSum(UpdateAtResult, P20)
					
					if NodeEffectiveSumResult <= Balanced then
						return NodeItemCountResult + 1, NodeEffectiveSumResult, 0
					else
						return WeightedOrderStatisticTreeModule.entryAtPrefixSum(UpdateAtResult, Balanced, P20)
					end
				end
			end,
			getSize = function(p2: number)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P20 (ref)
				return if p2 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult) < p2 then 0 else WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, p2) or P20
			end,
			fillRange = function(p2, p3, p4)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P20 (ref)
				WeightedOrderStatisticTreeModule.fillRangeFromNode(UpdateAtResult, 0, 0, p2, p3, P20, p4)
				
				for i = #p4, p3 - p2 + 2, -1 do
					p4[i] = nil
				end
			end,
			update = function(p5: number, MeasuredSize)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), measureAt (upval), unmeasureAt (upval)
				if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult) < p5 then return end
				local MeasuredAtResult = WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, p5)
				
				if MeasuredAtResult ~= nil and MeasuredSize ~= nil then
					UpdateAtResult = WeightedOrderStatisticTreeModule.updateAt(UpdateAtResult, p5, MeasuredSize)
					
					return
				end
				if MeasuredAtResult == nil and MeasuredSize ~= nil then
					UpdateAtResult = measureAt(UpdateAtResult, p5, MeasuredSize)
					
					return
				end
				if MeasuredAtResult ~= nil and MeasuredSize == nil then
					UpdateAtResult = unmeasureAt(UpdateAtResult, p5)
				end
			end,
			insert = function(p5: number, p6)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), growUnmeasuredRun (upval), concatenateMergingUnmeasured (upval), insertMeasuredAt (upval)
				local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
				
				if NodeItemCountResult == 0 then
					UpdateAtResult = WeightedOrderStatisticTreeModule.newNode(1, p6)
					
					return
				end
				if p6 ~= nil then
					UpdateAtResult = insertMeasuredAt(UpdateAtResult, p5, p6)
					
					return
				end
				if p5 <= NodeItemCountResult then
					local GrowUnmeasuredRunResult2
					UpdateAtResult, GrowUnmeasuredRunResult2 = growUnmeasuredRun(UpdateAtResult, p5)
					
					if GrowUnmeasuredRunResult2 then return end
				end
				if p5 > 1 then
					local GrowUnmeasuredRunResult2_1
					UpdateAtResult, GrowUnmeasuredRunResult2_1 = growUnmeasuredRun(UpdateAtResult, p5 - 1)
					
					if GrowUnmeasuredRunResult2_1 then return end
				end
				local SplitByItemsResult, SplitByItemsResult2 = WeightedOrderStatisticTreeModule.splitByItems(UpdateAtResult, p5 - 1)
				UpdateAtResult = concatenateMergingUnmeasured(concatenateMergingUnmeasured(SplitByItemsResult, WeightedOrderStatisticTreeModule.newNode(1, nil)), SplitByItemsResult2)
			end,
			remove = function(p5: number)
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), shrinkUnmeasuredRun (upval), concatenateMergingUnmeasured (upval)
				if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult) < p5 then return end
				local ShrinkUnmeasuredRunResult2
				UpdateAtResult, ShrinkUnmeasuredRunResult2 = shrinkUnmeasuredRun(UpdateAtResult, p5)
				
				if not ShrinkUnmeasuredRunResult2 then
					local SplitByItemsResult, SplitByItemsResult2 = WeightedOrderStatisticTreeModule.splitByItems(UpdateAtResult, p5 - 1)
					local _, SplitByItemsResult2_1 = WeightedOrderStatisticTreeModule.splitByItems(SplitByItemsResult2, 1)
					UpdateAtResult = concatenateMergingUnmeasured(SplitByItemsResult, SplitByItemsResult2_1)
					
					return
				end
			end,
			buildFromArray = function(List)
				-- upvalues: UpdateAtResult (ref), WeightedOrderStatisticTreeModule (upval)
				local Buffer = table.create(#List)
				
				for i, MeasuredSize in List do
					Buffer[i] = { itemCount = 1, measuredSize = MeasuredSize }
				end
				UpdateAtResult = WeightedOrderStatisticTreeModule.buildBalanced(Buffer, 1, #Buffer)
			end,
			buildFromMeasurements = function(p5, Callback)
				-- upvalues: UpdateAtResult (ref), WeightedOrderStatisticTreeModule (upval)
				local List = {}
				
				for i = 1, p5 do
					local CallbackResult = Callback(i)
					local Entry = List[#List]
					
					if CallbackResult == nil and Entry ~= nil and Entry.measuredSize == nil then
						Entry.itemCount += 1
					else
						table.insert(List, { itemCount = 1, measuredSize = CallbackResult })
					end
				end
				UpdateAtResult = WeightedOrderStatisticTreeModule.buildBalanced(List, 1, #List)
			end,
			toArray = function()
				-- upvalues: length (copy), WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P20 (ref)
				local Buffer = table.create(length())
				WeightedOrderStatisticTreeModule.appendToArray(UpdateAtResult, Buffer, P20)
				
				return Buffer
			end,
			setEstimatedItemLength = function(Value): boolean
				-- upvalues: P20 (ref), WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
				local IsNodeMeasuredCountResultBelow: boolean = P20 ~= Value and WeightedOrderStatisticTreeModule.nodeMeasuredCount(UpdateAtResult) < WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
				P20 = Value
				
				return IsNodeMeasuredCountResultBelow
			end,
			getEstimatedItemLength = function()
				-- upvalues: P20 (ref)
				return P20
			end,
			getMeasuredItemCount = function()
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
				return WeightedOrderStatisticTreeModule.nodeMeasuredCount(UpdateAtResult)
			end,
			prefersIncremental = function(p6): boolean
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
				local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
				
				return NodeItemCountResult ~= 0 and p6 * math.log(math.max(WeightedOrderStatisticTreeModule.nodeCount(UpdateAtResult), 2), 2) < NodeItemCountResult
			end,
			length = length,
			totalSum = function()
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P20 (ref)
				return WeightedOrderStatisticTreeModule.nodeEffectiveSum(UpdateAtResult, P20)
			end,
			getNodeCount = function()
				-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
				return WeightedOrderStatisticTreeModule.nodeCount(UpdateAtResult)
			end
		}
	end
}