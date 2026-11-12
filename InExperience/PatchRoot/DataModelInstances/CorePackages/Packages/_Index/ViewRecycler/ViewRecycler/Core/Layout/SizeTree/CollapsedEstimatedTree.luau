local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
local _ = require(script.Parent.ISizeTree)
local WeightedOrderStatisticTreeModule = require(script.Parent.WeightedOrderStatisticTree)
local CollapsedEstimatedTreeModule = {}
local IsSameRun = if FFlagViewRecyclerReact084 then function(p1, p2): boolean
	return p1.measuredSize == nil and p2.measuredSize == nil and p1.estimatedSize == p2.estimatedSize
end else nil

local function concatenateMergingUnmeasured(p1, Node)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), FFlagViewRecyclerReact084 (copy), IsSameRun (ref)
	if p1 == nil then
		return Node
	elseif Node == nil then
		return p1
	else
		local PopMaximumResult, PopMaximumResult2 = WeightedOrderStatisticTreeModule.popMaximum(p1)
		local PopMinimumResult, PopMinimumResult2 = WeightedOrderStatisticTreeModule.popMinimum(Node)
		local IsSameRun1 = if FFlagViewRecyclerReact084 then IsSameRun(PopMaximumResult2, PopMinimumResult2) else PopMaximumResult2.measuredSize == nil and PopMinimumResult2.measuredSize == nil
		
		return if IsSameRun1 then WeightedOrderStatisticTreeModule.join(PopMaximumResult, if FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.newNode(PopMaximumResult2.itemCount + PopMinimumResult2.itemCount, nil, PopMaximumResult2.estimatedSize) else WeightedOrderStatisticTreeModule.newNode(PopMaximumResult2.itemCount + PopMinimumResult2.itemCount, nil), PopMinimumResult) else WeightedOrderStatisticTreeModule.concatenate(WeightedOrderStatisticTreeModule.join(PopMaximumResult, PopMaximumResult2, nil), WeightedOrderStatisticTreeModule.join(nil, PopMinimumResult2, PopMinimumResult))
	end
end

local concatenatePieces = nil
local growUnmeasuredRun = nil

if FFlagViewRecyclerReact084 then
	concatenatePieces = function(Left, p1: number, Node, ItemCountDelta: number, Right, EstimatedSize)
		-- upvalues: concatenateMergingUnmeasured (copy), WeightedOrderStatisticTreeModule (copy)
		local Left1 = Left
		
		if p1 > 0 then
			Left1 = concatenateMergingUnmeasured(Left1, WeightedOrderStatisticTreeModule.newNode(p1, nil, EstimatedSize))
		end
		local ConcatenateMergingUnmeasuredResult = concatenateMergingUnmeasured(Left1, Node)
		
		if ItemCountDelta > 0 then
			ConcatenateMergingUnmeasuredResult = concatenateMergingUnmeasured(ConcatenateMergingUnmeasuredResult, WeightedOrderStatisticTreeModule.newNode(ItemCountDelta, nil, EstimatedSize))
		end
		return (concatenateMergingUnmeasured(ConcatenateMergingUnmeasuredResult, Right))
	end
	
	growUnmeasuredRun = function(Balanced, p1, EstimatedSize)
		-- upvalues: WeightedOrderStatisticTreeModule (copy), growUnmeasuredRun (ref)
		if Balanced == nil then
			return nil, false
		end
		local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(Balanced.left)
		
		if p1 <= NodeItemCountResult then
			local GrowUnmeasuredRunResult2
			Balanced.left, GrowUnmeasuredRunResult2 = growUnmeasuredRun(Balanced.left, p1, EstimatedSize)
			
			if GrowUnmeasuredRunResult2 then
				WeightedOrderStatisticTreeModule.refresh(Balanced)
			end
			return Balanced, GrowUnmeasuredRunResult2
		elseif NodeItemCountResult + Balanced.itemCount < p1 then
			local GrowUnmeasuredRunResult2_1
			Balanced.right, GrowUnmeasuredRunResult2_1 = growUnmeasuredRun(Balanced.right, p1 - NodeItemCountResult - Balanced.itemCount, EstimatedSize)
			
			if GrowUnmeasuredRunResult2_1 then
				WeightedOrderStatisticTreeModule.refresh(Balanced)
			end
			return Balanced, GrowUnmeasuredRunResult2_1
		elseif Balanced.measuredSize == nil and Balanced.estimatedSize == EstimatedSize then
			Balanced.itemCount += 1
			WeightedOrderStatisticTreeModule.refresh(Balanced)
			
			return Balanced, true
		else
			return Balanced, false
		end
	end
else
	concatenatePieces = function(p1, p2: number, p3, p4: number, p5)
		-- upvalues: concatenateMergingUnmeasured (copy), WeightedOrderStatisticTreeModule (copy)
		local v1 = p1
		
		if p2 > 0 then
			v1 = concatenateMergingUnmeasured(v1, WeightedOrderStatisticTreeModule.newNode(p2, nil))
		end
		local ConcatenateMergingUnmeasuredResult = concatenateMergingUnmeasured(v1, p3)
		
		if p4 > 0 then
			ConcatenateMergingUnmeasuredResult = concatenateMergingUnmeasured(ConcatenateMergingUnmeasuredResult, WeightedOrderStatisticTreeModule.newNode(p4, nil))
		end
		return (concatenateMergingUnmeasured(ConcatenateMergingUnmeasuredResult, p5))
	end
	
	growUnmeasuredRun = function(p1, p2)
		-- upvalues: WeightedOrderStatisticTreeModule (copy), growUnmeasuredRun (ref)
		if p1 == nil then
			return nil, false
		end
		local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(p1.left)
		
		if p2 <= NodeItemCountResult then
			local GrowUnmeasuredRunResult2
			p1.left, GrowUnmeasuredRunResult2 = growUnmeasuredRun(p1.left, p2)
			
			if GrowUnmeasuredRunResult2 then
				WeightedOrderStatisticTreeModule.refresh(p1)
			end
			return p1, GrowUnmeasuredRunResult2
		elseif NodeItemCountResult + p1.itemCount < p2 then
			local GrowUnmeasuredRunResult2_1
			p1.right, GrowUnmeasuredRunResult2_1 = growUnmeasuredRun(p1.right, p2 - NodeItemCountResult - p1.itemCount)
			
			if GrowUnmeasuredRunResult2_1 then
				WeightedOrderStatisticTreeModule.refresh(p1)
			end
			return p1, GrowUnmeasuredRunResult2_1
		elseif p1.measuredSize == nil then
			p1.itemCount += 1
			WeightedOrderStatisticTreeModule.refresh(p1)
			
			return p1, true
		else
			return p1, false
		end
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
	-- upvalues: WeightedOrderStatisticTreeModule (copy), FFlagViewRecyclerReact084 (copy), IsSameRun (ref)
	if p1.measuredSize == nil then
		if p1.left ~= nil then
			local PopMaximumResult, PopMaximumResult2 = WeightedOrderStatisticTreeModule.popMaximum(p1.left)
			
			if if FFlagViewRecyclerReact084 then IsSameRun(p1, PopMaximumResult2) else PopMaximumResult2.measuredSize == nil then
				p1.itemCount += PopMaximumResult2.itemCount
				p1.left = PopMaximumResult
			else
				p1.left = WeightedOrderStatisticTreeModule.join(PopMaximumResult, PopMaximumResult2, nil)
			end
		end
		if p1.right ~= nil then
			local PopMinimumResult, PopMinimumResult2 = WeightedOrderStatisticTreeModule.popMinimum(p1.right)
			
			if if FFlagViewRecyclerReact084 then IsSameRun(p1, PopMinimumResult2) else PopMinimumResult2.measuredSize == nil then
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
	-- upvalues: WeightedOrderStatisticTreeModule (copy), measureAt (copy), mergeAdjacentUnmeasured (copy), FFlagViewRecyclerReact084 (copy), concatenatePieces (ref)
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
		
		return if FFlagViewRecyclerReact084 then concatenatePieces(Balanced.left, v1 - 1, WeightedOrderStatisticTreeModule.newNode(1, MeasuredSize, Balanced.estimatedSize), Balanced.itemCount - v1, Balanced.right, Balanced.estimatedSize) else concatenatePieces(Balanced.left, v1 - 1, WeightedOrderStatisticTreeModule.newNode(1, MeasuredSize), Balanced.itemCount - v1, Balanced.right)
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

local InsertMeasuredAt = nil
InsertMeasuredAt = if FFlagViewRecyclerReact084 then function(p1, p2, p3, p4)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), InsertMeasuredAt (ref), mergeAdjacentUnmeasured (copy), concatenatePieces (ref)
	if p1 == nil then
		return WeightedOrderStatisticTreeModule.newNode(1, p3, p4)
	end
	local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	
	if p2 <= NodeItemCountResult then
		p1.left = InsertMeasuredAt(p1.left, p2, p3, p4)
		
		return mergeAdjacentUnmeasured(p1)
	elseif NodeItemCountResult + p1.itemCount < p2 then
		p1.right = InsertMeasuredAt(p1.right, p2 - NodeItemCountResult - p1.itemCount, p3, p4)
		
		return mergeAdjacentUnmeasured(p1)
	elseif p1.measuredSize == nil then
		local v1 = p2 - NodeItemCountResult
		
		return concatenatePieces(p1.left, v1 - 1, WeightedOrderStatisticTreeModule.newNode(1, p3, p4), p1.itemCount - v1 + 1, p1.right, p1.estimatedSize)
	else
		local Left = p1.left
		local Right = p1.right
		p1.left = nil
		p1.right = nil
		WeightedOrderStatisticTreeModule.refresh(p1)
		
		return concatenatePieces(Left, 0, WeightedOrderStatisticTreeModule.newNode(1, p3, p4), 0, WeightedOrderStatisticTreeModule.concatenate(p1, Right))
	end
end else function(p1, p2, p3)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), InsertMeasuredAt (ref), mergeAdjacentUnmeasured (copy), concatenatePieces (ref)
	if p1 == nil then
		return WeightedOrderStatisticTreeModule.newNode(1, p3)
	end
	local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	
	if p2 <= NodeItemCountResult then
		p1.left = InsertMeasuredAt(p1.left, p2, p3)
		
		return mergeAdjacentUnmeasured(p1)
	elseif NodeItemCountResult + p1.itemCount < p2 then
		p1.right = InsertMeasuredAt(p1.right, p2 - NodeItemCountResult - p1.itemCount, p3)
		
		return mergeAdjacentUnmeasured(p1)
	elseif p1.measuredSize == nil then
		local v1 = p2 - NodeItemCountResult
		
		return concatenatePieces(p1.left, v1 - 1, WeightedOrderStatisticTreeModule.newNode(1, p3), p1.itemCount - v1 + 1, p1.right)
	else
		local Left = p1.left
		local Right = p1.right
		p1.left = nil
		p1.right = nil
		WeightedOrderStatisticTreeModule.refresh(p1)
		
		return concatenatePieces(Left, 0, WeightedOrderStatisticTreeModule.newNode(1, p3), 0, WeightedOrderStatisticTreeModule.concatenate(p1, Right))
	end
end

function CollapsedEstimatedTreeModule.new(p1)
	-- upvalues: WeightedOrderStatisticTreeModule (copy), FFlagViewRecyclerReact084 (copy), measureAt (copy), unmeasureAt (copy), growUnmeasuredRun (ref), concatenateMergingUnmeasured (copy), InsertMeasuredAt (ref), shrinkUnmeasuredRun (copy)
	local UpdateAtResult = nil
	local P35 = p1 or 0
	
	local function length()
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
		return WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
	end
	
	local function prefixSum(p2: number)
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P35 (ref)
		return if p2 <= 1 then 0 else WeightedOrderStatisticTreeModule.prefixSumUpTo(UpdateAtResult, p2 - 1, P35)
	end
	
	local function indexAtPrefixSum(p2: number)
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P35 (ref)
		local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
		
		return if NodeItemCountResult == 0 or p2 <= 0 then 1 elseif WeightedOrderStatisticTreeModule.nodeEffectiveSum(UpdateAtResult, P35) <= p2 then NodeItemCountResult + 1 else WeightedOrderStatisticTreeModule.entryAtPrefixSum(UpdateAtResult, p2, P35)
	end
	
	local function getEntryAtPrefixSum(p2: number)
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), FFlagViewRecyclerReact084 (upval), P35 (ref)
		local NodeItemCountResult: number = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
		
		if NodeItemCountResult == 0 then
			return 1, 0, 0
		elseif p2 > 0 then
			local NodeEffectiveSumResult = WeightedOrderStatisticTreeModule.nodeEffectiveSum(UpdateAtResult, P35)
			
			if NodeEffectiveSumResult <= p2 then
				return NodeItemCountResult + 1, NodeEffectiveSumResult, 0
			else
				return WeightedOrderStatisticTreeModule.entryAtPrefixSum(UpdateAtResult, p2, P35)
			end
		elseif FFlagViewRecyclerReact084 then
			return 1, 0, WeightedOrderStatisticTreeModule.unitSizeAt(UpdateAtResult, 1, P35)
		else
			return 1, 0, WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, 1) or P35
		end
	end
	
	local function getSize(p2: number)
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), FFlagViewRecyclerReact084 (upval), P35 (ref)
		return if p2 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult) < p2 then 0 elseif FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.unitSizeAt(UpdateAtResult, p2, P35) else WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, p2) or P35
	end
	
	local function fillRange(p2, p3, p4)
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P35 (ref)
		WeightedOrderStatisticTreeModule.fillRangeFromNode(UpdateAtResult, 0, 0, p2, p3, P35, p4)
		
		for i = #p4, p3 - p2 + 2, -1 do
			p4[i] = nil
		end
	end
	
	local function update(p5: number, MeasuredSize)
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
	end
	
	local Insert = nil
	Insert = if FFlagViewRecyclerReact084 then function(p5: number, p6, p7)
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), growUnmeasuredRun (upval), concatenateMergingUnmeasured (upval), InsertMeasuredAt (upval)
		local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
		
		if NodeItemCountResult == 0 then
			UpdateAtResult = WeightedOrderStatisticTreeModule.newNode(1, p6, p7)
			
			return
		end
		if p6 ~= nil then
			UpdateAtResult = InsertMeasuredAt(UpdateAtResult, p5, p6, p7)
			
			return
		end
		if p5 <= NodeItemCountResult then
			local GrowUnmeasuredRunResult2
			UpdateAtResult, GrowUnmeasuredRunResult2 = growUnmeasuredRun(UpdateAtResult, p5, p7)
			
			if GrowUnmeasuredRunResult2 then return end
		end
		if p5 > 1 then
			local GrowUnmeasuredRunResult2_1
			UpdateAtResult, GrowUnmeasuredRunResult2_1 = growUnmeasuredRun(UpdateAtResult, p5 - 1, p7)
			
			if GrowUnmeasuredRunResult2_1 then return end
		end
		local SplitByItemsResult, SplitByItemsResult2 = WeightedOrderStatisticTreeModule.splitByItems(UpdateAtResult, p5 - 1)
		UpdateAtResult = concatenateMergingUnmeasured(concatenateMergingUnmeasured(SplitByItemsResult, WeightedOrderStatisticTreeModule.newNode(1, nil, p7)), SplitByItemsResult2)
	end else function(p5: number, p6)
		-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), growUnmeasuredRun (upval), concatenateMergingUnmeasured (upval), InsertMeasuredAt (upval)
		local NodeItemCountResult = WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
		
		if NodeItemCountResult == 0 then
			UpdateAtResult = WeightedOrderStatisticTreeModule.newNode(1, p6)
			
			return
		end
		if p6 ~= nil then
			UpdateAtResult = InsertMeasuredAt(UpdateAtResult, p5, p6)
			
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
	end
	
	local function remove(p5: number)
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
	end
	
	local SetItemEstimate: ((number, any) -> boolean)? = nil
	
	if FFlagViewRecyclerReact084 then
		SetItemEstimate = function(p5: number, p6): boolean
			-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), FFlagViewRecyclerReact084 (upval), P35 (ref), remove (copy), Insert (ref)
			if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult) < p5 or WeightedOrderStatisticTreeModule.estimatedAt(UpdateAtResult, p5) == p6 then
				return false
			else
				local MeasuredAtResult = WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, p5)
				local UnitSizeAtResult = if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult) < p5 then 0 elseif FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.unitSizeAt(UpdateAtResult, p5, P35) else WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, p5) or P35
				remove(p5)
				Insert(p5, MeasuredAtResult, p6)
				
				return (if p5 < 1 or WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult) < p5 then 0 elseif FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.unitSizeAt(UpdateAtResult, p5, P35) else WeightedOrderStatisticTreeModule.measuredAt(UpdateAtResult, p5) or P35) ~= UnitSizeAtResult
			end
		end
		
		local function buildFromMeasurements(p5, Callback, Callback1)
			-- upvalues: UpdateAtResult (ref), WeightedOrderStatisticTreeModule (upval)
			local List = {}
			
			for i = 1, p5 do
				local CallbackResult = Callback(i)
				local CallbackResult1 = if Callback1 == nil then nil else Callback1(i)
				local Entry = List[#List]
				
				if CallbackResult == nil and Entry ~= nil and Entry.measuredSize == nil and Entry.estimatedSize == CallbackResult1 then
					Entry.itemCount += 1
				else
					table.insert(List, {
						itemCount = 1,
						measuredSize = CallbackResult,
						estimatedSize = CallbackResult1
					})
				end
			end
			UpdateAtResult = WeightedOrderStatisticTreeModule.buildBalanced(List, 1, #List)
		end
	else
		local function buildFromMeasurements(p6, Callback)
			-- upvalues: UpdateAtResult (ref), WeightedOrderStatisticTreeModule (upval)
			local List = {}
			
			for i = 1, p6 do
				local CallbackResult = Callback(i)
				local Entry = List[#List]
				
				if CallbackResult == nil and Entry ~= nil and Entry.measuredSize == nil then
					Entry.itemCount += 1
				else
					table.insert(List, { itemCount = 1, measuredSize = CallbackResult })
				end
			end
			UpdateAtResult = WeightedOrderStatisticTreeModule.buildBalanced(List, 1, #List)
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
		buildFromArray = function(List)
			-- upvalues: UpdateAtResult (ref), WeightedOrderStatisticTreeModule (upval)
			local Buffer = table.create(#List)
			
			for i, MeasuredSize in List do
				Buffer[i] = { itemCount = 1, measuredSize = MeasuredSize }
			end
			UpdateAtResult = WeightedOrderStatisticTreeModule.buildBalanced(Buffer, 1, #Buffer)
		end,
		buildFromMeasurements = buildFromMeasurements,
		toArray = function()
			-- upvalues: length (copy), WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P35 (ref)
			local Buffer = table.create(length())
			WeightedOrderStatisticTreeModule.appendToArray(UpdateAtResult, Buffer, P35)
			
			return Buffer
		end,
		setEstimatedItemLength = function(Value): boolean
			-- upvalues: P35 (ref), FFlagViewRecyclerReact084 (upval), WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
			local IsNodeItemCountResultAbove: boolean = P35 ~= Value and (if FFlagViewRecyclerReact084 then WeightedOrderStatisticTreeModule.nodeFixedCount else WeightedOrderStatisticTreeModule.nodeMeasuredCount)(UpdateAtResult) < WeightedOrderStatisticTreeModule.nodeItemCount(UpdateAtResult)
			P35 = Value
			
			return IsNodeItemCountResultAbove
		end,
		getEstimatedItemLength = function()
			-- upvalues: P35 (ref)
			return P35
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
			-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref), P35 (ref)
			return WeightedOrderStatisticTreeModule.nodeEffectiveSum(UpdateAtResult, P35)
		end,
		getNodeCount = function()
			-- upvalues: WeightedOrderStatisticTreeModule (upval), UpdateAtResult (ref)
			return WeightedOrderStatisticTreeModule.nodeCount(UpdateAtResult)
		end
	}
end

return CollapsedEstimatedTreeModule