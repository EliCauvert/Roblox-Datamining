local function _(p1)
	return if p1 == nil then 0 else p1.height
end

local _ = function(p1)
	return if p1 == nil then 0 else p1.subtreeMeasuredSum
end

local _ = function(Left, p1)
	return if Left.measuredSize == nil then Left.itemCount * p1 else Left.measuredSize
end

local function refresh(Left)
	assert(Left.itemCount >= 1, "WeightedOrderStatisticTree: node itemCount must be positive")
	assert(Left.measuredSize == nil or Left.itemCount == 1, "WeightedOrderStatisticTree: measured nodes must represent exactly one item")
	local Left1 = Left.left
	local NewItemCount = (if Left1 == nil then 0 else Left1.subtreeItemCount) + Left.itemCount
	local Right = Left.right
	Left.subtreeItemCount = NewItemCount + (if Right == nil then 0 else Right.subtreeItemCount)
	local Left2 = Left.left
	local v1 = (if Left2 == nil then 0 else Left2.subtreeMeasuredCount) + (if Left.measuredSize == nil then 0 else 1)
	local Right1 = Left.right
	Left.subtreeMeasuredCount = v1 + (if Right1 == nil then 0 else Right1.subtreeMeasuredCount)
	local Left3 = Left.left
	local v2 = (if Left3 == nil then 0 else Left3.subtreeMeasuredSum) + (Left.measuredSize or 0)
	local Right2 = Left.right
	Left.subtreeMeasuredSum = v2 + (if Right2 == nil then 0 else Right2.subtreeMeasuredSum)
	local Left4 = Left.left
	local v3 = (if Left4 == nil then 0 else Left4.subtreeNodeCount) + 1
	local Right3 = Left.right
	Left.subtreeNodeCount = v3 + (if Right3 == nil then 0 else Right3.subtreeNodeCount)
	local Left5 = Left.left
	local Right4 = Left.right
	Left.height = math.max(if Left5 == nil then 0 else Left5.height, if Right4 == nil then 0 else Right4.height) + 1
end

local _ = function(Right)
	-- upvalues: refresh (copy)
	local Left = Right.left
	Right.left = Left.right
	Left.right = Right
	refresh(Right)
	refresh(Left)
	
	return Left
end

local _ = function(Left)
	-- upvalues: refresh (copy)
	local Right = Left.right
	Left.right = Right.left
	Right.left = Left
	refresh(Left)
	refresh(Right)
	
	return Right
end

local function balance(Left)
	-- upvalues: refresh (copy)
	refresh(Left)
	local Left1 = Left.left
	local Right = Left.right
	local v1 = (if Left1 == nil then 0 else Left1.height) - (if Right == nil then 0 else Right.height)
	
	if v1 > 1 then
		local Left2 = Left.left
		local Left3 = Left2.left
		local Right1 = Left2.right
		
		if (if Left3 == nil then 0 else Left3.height) < (if Right1 == nil then 0 else Right1.height) then
			local Right2 = Left2.right
			Left2.right = Right2.left
			Right2.left = Left2
			refresh(Left2)
			refresh(Right2)
			Left.left = Right2
		end
		local Left4 = Left.left
		Left.left = Left4.right
		Left4.right = Left
		refresh(Left)
		refresh(Left4)
		
		return Left4
	else
		if v1 >= -1 then
			return Left
		end
		local Right3 = Left.right
		local Right1 = Right3.right
		local Left5 = Right3.left
		
		if (if Right1 == nil then 0 else Right1.height) < (if Left5 == nil then 0 else Left5.height) then
			local Left6 = Right3.left
			Right3.left = Left6.right
			Left6.right = Right3
			refresh(Right3)
			refresh(Left6)
			Left.right = Left6
		end
		local Right4 = Left.right
		Left.right = Right4.left
		Right4.left = Left
		refresh(Left)
		refresh(Right4)
		
		return Right4
	end
end

local function join(Left, Left1, Right)
	-- upvalues: join (copy), balance (copy)
	if (if Right == nil then 0 else Right.height) + 1 < (if Left == nil then 0 else Left.height) then
		Left.right = join(Left.right, Left1, Right)
		
		return (balance(Left))
	elseif (if Left == nil then 0 else Left.height) + 1 < (if Right == nil then 0 else Right.height) then
		Right.left = join(Left, Left1, Right.left)
		
		return (balance(Right))
	else
		Left1.left = Left
		Left1.right = Right
		
		return (balance(Left1))
	end
end

local function popMinimum(Left)
	-- upvalues: refresh (copy), popMinimum (copy), balance (copy)
	if Left.left == nil then
		local Right = Left.right
		Left.left = nil
		Left.right = nil
		refresh(Left)
		
		return Right, Left
	else
		local PopMinimumResult2
		Left.left, PopMinimumResult2 = popMinimum(Left.left)
		
		return balance(Left), PopMinimumResult2
	end
end

local function popMaximum(Left)
	-- upvalues: refresh (copy), popMaximum (copy), balance (copy)
	if Left.right == nil then
		local Left1 = Left.left
		Left.left = nil
		Left.right = nil
		refresh(Left)
		
		return Left1, Left
	else
		local PopMaximumResult2
		Left.right, PopMaximumResult2 = popMaximum(Left.right)
		
		return balance(Left), PopMaximumResult2
	end
end

local function splitByItems(Left, NewItemCount)
	-- upvalues: splitByItems (copy), balance (copy), refresh (copy), popMinimum (copy), join (copy)
	if Left == nil then
		return nil, nil
	end
	local Left1 = Left.left
	local SubtreeItemCount = if Left1 == nil then 0 else Left1.subtreeItemCount
	local NewSubtreeItemCount = SubtreeItemCount + Left.itemCount
	
	if NewItemCount < SubtreeItemCount then
		local SplitByItemsResult, SplitByItemsResult2 = splitByItems(Left.left, NewItemCount)
		Left.left = SplitByItemsResult2
		
		return SplitByItemsResult, (balance(Left))
	end
	if NewSubtreeItemCount < NewItemCount then
		local SplitByItemsResult2_1
		Left.right, SplitByItemsResult2_1 = splitByItems(Left.right, NewItemCount - NewSubtreeItemCount)
		
		return balance(Left), SplitByItemsResult2_1
	end
	if NewItemCount == SubtreeItemCount then
		local Left2 = Left.left
		local Right = Left.right
		Left.left = nil
		Left.right = nil
		refresh(Left)
		
		if Left == nil then
			return Left2, Right
		end
		if Right == nil then
			return Left2, Left
		end
		local Right2 = nil
		local Right3 = nil
		if Right.left == nil then
			local Right1 = Right.right
			Right.left = nil
			Right.right = nil
			refresh(Right)
			Right2 = Right1
			Right3 = Right
		else
			local PopMinimumResult2
			Right.left, PopMinimumResult2 = popMinimum(Right.left)
			Right2 = balance(Right)
			Right3 = PopMinimumResult2
		end
		return Left2, (join(Left, Right3, Right2))
	elseif NewItemCount == NewSubtreeItemCount then
		local Left3 = Left.left
		local Right = Left.right
		Left.left = nil
		Left.right = nil
		refresh(Left)
		local Left5 = nil
		
		if Left3 == nil then
			Left5 = Left
		elseif Left == nil then
			Left5 = Left3
		else
			local Right4 = nil
			local Left6 = nil
			if Left.left == nil then
				local Right5 = Left.right
				Left.left = nil
				Left.right = nil
				refresh(Left)
				Right4 = Right5
				Left6 = Left
			else
				local PopMinimumResult2_1
				Left.left, PopMinimumResult2_1 = popMinimum(Left.left)
				Right4 = balance(Left)
				Left6 = PopMinimumResult2_1
			end
			Left5 = join(Left3, Left6, Right4)
		end
		return Left5, Right
	else
		assert(Left.measuredSize == nil, "WeightedOrderStatisticTree: cannot split a measured node")
		local NewItemCountDelta = NewItemCount - SubtreeItemCount
		local ItemCountDelta = Left.itemCount - NewItemCountDelta
		local Left4 = Left.left
		local config = {
			measuredSize = nil,
			subtreeMeasuredCount = 0,
			subtreeMeasuredSum = 0,
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			itemCount = NewItemCountDelta,
			subtreeItemCount = NewItemCountDelta
		}
		refresh(config)
		local config1 = nil
		
		if Left4 == nil then
			config1 = config
		elseif config == nil then
			config1 = Left4
		else
			local config3 = nil
			local Right6 = nil
			if config.left == nil then
				local Right5 = config.right
				config.left = nil
				config.right = nil
				refresh(config)
				Right6 = Right5
				config3 = config
			else
				local PopMinimumResult2_3
				config.left, PopMinimumResult2_3 = popMinimum(config.left)
				Right6 = balance(config)
				config3 = PopMinimumResult2_3
			end
			config1 = join(Left4, config3, Right6)
		end
		local config2 = {
			measuredSize = nil,
			subtreeMeasuredCount = 0,
			subtreeMeasuredSum = 0,
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			itemCount = ItemCountDelta,
			subtreeItemCount = ItemCountDelta
		}
		refresh(config2)
		local Right = Left.right
		
		if config2 == nil then
			return config1, Right
		end
		if Right == nil then
			return config1, config2
		end
		local PopMinimumResult = nil
		local BalanceResult = nil
		if Right.left == nil then
			local Right7 = Right.right
			Right.left = nil
			Right.right = nil
			refresh(Right)
			BalanceResult = Right7
			PopMinimumResult = Right
		else
			local PopMinimumResult2_2
			Right.left, PopMinimumResult2_2 = popMinimum(Right.left)
			BalanceResult = balance(Right)
			PopMinimumResult = PopMinimumResult2_2
		end
		return config1, (join(config2, PopMinimumResult, BalanceResult))
	end
end

local function insertUnitAt(Left, p1: number, MeasuredSize)
	-- upvalues: refresh (copy), insertUnitAt (copy), balance (copy)
	if Left == nil then
		local config = {
			itemCount = 1,
			subtreeItemCount = 1,
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			measuredSize = MeasuredSize,
			subtreeMeasuredCount = if MeasuredSize == nil then 0 else 1,
			subtreeMeasuredSum = MeasuredSize or 0
		}
		refresh(config)
		
		return config
	end
	local Left1 = Left.left
	local v1 = (if Left1 == nil then 0 else Left1.subtreeItemCount) + 1
	
	if p1 <= v1 then
		Left.left = insertUnitAt(Left.left, p1, MeasuredSize)
	else
		Left.right = insertUnitAt(Left.right, p1 - v1, MeasuredSize)
	end
	return (balance(Left))
end

local function findMin(Left)
	-- upvalues: findMin (copy)
	return if Left.left == nil then Left else findMin(Left.left)
end

local function removeUnitAt(Left, p1: number)
	-- upvalues: removeUnitAt (copy), findMin (copy), balance (copy)
	if Left == nil then
		return nil
	end
	local Left1 = Left.left
	local v1 = (if Left1 == nil then 0 else Left1.subtreeItemCount) + 1
	
	if p1 < v1 then
		Left.left = removeUnitAt(Left.left, p1)
	elseif v1 < p1 then
		Left.right = removeUnitAt(Left.right, p1 - v1)
	else
		if Left.left == nil then
			return Left.right
		end
		if Left.right == nil then
			return Left.left
		end
		local Right = Left.right
		local Right1 = if Right.left == nil then Right else findMin(Right.left)
		Left.measuredSize = Right1.measuredSize
		Left.itemCount = Right1.itemCount
		Left.right = removeUnitAt(Left.right, 1)
	end
	return (balance(Left))
end

local function updateUnitAt(Left, p1: number, MeasuredSize)
	-- upvalues: updateUnitAt (copy), refresh (copy)
	if Left == nil then return end
	local Left1 = Left.left
	local v1 = (if Left1 == nil then 0 else Left1.subtreeItemCount) + 1
	
	if p1 < v1 then
		updateUnitAt(Left.left, p1, MeasuredSize)
	elseif v1 < p1 then
		updateUnitAt(Left.right, p1 - v1, MeasuredSize)
	else
		Left.measuredSize = MeasuredSize
	end
	refresh(Left)
end

local function updateAt(Left, p1, MeasuredSize)
	-- upvalues: updateAt (copy), refresh (copy)
	if Left == nil then
		return nil
	end
	local Left1 = Left.left
	local SubtreeItemCount = if Left1 == nil then 0 else Left1.subtreeItemCount
	
	if p1 <= SubtreeItemCount then
		Left.left = updateAt(Left.left, p1, MeasuredSize)
	elseif SubtreeItemCount + Left.itemCount < p1 then
		Left.right = updateAt(Left.right, p1 - SubtreeItemCount - Left.itemCount, MeasuredSize)
	else
		assert(Left.itemCount == 1, "WeightedOrderStatisticTree: in-place update requires a unit node")
		Left.measuredSize = MeasuredSize
	end
	refresh(Left)
	
	return Left
end

local function measuredAt(Left, p1)
	-- upvalues: measuredAt (copy)
	if Left == nil then
		return nil
	else
		local Left1 = Left.left
		local SubtreeItemCount = if Left1 == nil then 0 else Left1.subtreeItemCount
		
		return if p1 <= SubtreeItemCount then measuredAt(Left.left, p1) elseif SubtreeItemCount + Left.itemCount < p1 then measuredAt(Left.right, p1 - SubtreeItemCount - Left.itemCount) else Left.measuredSize
	end
end

local function prefixSumUpTo(Left, p1: number, p2)
	-- upvalues: prefixSumUpTo (copy)
	if Left == nil or p1 <= 0 then
		return 0
	end
	local Left1 = Left.left
	local SubtreeItemCount = if Left1 == nil then 0 else Left1.subtreeItemCount
	
	if p1 <= SubtreeItemCount then
		return prefixSumUpTo(Left.left, p1, p2)
	else
		local Smallest = math.min(Left.itemCount, p1 - SubtreeItemCount)
		local Left2 = Left.left
		local v1 = (if Left2 == nil then 0 else Left2.subtreeMeasuredSum + (Left2.subtreeItemCount - Left2.subtreeMeasuredCount) * p2) + (if Left.measuredSize == nil then Smallest * p2 else Left.measuredSize)
		
		return if p1 <= SubtreeItemCount + Left.itemCount then v1 else v1 + prefixSumUpTo(Left.right, p1 - SubtreeItemCount - Left.itemCount, p2)
	end
end

local function entryAtPrefixSum(Left, p1, p2)
	-- upvalues: entryAtPrefixSum (copy)
	if Left == nil then
		return 0, 0, 0
	end
	local Left1 = Left.left
	local NewSubtreeMeasuredSum = if Left1 == nil then 0 else Left1.subtreeMeasuredSum + (Left1.subtreeItemCount - Left1.subtreeMeasuredCount) * p2
	
	if p1 < NewSubtreeMeasuredSum then
		return entryAtPrefixSum(Left.left, p1, p2)
	end
	local Left2 = Left.left
	local SubtreeItemCount = if Left2 == nil then 0 else Left2.subtreeItemCount
	local ScaledItemCount = if Left.measuredSize == nil then Left.itemCount * p2 else Left.measuredSize
	
	if p1 >= NewSubtreeMeasuredSum + ScaledItemCount then
		local EntryAtPrefixSumResult, EntryAtPrefixSumResult2, EntryAtPrefixSumResult3 = entryAtPrefixSum(Left.right, p1 - NewSubtreeMeasuredSum - ScaledItemCount, p2)
		
		if EntryAtPrefixSumResult == 0 then
			return 0, 0, 0
		else
			return SubtreeItemCount + Left.itemCount + EntryAtPrefixSumResult, NewSubtreeMeasuredSum + ScaledItemCount + EntryAtPrefixSumResult2, EntryAtPrefixSumResult3
		end
	elseif Left.measuredSize == nil then
		local Floored = math.floor((p1 - NewSubtreeMeasuredSum) / p2)
		
		return SubtreeItemCount + Floored + 1, NewSubtreeMeasuredSum + Floored * p2, p2
	else
		return SubtreeItemCount + 1, NewSubtreeMeasuredSum, Left.measuredSize
	end
end

local function fillRangeFromNode(Left, ItemCountDelta, p1, p2: number, p3: number, p4, p5)
	-- upvalues: fillRangeFromNode (copy)
	if Left == nil then return end
	local Left1 = Left.left
	local NewItemCountDelta = ItemCountDelta + (if Left1 == nil then 0 else Left1.subtreeItemCount) + 1
	local NewItemCountDeltaDelta = NewItemCountDelta + Left.itemCount - 1
	local Left2 = Left.left
	local v1 = p1 + (if Left2 == nil then 0 else Left2.subtreeMeasuredSum + (Left2.subtreeItemCount - Left2.subtreeMeasuredCount) * p4)
	
	if p2 < NewItemCountDelta then
		fillRangeFromNode(Left.left, ItemCountDelta, p1, p2, p3, p4, p5)
	end
	local Largest = math.max(p2, NewItemCountDelta)
	local Smallest = math.min(p3, NewItemCountDeltaDelta)
	
	if Largest <= Smallest then
		local MeasuredSize = Left.measuredSize or p4
		
		for i = Largest, Smallest do
			local NewI = i - p2 + 1
			local v2 = p5[NewI]
			
			if v2 == nil then
				v2 = { startOffset = 0, length = 0 }
				p5[NewI] = v2
			end
			v2.startOffset = v1 + (i - NewItemCountDelta) * MeasuredSize
			v2.length = MeasuredSize
		end
	end
	if NewItemCountDeltaDelta < p3 then
		fillRangeFromNode(Left.right, NewItemCountDeltaDelta, v1 + (if Left.measuredSize == nil then Left.itemCount * p4 else Left.measuredSize), p2, p3, p4, p5)
	end
end

local function buildBalanced(p6, p7, p8)
	-- upvalues: refresh (copy), buildBalanced (copy)
	if p8 < p7 then
		return nil
	else
		local v3 = (p7 + p8) // 2
		local Left = p6[v3]
		local ItemCount = Left.itemCount
		local MeasuredSize = Left.measuredSize
		local config = {
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			itemCount = ItemCount,
			measuredSize = MeasuredSize,
			subtreeItemCount = ItemCount,
			subtreeMeasuredCount = if MeasuredSize == nil then 0 else 1,
			subtreeMeasuredSum = MeasuredSize or 0
		}
		refresh(config)
		config.left = buildBalanced(p6, p7, v3 - 1)
		config.right = buildBalanced(p6, v3 + 1, p8)
		refresh(config)
		
		return config
	end
end

local function appendToArray(Left, List, p6)
	-- upvalues: appendToArray (copy)
	if Left == nil then return end
	appendToArray(Left.left, List, p6)
	local MeasuredSize = Left.measuredSize or p6
	
	for _ = 1, Left.itemCount do
		table.insert(List, MeasuredSize)
	end
	appendToArray(Left.right, List, p6)
end

return {
	newNode = function(ItemCount, MeasuredSize)
		-- upvalues: refresh (copy)
		local config = {
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			itemCount = ItemCount,
			measuredSize = MeasuredSize,
			subtreeItemCount = ItemCount,
			subtreeMeasuredCount = if MeasuredSize == nil then 0 else 1,
			subtreeMeasuredSum = MeasuredSize or 0
		}
		refresh(config)
		
		return config
	end,
	refresh = refresh,
	balance = balance,
	join = join,
	popMinimum = popMinimum,
	popMaximum = popMaximum,
	concatenate = function(Left, Left1)
		-- upvalues: refresh (copy), popMinimum (copy), balance (copy), join (copy)
		if Left == nil then
			return Left1
		end
		if Left1 == nil then
			return Left
		end
		local Right1 = nil
		local Left2 = nil
		if Left1.left == nil then
			local Right = Left1.right
			Left1.left = nil
			Left1.right = nil
			refresh(Left1)
			Right1 = Right
			Left2 = Left1
		else
			local PopMinimumResult2
			Left1.left, PopMinimumResult2 = popMinimum(Left1.left)
			Right1 = balance(Left1)
			Left2 = PopMinimumResult2
		end
		return (join(Left, Left2, Right1))
	end,
	splitByItems = splitByItems,
	insertUnitAt = insertUnitAt,
	removeUnitAt = removeUnitAt,
	updateUnitAt = updateUnitAt,
	updateAt = updateAt,
	measuredAt = measuredAt,
	prefixSumUpTo = prefixSumUpTo,
	entryAtPrefixSum = entryAtPrefixSum,
	fillRangeFromNode = fillRangeFromNode,
	buildBalanced = buildBalanced,
	appendToArray = appendToArray,
	nodeItemCount = function(p7)
		return if p7 == nil then 0 else p7.subtreeItemCount
	end,
	nodeMeasuredCount = function(p7)
		return if p7 == nil then 0 else p7.subtreeMeasuredCount
	end,
	nodeCount = function(p7)
		return if p7 == nil then 0 else p7.subtreeNodeCount
	end,
	nodeEffectiveSum = function(Left, p7)
		return if Left == nil then 0 else Left.subtreeMeasuredSum + (Left.subtreeItemCount - Left.subtreeMeasuredCount) * p7
	end
}