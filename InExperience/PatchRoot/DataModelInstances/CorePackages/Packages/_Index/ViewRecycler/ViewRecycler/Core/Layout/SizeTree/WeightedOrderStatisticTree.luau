local t = {}

local function _(p1)
	return if p1 == nil then 0 else p1.height
end

local function nodeItemCount(p1)
	return if p1 == nil then 0 else p1.subtreeItemCount
end

local function nodeMeasuredCount(p1)
	return if p1 == nil then 0 else p1.subtreeMeasuredCount
end

local _ = function(p1)
	return if p1 == nil then 0 else p1.subtreeMeasuredSum
end

local function nodeCount(p1)
	return if p1 == nil then 0 else p1.subtreeNodeCount
end

local function nodeEffectiveSum(p1, p2)
	return if p1 == nil then 0 else p1.subtreeMeasuredSum + (p1.subtreeItemCount - p1.subtreeMeasuredCount) * p2
end

local _ = function(p1, p2)
	return if p1.measuredSize == nil then p1.itemCount * p2 else p1.measuredSize
end

local function refresh(p1)
	assert(p1.itemCount >= 1, "WeightedOrderStatisticTree: node itemCount must be positive")
	assert(if p1.measuredSize ~= nil then p1.itemCount == 1 else true, "WeightedOrderStatisticTree: measured nodes must represent exactly one item")
	local left = p1.left
	local var1 = (if left == nil then 0 else left.subtreeItemCount) + p1.itemCount
	local right = p1.right
	p1.subtreeItemCount = var1 + (if right == nil then 0 else right.subtreeItemCount)
	local left_1 = p1.left
	local var2 = (if left_1 == nil then 0 else left_1.subtreeMeasuredCount) + (if p1.measuredSize == nil then 0 else 1)
	local right_1 = p1.right
	p1.subtreeMeasuredCount = var2 + (if right_1 == nil then 0 else right_1.subtreeMeasuredCount)
	local left_2 = p1.left
	local var3 = (if left_2 == nil then 0 else left_2.subtreeMeasuredSum) + (p1.measuredSize or 0)
	local right_2 = p1.right
	p1.subtreeMeasuredSum = var3 + (if right_2 == nil then 0 else right_2.subtreeMeasuredSum)
	local left_3 = p1.left
	local var4 = (if left_3 == nil then 0 else left_3.subtreeNodeCount) + 1
	local right_3 = p1.right
	p1.subtreeNodeCount = var4 + (if right_3 == nil then 0 else right_3.subtreeNodeCount)
	local left_4 = p1.left
	local right_4 = p1.right
	p1.height = math.max(if left_4 == nil then 0 else left_4.height, if right_4 == nil then 0 else right_4.height) + 1
end

local function newNode(p1, p2)
	-- upvalues: refresh (ref)
	local t = {
		subtreeNodeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		itemCount = p1,
		measuredSize = p2,
		subtreeItemCount = p1,
		subtreeMeasuredCount = if p2 == nil then 0 else 1,
		subtreeMeasuredSum = p2 or 0
	}
	refresh(t)
	
	return t
end

local _ = function(p1)
	-- upvalues: refresh (ref)
	local left = p1.left
	p1.left = left.right
	left.right = p1
	refresh(p1)
	refresh(left)
	
	return left
end

local _ = function(p1)
	-- upvalues: refresh (ref)
	local right = p1.right
	p1.right = right.left
	right.left = p1
	refresh(p1)
	refresh(right)
	
	return right
end

local function balance(p1)
	-- upvalues: refresh (ref)
	refresh(p1)
	local left = p1.left
	local right = p1.right
	local var1 = (if left == nil then 0 else left.height) - (if right == nil then 0 else right.height)
	
	if var1 > 1 then
		local left_1 = p1.left
		local left_2 = left_1.left
		local right_1 = left_1.right
		
		if (if left_2 == nil then 0 else left_2.height) < (if right_1 == nil then 0 else right_1.height) then
			left_2 = left_1.right
			left_1.right = left_2.left
			left_2.left = left_1
			refresh(left_1)
			refresh(left_2)
			p1.left = left_2
		end
		local left_3 = p1.left
		p1.left = left_3.right
		left_3.right = p1
		refresh(p1)
		refresh(left_3)
		
		return left_3
	elseif var1 >= -1 then
		return p1
	end
	local right_1 = p1.right
	local right_2 = right_1.right
	local left_1 = right_1.left
	
	if (if right_2 == nil then 0 else right_2.height) < (if left_1 == nil then 0 else left_1.height) then
		right_2 = right_1.left
		right_1.left = right_2.right
		right_2.right = right_1
		refresh(right_1)
		refresh(right_2)
		p1.right = right_2
	end
	local right_3 = p1.right
	p1.right = right_3.left
	right_3.left = p1
	refresh(p1)
	refresh(right_3)
	
	return right_3
end

local function join(p1, p2, p3)
	-- upvalues: join (ref), balance (ref)
	if (if p3 == nil then 0 else p3.height) + 1 < (if p1 == nil then 0 else p1.height) then
		p1.right = join(p1.right, p2, p3)
		
		return balance(p1)
	elseif (if p1 == nil then 0 else p1.height) + 1 < (if p3 == nil then 0 else p3.height) then
		p3.left = join(p1, p2, p3.left)
		
		return balance(p3)
	end
	p2.left = p1
	p2.right = p3
	
	return balance(p2)
end

local function popMinimum(a)
	-- upvalues: refresh (ref), popMinimum (ref), balance (ref)
	if a.left == nil then
		local right = a.right
		a.left = nil
		a.right = nil
		refresh(a)
		
		return right, a
	end
	local var1, var2 = popMinimum(a.left)
	a.left = var1
	
	return balance(a), var2
end

local function popMaximum(a)
	-- upvalues: refresh (ref), popMaximum (ref), balance (ref)
	if a.right == nil then
		local left = a.left
		a.left = nil
		a.right = nil
		refresh(a)
		
		return left, a
	end
	local var1, var2 = popMaximum(a.right)
	a.right = var1
	
	return balance(a), var2
end

local function concatenate(p1, p2)
	-- upvalues: refresh (ref), popMinimum (ref), balance (ref), join (ref)
	local var1, var2
	if p1 == nil then
		return p2
	elseif p2 == nil then
		return p1
	elseif p2.left == nil then
		local right = p2.right
		p2.left = nil
		p2.right = nil
		refresh(p2)
		var1 = right
		var2 = p2
	else
		local var3, var4 = popMinimum(p2.left)
		p2.left = var3
		var1 = balance(p2)
		var2 = var4
	end
	return join(p1, var2, var1)
end

local function splitByItems(p1, p2)
	-- upvalues: splitByItems (ref), balance (ref), refresh (ref), popMinimum (ref), join (ref)
	if p1 == nil then
		return nil, nil
	end
	local left = p1.left
	local var1 = if left == nil then 0 else left.subtreeItemCount
	local var2 = var1 + p1.itemCount
	
	if p2 < var1 then
		local var3, var4 = splitByItems(p1.left, p2)
		p1.left = var4
		
		return var3, balance(p1)
	elseif var2 < p2 then
		local var5, var6 = splitByItems(p1.right, p2 - var2)
		p1.right = var5
		
		return balance(p1), var6
	elseif p2 == var1 then
		local var7, var8
		local left_1 = p1.left
		local right = p1.right
		p1.left = nil
		p1.right = nil
		refresh(p1)
		local var9 = left_1
		
		if p1 == nil then
			return var9, right
		elseif right == nil then
			return var9, p1
		elseif right.left == nil then
			local right_1 = right.right
			right.left = nil
			right.right = nil
			refresh(right)
			var7 = right_1
			var8 = right
		else
			local var10, var11 = popMinimum(right.left)
			right.left = var10
			var7 = balance(right)
			var8 = var11
		end
		return var9, join(p1, var8, var7)
	elseif p2 == var2 then
		local var12, var13, var14
		local left_1 = p1.left
		local right = p1.right
		p1.left = nil
		p1.right = nil
		refresh(p1)
		
		if left_1 == nil then
			var12 = p1
		elseif p1 == nil then
			var12 = left_1
		elseif p1.left == nil then
			local right_1 = p1.right
			p1.left = nil
			p1.right = nil
			refresh(p1)
			var13 = right_1
			var14 = p1
		else
			local var15, var16 = popMinimum(p1.left)
			p1.left = var15
			var13 = balance(p1)
			var14 = var16
		end
		var12 = join(left_1, var14, var13)
		return var12, right
	else
		local var17, var18
		assert(p1.measuredSize == nil, "WeightedOrderStatisticTree: cannot split a measured node")
		local var19 = p2 - var1
		local var20 = p1.itemCount - var19
		local left_1 = p1.left
		local t = {
			measuredSize = nil,
			subtreeMeasuredCount = 0,
			subtreeMeasuredSum = 0,
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			itemCount = var19,
			subtreeItemCount = var19
		}
		refresh(t)
		
		if left_1 == nil then
			var17 = t
		elseif t == nil then
			var17 = left_1
		elseif t.left == nil then
			local right = t.right
			t.left = nil
			t.right = nil
			refresh(t)
			t = right
			var18 = t
		else
			local var21, var22 = popMinimum(t.left)
			t.left = var21
			t = balance(t)
			var18 = var22
		end
		var17 = join(left_1, var18, t)
		local var23, var24
		local t_1 = {
			measuredSize = nil,
			subtreeMeasuredCount = 0,
			subtreeMeasuredSum = 0,
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			itemCount = var20,
			subtreeItemCount = var20
		}
		refresh(t_1)
		local right = p1.right
		
		if t_1 == nil then
			return var17, right
		elseif right == nil then
			return var17, t_1
		elseif right.left == nil then
			local right_1 = right.right
			right.left = nil
			right.right = nil
			refresh(right)
			var23 = right_1
			var24 = right
		else
			local var25, var26 = popMinimum(right.left)
			right.left = var25
			var23 = balance(right)
			var24 = var26
		end
		return var17, join(t_1, var24, var23)
	end
end

local function insertUnitAt(p1, p2, p3)
	-- upvalues: refresh (ref), insertUnitAt (ref), balance (ref)
	if p1 == nil then
		local t = {
			itemCount = 1,
			subtreeItemCount = 1,
			subtreeNodeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			measuredSize = p3,
			subtreeMeasuredCount = if p3 == nil then 0 else 1,
			subtreeMeasuredSum = p3 or 0
		}
		refresh(t)
		
		return t
	end
	local left = p1.left
	local var1 = (if left == nil then 0 else left.subtreeItemCount) + 1
	
	if p2 <= var1 then
		p1.left = insertUnitAt(p1.left, p2, p3)
	else
		p1.right = insertUnitAt(p1.right, p2 - var1, p3)
	end
	return balance(p1)
end

local function findMin(a)
	-- upvalues: findMin (ref)
	return if a.left == nil then a else findMin(a.left)
end

local function removeUnitAt(p1, p2)
	-- upvalues: removeUnitAt (ref), findMin (ref), balance (ref)
	if p1 == nil then
		return nil
	end
	local left = p1.left
	local var1 = (if left == nil then 0 else left.subtreeItemCount) + 1
	
	if p2 < var1 then
		p1.left = removeUnitAt(p1.left, p2)
	elseif var1 < p2 then
		p1.right = removeUnitAt(p1.right, p2 - var1)
	elseif p1.left == nil then
		return p1.right
	elseif p1.right == nil then
		return p1.left
	end
	local right = p1.right
	local var2 = if right.left ~= nil then right else findMin(right.left)
	p1.measuredSize = var2.measuredSize
	p1.itemCount = var2.itemCount
	p1.right = removeUnitAt(p1.right, 1)
	return balance(p1)
end

local function updateUnitAt(p1, p2, p3)
	-- upvalues: updateUnitAt (ref), refresh (ref)
	if p1 == nil then return end
	local left = p1.left
	local var1 = (if left == nil then 0 else left.subtreeItemCount) + 1
	
	if p2 < var1 then
		updateUnitAt(p1.left, p2, p3)
	elseif var1 < p2 then
		updateUnitAt(p1.right, p2 - var1, p3)
	else
		p1.measuredSize = p3
	end
	refresh(p1)
end

local function updateAt(p1, p2, p3)
	-- upvalues: updateAt (ref), refresh (ref)
	if p1 == nil then
		return nil
	end
	local left = p1.left
	local var1 = if left == nil then 0 else left.subtreeItemCount
	
	if p2 <= var1 then
		p1.left = updateAt(p1.left, p2, p3)
	elseif var1 + p1.itemCount < p2 then
		p1.right = updateAt(p1.right, p2 - var1 - p1.itemCount, p3)
	else
		assert(p1.itemCount == 1, "WeightedOrderStatisticTree: in-place update requires a unit node")
		p1.measuredSize = p3
	end
	refresh(p1)
	
	return p1
end

local function measuredAt(p1, p2)
	-- upvalues: measuredAt (ref)
	if p1 == nil then
		return nil
	end
	local left = p1.left
	local var1 = if left == nil then 0 else left.subtreeItemCount
	
	return if p2 <= var1 then measuredAt(p1.left, p2) elseif var1 + p1.itemCount < p2 then measuredAt(p1.right, p2 - var1 - p1.itemCount) else p1.measuredSize
end

local function prefixSumUpTo(p1, p2, p3)
	-- upvalues: prefixSumUpTo (ref)
	if p1 == nil or p2 <= 0 then
		return 0
	end
	local left = p1.left
	local var1 = if left == nil then 0 else left.subtreeItemCount
	
	if p2 <= var1 then
		return prefixSumUpTo(p1.left, p2, p3)
	end
	local left_1 = p1.left
	local var2 = (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeItemCount - left_1.subtreeMeasuredCount) * p3) + (if p1.measuredSize == nil then math.min(p1.itemCount, p2 - var1) * p3 else p1.measuredSize)
	
	return if p2 <= var1 + p1.itemCount then var2 else var2 + prefixSumUpTo(p1.right, p2 - var1 - p1.itemCount, p3)
end

local function entryAtPrefixSum(p1, p2, p3)
	-- upvalues: entryAtPrefixSum (ref)
	if p1 == nil then
		return 0, 0, 0
	end
	local left = p1.left
	local var1 = if left == nil then 0 else left.subtreeMeasuredSum + (left.subtreeItemCount - left.subtreeMeasuredCount) * p3
	
	if p2 < var1 then
		return entryAtPrefixSum(p1.left, p2, p3)
	end
	local left_1 = p1.left
	local var2 = if left_1 == nil then 0 else left_1.subtreeItemCount
	local var3 = if p1.measuredSize == nil then p1.itemCount * p3 else p1.measuredSize
	
	if p2 < var1 + var3 then
		if p1.measuredSize == nil then
			local floored = math.floor((p2 - var1) / p3)
			
			return var2 + floored + 1, var1 + floored * p3, p3
		end
		return var2 + 1, var1, p1.measuredSize
	else
		local var4, var5, var6 = entryAtPrefixSum(p1.right, p2 - var1 - var3, p3)
		
		if var4 == 0 then
			return 0, 0, 0
		end
		return var2 + p1.itemCount + var4, var1 + var3 + var5, var6
	end
end

local function fillRangeFromNode(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fillRangeFromNode (ref)
	if p1 == nil then return end
	local left = p1.left
	left = p2 + (if left == nil then 0 else left.subtreeItemCount) + 1
	local var1 = left + p1.itemCount - 1
	local left_1 = p1.left
	local var2 = p3 + (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeItemCount - left_1.subtreeMeasuredCount) * p6)
	
	if p4 < left then
		fillRangeFromNode(p1.left, p2, p3, p4, p5, p6, p7)
	end
	local maxValue = math.max(p4, left)
	local minValue = math.min(p5, var1)
	
	if maxValue <= minValue then
		local measuredSize = p1.measuredSize or p6
		
		for i = maxValue, minValue do
			local var3 = i - p4 + 1
			local var4 = p7[var3]
			
			if var4 == nil then
				var4 = { startOffset = 0, length = 0 }
				p7[var3] = var4
			end
			var4.startOffset = var2 + (i - left) * measuredSize
			var4.length = measuredSize
		end
	end
	if var1 < p5 then
		fillRangeFromNode(p1.right, var1, var2 + (if p1.measuredSize == nil then p1.itemCount * p6 else p1.measuredSize), p4, p5, p6, p7)
	end
end

local function buildBalanced(p8, p9, p10)
	-- upvalues: refresh (ref), buildBalanced (ref)
	if p10 < p9 then
		return nil
	end
	local var5 = (p9 + p10) // 2
	local var6 = p8[var5]
	local itemCount = var6.itemCount
	local measuredSize = var6.measuredSize
	local t = {
		subtreeNodeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		itemCount = itemCount,
		measuredSize = measuredSize,
		subtreeItemCount = itemCount,
		subtreeMeasuredCount = if measuredSize == nil then 0 else 1,
		subtreeMeasuredSum = measuredSize or 0
	}
	refresh(t)
	t.left = buildBalanced(p8, p9, var5 - 1)
	t.right = buildBalanced(p8, var5 + 1, p10)
	refresh(t)
	
	return t
end

local function appendToArray(p8, p9, p10)
	-- upvalues: appendToArray (ref)
	if p8 == nil then return end
	appendToArray(p8.left, p9, p10)
	local measuredSize = p8.measuredSize or p10
	
	for _ = 1, p8.itemCount do
		table.insert(p9, measuredSize)
	end
	appendToArray(p8.right, p9, p10)
end

t.newNode = newNode
t.refresh = refresh
t.balance = balance
t.join = join
t.popMinimum = popMinimum
t.popMaximum = popMaximum
t.concatenate = concatenate
t.splitByItems = splitByItems
t.insertUnitAt = insertUnitAt
t.removeUnitAt = removeUnitAt
t.updateUnitAt = updateUnitAt
t.updateAt = updateAt
t.measuredAt = measuredAt
t.prefixSumUpTo = prefixSumUpTo
t.entryAtPrefixSum = entryAtPrefixSum
t.fillRangeFromNode = fillRangeFromNode
t.buildBalanced = buildBalanced
t.appendToArray = appendToArray
t.nodeItemCount = nodeItemCount
t.nodeMeasuredCount = nodeMeasuredCount
t.nodeCount = nodeCount
t.nodeEffectiveSum = nodeEffectiveSum

return t