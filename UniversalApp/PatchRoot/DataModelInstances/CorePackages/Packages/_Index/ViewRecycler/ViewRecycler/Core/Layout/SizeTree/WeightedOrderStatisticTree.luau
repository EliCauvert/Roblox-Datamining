local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
local WeightedOrderStatisticTreeModule = {}

local function _(p1)
	return if p1 == nil then 0 else p1.height
end

local function nodeItemCount(p1)
	return if p1 == nil then 0 else p1.subtreeItemCount
end

local function nodeMeasuredCount(p1)
	return if p1 == nil then 0 else p1.subtreeMeasuredCount
end

local NodeFixedCount: ((any) -> any)? = nil
local Callback: ((any) -> any)? = nil

if FFlagViewRecyclerReact084 then
	NodeFixedCount = function(p1)
		return if p1 == nil then 0 else p1.subtreeFixedCount
	end
else
	Callback = function(Left)
		return if Left == nil then 0 else Left.subtreeMeasuredSum
	end
end
local function nodeCount(p1)
	return if p1 == nil then 0 else p1.subtreeNodeCount
end

local function nodeEffectiveSum(p1, p2)
	-- upvalues: FFlagViewRecyclerReact084 (copy)
	return if p1 == nil then 0 else (if FFlagViewRecyclerReact084 then p1.subtreeFixedSum else p1.subtreeMeasuredSum) + (p1.subtreeItemCount - (if FFlagViewRecyclerReact084 then p1.subtreeFixedCount else p1.subtreeMeasuredCount)) * p2
end

local UnitSize = if FFlagViewRecyclerReact084 then function(p1, p2)
	return p1.measuredSize or (p1.estimatedSize or p2)
end else nil

local _ = function(p1, p2)
	-- upvalues: FFlagViewRecyclerReact084 (copy)
	return if p1.measuredSize == nil then p1.itemCount * (FFlagViewRecyclerReact084 and p1.estimatedSize or p2) else p1.measuredSize
end

local function refresh(Left)
	-- upvalues: FFlagViewRecyclerReact084 (copy), Callback (ref)
	local ItemCount = nil
	local MeasuredSize = nil
	
	if FFlagViewRecyclerReact084 then
		ItemCount = Left.itemCount
		MeasuredSize = Left.measuredSize
	end
	assert((if FFlagViewRecyclerReact084 then ItemCount else Left.itemCount) >= 1, "WeightedOrderStatisticTree: node itemCount must be positive")
	assert((if FFlagViewRecyclerReact084 then MeasuredSize else Left.measuredSize) == nil or (if FFlagViewRecyclerReact084 then ItemCount else Left.itemCount) == 1, "WeightedOrderStatisticTree: measured nodes must represent exactly one item")
	local NewSubtreeItemCount = nil
	local NewSubtreeMeasuredCount: number? = nil
	local NewSubtreeFixedCount: number? = nil
	local NewSubtreeFixedSum: number? = nil
	local NewSubtreeNodeCount: number? = nil
	local Height = nil
	local Height1 = nil
	
	if FFlagViewRecyclerReact084 then
		NewSubtreeItemCount = ItemCount
		NewSubtreeMeasuredCount = 0
		NewSubtreeFixedCount = 0
		NewSubtreeFixedSum = 0
		NewSubtreeNodeCount = 1
		Height = 0
		Height1 = 0
		
		if MeasuredSize == nil then
			local EstimatedSize = Left.estimatedSize
			
			if EstimatedSize ~= nil then
				NewSubtreeFixedCount = ItemCount
				NewSubtreeFixedSum = ItemCount * EstimatedSize
			end
		else
			NewSubtreeMeasuredCount = 1
			NewSubtreeFixedCount = 1
			NewSubtreeFixedSum = MeasuredSize
		end
		local Left1 = Left.left
		
		if Left1 ~= nil then
			NewSubtreeItemCount += Left1.subtreeItemCount
			NewSubtreeMeasuredCount += Left1.subtreeMeasuredCount
			NewSubtreeFixedCount += Left1.subtreeFixedCount
			NewSubtreeFixedSum += Left1.subtreeFixedSum
			NewSubtreeNodeCount += Left1.subtreeNodeCount
			Height = Left1.height
		end
		local Right = Left.right
		
		if Right ~= nil then
			NewSubtreeItemCount += Right.subtreeItemCount
			NewSubtreeMeasuredCount += Right.subtreeMeasuredCount
			NewSubtreeFixedCount += Right.subtreeFixedCount
			NewSubtreeFixedSum += Right.subtreeFixedSum
			NewSubtreeNodeCount += Right.subtreeNodeCount
			Height1 = Right.height
		end
	end
	local SubtreeItemCount = nil
	if FFlagViewRecyclerReact084 then
		SubtreeItemCount = NewSubtreeItemCount
	else
		local Left2 = Left.left
		local NewItemCount = (if Left2 == nil then 0 else Left2.subtreeItemCount) + Left.itemCount
		local Right = Left.right
		SubtreeItemCount = NewItemCount + (if Right == nil then 0 else Right.subtreeItemCount)
	end
	Left.subtreeItemCount = SubtreeItemCount
	local SubtreeMeasuredCount = nil
	
	if FFlagViewRecyclerReact084 then
		SubtreeMeasuredCount = NewSubtreeMeasuredCount
	else
		local Left3 = Left.left
		local v1 = (if Left3 == nil then 0 else Left3.subtreeMeasuredCount) + (if Left.measuredSize == nil then 0 else 1)
		local Right = Left.right
		SubtreeMeasuredCount = v1 + (if Right == nil then 0 else Right.subtreeMeasuredCount)
	end
	Left.subtreeMeasuredCount = SubtreeMeasuredCount
	
	if FFlagViewRecyclerReact084 then
		Left.subtreeFixedCount = NewSubtreeFixedCount
		Left.subtreeFixedSum = NewSubtreeFixedSum
	else
		Left.subtreeMeasuredSum = Callback(Left.left) + (Left.measuredSize or 0) + Callback(Left.right)
	end
	local SubtreeNodeCount = nil
	if FFlagViewRecyclerReact084 then
		SubtreeNodeCount = NewSubtreeNodeCount
	else
		local Left4 = Left.left
		local v2 = (if Left4 == nil then 0 else Left4.subtreeNodeCount) + 1
		local Right = Left.right
		SubtreeNodeCount = v2 + (if Right == nil then 0 else Right.subtreeNodeCount)
	end
	Left.subtreeNodeCount = SubtreeNodeCount
	local v3 = 1
	local Height2 = nil
	
	if FFlagViewRecyclerReact084 then
		Height2 = if Height1 < Height then Height else Height1
	else
		local Left5 = Left.left
		local Right = Left.right
		Height2 = math.max(if Left5 == nil then 0 else Left5.height, if Right == nil then 0 else Right.height)
	end
	Left.height = v3 + Height2
end

local NewNode = nil
NewNode = if FFlagViewRecyclerReact084 then function(ItemCount, MeasuredSize, EstimatedSize)
	-- upvalues: refresh (copy)
	local config = {
		subtreeMeasuredCount = 0,
		subtreeFixedCount = 0,
		subtreeFixedSum = 0,
		subtreeNodeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		itemCount = ItemCount,
		measuredSize = MeasuredSize,
		estimatedSize = EstimatedSize,
		subtreeItemCount = ItemCount
	}
	refresh(config)
	
	return config
end else function(ItemCount, MeasuredSize)
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

local function join(Left, Right, Right1)
	-- upvalues: join (copy), balance (copy)
	if (if Right1 == nil then 0 else Right1.height) + 1 < (if Left == nil then 0 else Left.height) then
		Left.right = join(Left.right, Right, Right1)
		
		return (balance(Left))
	elseif (if Left == nil then 0 else Left.height) + 1 < (if Right1 == nil then 0 else Right1.height) then
		Right1.left = join(Left, Right, Right1.left)
		
		return (balance(Right1))
	else
		Right.left = Left
		Right.right = Right1
		
		return (balance(Right))
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

local function concatenate(Left, Left1)
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
end

local function splitByItems(Left, NewItemCount)
	-- upvalues: splitByItems (copy), balance (copy), refresh (copy), popMinimum (copy), join (copy), FFlagViewRecyclerReact084 (copy), NewNode (ref)
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
		local Left4 = nil
		
		if Left3 == nil then
			Left4 = Left
		elseif Left == nil then
			Left4 = Left3
		else
			local Right4 = nil
			local Left5 = nil
			if Left.left == nil then
				local Right5 = Left.right
				Left.left = nil
				Left.right = nil
				refresh(Left)
				Right4 = Right5
				Left5 = Left
			else
				local PopMinimumResult2_1
				Left.left, PopMinimumResult2_1 = popMinimum(Left.left)
				Right4 = balance(Left)
				Left5 = PopMinimumResult2_1
			end
			Left4 = join(Left3, Left5, Right4)
		end
		return Left4, Right
	else
		assert(Left.measuredSize == nil, "WeightedOrderStatisticTree: cannot split a measured node")
		local NewItemCountDelta = NewItemCount - SubtreeItemCount
		local ItemCountDelta = Left.itemCount - NewItemCountDelta
		local v1 = nil
		
		if FFlagViewRecyclerReact084 then
			local Left6 = Left.left
			local Node = NewNode(NewItemCountDelta, nil, Left.estimatedSize)
			
			if Left6 == nil then
				v1 = Node
			elseif Node == nil then
				v1 = Left6
			else
				local Right10 = nil
				local Node3 = nil
				if Node.left == nil then
					local Right9 = Node.right
					Node.left = nil
					Node.right = nil
					refresh(Node)
					Right10 = Right9
					Node3 = Node
				else
					local PopMinimumResult2_4
					Node.left, PopMinimumResult2_4 = popMinimum(Node.left)
					Right10 = balance(Node)
					Node3 = PopMinimumResult2_4
				end
				v1 = join(Left6, Node3, Right10)
			end
		else
			local Left7 = Left.left
			local Node1 = NewNode(NewItemCountDelta, nil)
			
			if Left7 == nil then
				v1 = Node1
			elseif Node1 == nil then
				v1 = Left7
			else
				local Right5 = nil
				local v2 = nil
				if Node1.left == nil then
					local Right = Node1.right
					Node1.left = nil
					Node1.right = nil
					refresh(Node1)
					Right5 = Right
					v2 = Node1
				else
					local PopMinimumResult2_2
					Node1.left, PopMinimumResult2_2 = popMinimum(Node1.left)
					Right5 = balance(Node1)
					v2 = PopMinimumResult2_2
				end
				v1 = join(Left7, v2, Right5)
			end
		end
		local Node2 = if FFlagViewRecyclerReact084 then NewNode(ItemCountDelta, nil, Left.estimatedSize) else NewNode(ItemCountDelta, nil)
		local Right = Left.right
		
		if Node2 == nil then
			return v1, Right
		end
		if Right == nil then
			return v1, Node2
		end
		local Right7 = nil
		local Right8 = nil
		if Right.left == nil then
			local Right6 = Right.right
			Right.left = nil
			Right.right = nil
			refresh(Right)
			Right7 = Right6
			Right8 = Right
		else
			local PopMinimumResult2_3
			Right.left, PopMinimumResult2_3 = popMinimum(Right.left)
			Right7 = balance(Right)
			Right8 = PopMinimumResult2_3
		end
		return v1, (join(Node2, Right8, Right7))
	end
end

local InsertUnitAt = nil
InsertUnitAt = if FFlagViewRecyclerReact084 then function(Left, p1: number, p2, p3)
	-- upvalues: NewNode (ref), InsertUnitAt (ref), balance (copy)
	if Left == nil then
		return NewNode(1, p2, p3)
	end
	local Left1 = Left.left
	local v1 = (if Left1 == nil then 0 else Left1.subtreeItemCount) + 1
	
	if p1 <= v1 then
		Left.left = InsertUnitAt(Left.left, p1, p2, p3)
	else
		Left.right = InsertUnitAt(Left.right, p1 - v1, p2, p3)
	end
	return (balance(Left))
end else function(Left, p1: number, p2)
	-- upvalues: NewNode (ref), InsertUnitAt (ref), balance (copy)
	if Left == nil then
		return NewNode(1, p2)
	end
	local Left1 = Left.left
	local v1 = (if Left1 == nil then 0 else Left1.subtreeItemCount) + 1
	
	if p1 <= v1 then
		Left.left = InsertUnitAt(Left.left, p1, p2)
	else
		Left.right = InsertUnitAt(Left.right, p1 - v1, p2)
	end
	return (balance(Left))
end

local function findMin(Left)
	-- upvalues: findMin (copy)
	return if Left.left == nil then Left else findMin(Left.left)
end

local function removeUnitAt(Left, p1: number)
	-- upvalues: removeUnitAt (copy), findMin (copy), FFlagViewRecyclerReact084 (copy), balance (copy)
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
		
		if FFlagViewRecyclerReact084 then
			Left.estimatedSize = Right1.estimatedSize
		end
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

local unitSizeAt = nil
local estimatedAt = nil

if FFlagViewRecyclerReact084 then
	unitSizeAt = function(Left, p1, p2)
		-- upvalues: unitSizeAt (ref), UnitSize (ref)
		if Left == nil then
			return p2
		else
			local Left1 = Left.left
			local SubtreeItemCount = if Left1 == nil then 0 else Left1.subtreeItemCount
			
			return if p1 <= SubtreeItemCount then unitSizeAt(Left.left, p1, p2) elseif SubtreeItemCount + Left.itemCount < p1 then unitSizeAt(Left.right, p1 - SubtreeItemCount - Left.itemCount, p2) else UnitSize(Left, p2)
		end
	end
	
	estimatedAt = function(Left, p1)
		-- upvalues: estimatedAt (ref)
		if Left == nil then
			return nil
		else
			local Left1 = Left.left
			local SubtreeItemCount = if Left1 == nil then 0 else Left1.subtreeItemCount
			
			return if p1 <= SubtreeItemCount then estimatedAt(Left.left, p1) elseif SubtreeItemCount + Left.itemCount < p1 then estimatedAt(Left.right, p1 - SubtreeItemCount - Left.itemCount) else Left.estimatedSize
		end
	end
	
	estimatedAt, unitSizeAt = estimatedAt, unitSizeAt
end
local function prefixSumUpTo(Left, p1: number, p2)
	-- upvalues: prefixSumUpTo (copy), FFlagViewRecyclerReact084 (copy)
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
		local v1 = (if Left2 == nil then 0 else (if FFlagViewRecyclerReact084 then Left2.subtreeFixedSum else Left2.subtreeMeasuredSum) + (Left2.subtreeItemCount - (if FFlagViewRecyclerReact084 then Left2.subtreeFixedCount else Left2.subtreeMeasuredCount)) * p2) + (if Left.measuredSize == nil then Smallest * (FFlagViewRecyclerReact084 and Left.estimatedSize or p2) else Left.measuredSize)
		
		return if p1 <= SubtreeItemCount + Left.itemCount then v1 else v1 + prefixSumUpTo(Left.right, p1 - SubtreeItemCount - Left.itemCount, p2)
	end
end

local function entryAtPrefixSum(Left, p1, p2)
	-- upvalues: FFlagViewRecyclerReact084 (copy), entryAtPrefixSum (copy)
	if Left == nil then
		return 0, 0, 0
	end
	local Left1 = Left.left
	local NewSubtreeItemCount = if Left1 == nil then 0 else (if FFlagViewRecyclerReact084 then Left1.subtreeFixedSum else Left1.subtreeMeasuredSum) + (Left1.subtreeItemCount - (if FFlagViewRecyclerReact084 then Left1.subtreeFixedCount else Left1.subtreeMeasuredCount)) * p2
	
	if p1 < NewSubtreeItemCount then
		return entryAtPrefixSum(Left.left, p1, p2)
	end
	local Left2 = Left.left
	local SubtreeItemCount = if Left2 == nil then 0 else Left2.subtreeItemCount
	local ScaledItemCount = if Left.measuredSize == nil then Left.itemCount * (FFlagViewRecyclerReact084 and Left.estimatedSize or p2) else Left.measuredSize
	
	if p1 >= NewSubtreeItemCount + ScaledItemCount then
		local EntryAtPrefixSumResult, EntryAtPrefixSumResult2, EntryAtPrefixSumResult3 = entryAtPrefixSum(Left.right, p1 - NewSubtreeItemCount - ScaledItemCount, p2)
		
		if EntryAtPrefixSumResult == 0 then
			return 0, 0, 0
		else
			return SubtreeItemCount + Left.itemCount + EntryAtPrefixSumResult, NewSubtreeItemCount + ScaledItemCount + EntryAtPrefixSumResult2, EntryAtPrefixSumResult3
		end
	elseif Left.measuredSize ~= nil then
		return SubtreeItemCount + 1, NewSubtreeItemCount, Left.measuredSize
	else
		local EstimatedSize = if FFlagViewRecyclerReact084 then Left.estimatedSize or p2 else nil
		local Floored = math.floor((p1 - NewSubtreeItemCount) / (if FFlagViewRecyclerReact084 then EstimatedSize else p2))
		local NewSubtreeItemCount1 = SubtreeItemCount + Floored + 1
		local NewNewSubtreeItemCount = NewSubtreeItemCount + Floored * (if FFlagViewRecyclerReact084 then EstimatedSize else p2)
		
		if FFlagViewRecyclerReact084 then
			return NewSubtreeItemCount1, NewNewSubtreeItemCount, EstimatedSize
		else
			return NewSubtreeItemCount1, NewNewSubtreeItemCount, p2
		end
	end
end

local function fillRangeFromNode(Left, ItemCountDelta, p1, p2: number, p3: number, p4, p5)
	-- upvalues: FFlagViewRecyclerReact084 (copy), fillRangeFromNode (copy), UnitSize (ref)
	if Left == nil then return end
	local Left1 = Left.left
	local NewItemCountDelta = ItemCountDelta + (if Left1 == nil then 0 else Left1.subtreeItemCount) + 1
	local NewItemCountDeltaDelta = NewItemCountDelta + Left.itemCount - 1
	local Left2 = Left.left
	local v1 = p1 + (if Left2 == nil then 0 else (if FFlagViewRecyclerReact084 then Left2.subtreeFixedSum else Left2.subtreeMeasuredSum) + (Left2.subtreeItemCount - (if FFlagViewRecyclerReact084 then Left2.subtreeFixedCount else Left2.subtreeMeasuredCount)) * p4)
	
	if p2 < NewItemCountDelta then
		fillRangeFromNode(Left.left, ItemCountDelta, p1, p2, p3, p4, p5)
	end
	local Largest = math.max(p2, NewItemCountDelta)
	local Smallest = math.min(p3, NewItemCountDeltaDelta)
	
	if Largest <= Smallest then
		local UnitSizeResult = if FFlagViewRecyclerReact084 then UnitSize(Left, p4) else Left.measuredSize or p4
		for i = Largest, Smallest do
			local NewI = i - p2 + 1
			local v2 = p5[NewI]
			
			if v2 == nil then
				v2 = { startOffset = 0, length = 0 }
				p5[NewI] = v2
			end
			v2.startOffset = v1 + (i - NewItemCountDelta) * UnitSizeResult
			v2.length = UnitSizeResult
		end
	end
	if NewItemCountDeltaDelta < p3 then
		fillRangeFromNode(Left.right, NewItemCountDeltaDelta, v1 + (if Left.measuredSize == nil then Left.itemCount * (FFlagViewRecyclerReact084 and Left.estimatedSize or p4) else Left.measuredSize), p2, p3, p4, p5)
	end
end

local function buildBalanced(p6, p7, p8)
	-- upvalues: FFlagViewRecyclerReact084 (copy), NewNode (ref), buildBalanced (copy), refresh (copy)
	if p8 < p7 then
		return nil
	else
		local v3 = (p7 + p8) // 2
		local v4 = p6[v3]
		local Node = if FFlagViewRecyclerReact084 then NewNode(v4.itemCount, v4.measuredSize, v4.estimatedSize) else NewNode(v4.itemCount, v4.measuredSize)
		Node.left = buildBalanced(p6, p7, v3 - 1)
		Node.right = buildBalanced(p6, v3 + 1, p8)
		refresh(Node)
		
		return Node
	end
end

local function appendToArray(Left, List, p6)
	-- upvalues: appendToArray (copy), FFlagViewRecyclerReact084 (copy), UnitSize (ref)
	if Left == nil then return end
	appendToArray(Left.left, List, p6)
	local UnitSizeResult = if FFlagViewRecyclerReact084 then UnitSize(Left, p6) else Left.measuredSize or p6
	for _ = 1, Left.itemCount do
		table.insert(List, UnitSizeResult)
	end
	appendToArray(Left.right, List, p6)
end

WeightedOrderStatisticTreeModule.newNode = NewNode
WeightedOrderStatisticTreeModule.refresh = refresh
WeightedOrderStatisticTreeModule.balance = balance
WeightedOrderStatisticTreeModule.join = join
WeightedOrderStatisticTreeModule.popMinimum = popMinimum
WeightedOrderStatisticTreeModule.popMaximum = popMaximum
WeightedOrderStatisticTreeModule.concatenate = concatenate
WeightedOrderStatisticTreeModule.splitByItems = splitByItems
WeightedOrderStatisticTreeModule.insertUnitAt = InsertUnitAt
WeightedOrderStatisticTreeModule.removeUnitAt = removeUnitAt
WeightedOrderStatisticTreeModule.updateUnitAt = updateUnitAt
WeightedOrderStatisticTreeModule.updateAt = updateAt
WeightedOrderStatisticTreeModule.measuredAt = measuredAt

if FFlagViewRecyclerReact084 then
	WeightedOrderStatisticTreeModule.estimatedAt = estimatedAt
	WeightedOrderStatisticTreeModule.unitSize = UnitSize
	WeightedOrderStatisticTreeModule.unitSizeAt = unitSizeAt
end
WeightedOrderStatisticTreeModule.prefixSumUpTo = prefixSumUpTo
WeightedOrderStatisticTreeModule.entryAtPrefixSum = entryAtPrefixSum
WeightedOrderStatisticTreeModule.fillRangeFromNode = fillRangeFromNode
WeightedOrderStatisticTreeModule.buildBalanced = buildBalanced
WeightedOrderStatisticTreeModule.appendToArray = appendToArray
WeightedOrderStatisticTreeModule.nodeItemCount = nodeItemCount
WeightedOrderStatisticTreeModule.nodeMeasuredCount = nodeMeasuredCount

if FFlagViewRecyclerReact084 then
	WeightedOrderStatisticTreeModule.nodeFixedCount = NodeFixedCount
end
WeightedOrderStatisticTreeModule.nodeCount = nodeCount
WeightedOrderStatisticTreeModule.nodeEffectiveSum = nodeEffectiveSum

return WeightedOrderStatisticTreeModule