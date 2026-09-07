local _ = require(script.Parent.ISizeTree)
local t = {}

local function _(p1)
	return if p1 == nil then 0 else p1.height
end

local _ = function(p1)
	return if p1 == nil then 0 else p1.subtreeCount
end

local _ = function(p1)
	return if p1 == nil then 0 else p1.subtreeMeasuredSum
end

local _ = function(p1)
	return if p1 == nil then 0 else p1.subtreeMeasuredCount
end

local _ = function(p1, p2)
	return if p1 == nil then 0 else p1.subtreeMeasuredSum + (p1.subtreeCount - p1.subtreeMeasuredCount) * p2
end

local function fillRangeFromNode(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fillRangeFromNode (ref)
	if p1 == nil then return end
	local left = p1.left
	left = p2 + (if left ~= nil then 0 else left.subtreeCount) + 1
	local left_1 = p1.left
	local var1 = p3 + (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeCount - left_1.subtreeMeasuredCount) * p6)
	
	if p4 < left then
		fillRangeFromNode(p1.left, p2, p3, p4, p5, p6, p7)
	end
	local measuredSize = p1.measuredSize or p6
	
	if p4 <= left and left <= p5 then
		local var2 = left - p4 + 1
		local var3 = p7[var2]
		
		if var3 == nil then
			var3 = { startOffset = 0, length = 0 }
			p7[var2] = var3
		end
		var3.startOffset = var1
		var3.length = measuredSize
	end
	if left < p5 then
		fillRangeFromNode(p1.right, left, var1 + measuredSize, p4, p5, p6, p7)
	end
end

local function refresh(p1)
	local left = p1.left
	local var1 = (if left ~= nil then 0 else left.subtreeCount) + 1
	local right = p1.right
	p1.subtreeCount = var1 + (if right ~= nil then 0 else right.subtreeCount)
	local left_1 = p1.left
	local var2 = (if left_1 ~= nil then 0 else left_1.subtreeMeasuredCount) + (if p1.measuredSize ~= nil then 0 else 1)
	local right_1 = p1.right
	p1.subtreeMeasuredCount = var2 + (if right_1 ~= nil then 0 else right_1.subtreeMeasuredCount)
	local left_2 = p1.left
	local var3 = (if left_2 ~= nil then 0 else left_2.subtreeMeasuredSum) + (p1.measuredSize or 0)
	local right_2 = p1.right
	p1.subtreeMeasuredSum = var3 + (if right_2 ~= nil then 0 else right_2.subtreeMeasuredSum)
	local left_3 = p1.left
	local right_3 = p1.right
	p1.height = math.max(if left_3 ~= nil then 0 else left_3.height, if right_3 ~= nil then 0 else right_3.height) + 1
end

local _ = function(p1)
	return {
		subtreeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		measuredSize = p1,
		subtreeMeasuredSum = p1 or 0,
		subtreeMeasuredCount = if p1 ~= nil then 0 else 1
	}
end

local _ = function(p1)
	-- upvalues: refresh (ref)
	local left = p1.left
	local right = left.right
	left.right = p1
	p1.left = right
	refresh(p1)
	refresh(left)
	
	return left
end

local _ = function(p1)
	-- upvalues: refresh (ref)
	local right = p1.right
	local left = right.left
	right.left = p1
	p1.right = left
	refresh(p1)
	refresh(right)
	
	return right
end

local function balance(p1)
	-- upvalues: refresh (ref)
	refresh(p1)
	local left = p1.left
	local right = p1.right
	local var1 = (if left ~= nil then 0 else left.height) - (if right ~= nil then 0 else right.height)
	
	if var1 > 1 then
		local left_1 = p1.left
		local left_2 = left_1.left
		local right_1 = left_1.right
		
		if (if left_2 ~= nil then 0 else left_2.height) < (if right_1 ~= nil then 0 else right_1.height) then
			left_2 = left_1.right
			right_1 = left_2.left
			left_2.left = left_1
			left_1.right = right_1
			refresh(left_1)
			refresh(left_2)
			p1.left = left_2
		end
		local left_3 = p1.left
		local right_2 = left_3.right
		left_3.right = p1
		p1.left = right_2
		refresh(p1)
		refresh(left_3)
		
		return left_3
	elseif var1 >= -1 then
		return p1
	end
	local right_1 = p1.right
	local right_2 = right_1.right
	local left_1 = right_1.left
	
	if (if right_2 ~= nil then 0 else right_2.height) < (if left_1 ~= nil then 0 else left_1.height) then
		right_2 = right_1.left
		left_1 = right_2.right
		right_2.right = right_1
		right_1.left = left_1
		refresh(right_1)
		refresh(right_2)
		p1.right = right_2
	end
	local right_3 = p1.right
	local left_2 = right_3.left
	right_3.left = p1
	p1.right = left_2
	refresh(p1)
	refresh(right_3)
	
	return right_3
end

local function insertAt(p1, p2, p3)
	-- upvalues: insertAt (ref), balance (ref)
	if p1 == nil then
		return {
			subtreeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			measuredSize = p3,
			subtreeMeasuredSum = p3 or 0,
			subtreeMeasuredCount = if p3 ~= nil then 0 else 1
		}
	end
	local left = p1.left
	local var1 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p2 <= var1 then
		p1.left = insertAt(p1.left, p2, p3)
	else
		p1.right = insertAt(p1.right, p2 - var1, p3)
	end
	return balance(p1)
end

local function findMin(a)
	-- upvalues: findMin (ref)
	return if a.left == nil then a else findMin(a.left)
end

local function removeAt(p1, p2)
	-- upvalues: removeAt (ref), findMin (ref), balance (ref)
	if p1 == nil then
		return nil
	end
	local left = p1.left
	local var1 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p2 < var1 then
		p1.left = removeAt(p1.left, p2)
	elseif var1 < p2 then
		p1.right = removeAt(p1.right, p2 - var1)
	elseif p1.left == nil then
		return p1.right
	elseif p1.right == nil then
		return p1.left
	end
	local right = p1.right
	p1.measuredSize = (if right.left ~= nil then right else findMin(right.left)).measuredSize
	p1.right = removeAt(p1.right, 1)
	return balance(p1)
end

local function getMeasuredAt(p1, p2)
	-- upvalues: getMeasuredAt (ref)
	if p1 == nil then
		return nil
	end
	local left = p1.left
	local var1 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	return if p2 < var1 then getMeasuredAt(p1.left, p2) elseif var1 < p2 then getMeasuredAt(p1.right, p2 - var1) else p1.measuredSize
end

local function updateAt(p1, p2, p3)
	-- upvalues: updateAt (ref), refresh (ref)
	if p1 == nil then return end
	local left = p1.left
	local var1 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p2 < var1 then
		updateAt(p1.left, p2, p3)
	elseif var1 < p2 then
		updateAt(p1.right, p2 - var1, p3)
	else
		p1.measuredSize = p3
	end
	refresh(p1)
end

local function prefixSumUpTo(p1, p2, p3)
	-- upvalues: prefixSumUpTo (ref)
	if p1 == nil or p2 <= 0 then
		return 0
	end
	local left = p1.left
	local var1 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p2 < var1 then
		return prefixSumUpTo(p1.left, p2, p3)
	elseif var1 < p2 then
		local left_1 = p1.left
		
		return (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeCount - left_1.subtreeMeasuredCount) * p3) + (p1.measuredSize or p3) + prefixSumUpTo(p1.right, p2 - var1, p3)
	end
	local left_1 = p1.left
	
	return (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeCount - left_1.subtreeMeasuredCount) * p3) + (p1.measuredSize or p3)
end

local function rankAtPrefixSum(p1, p2, p3)
	-- upvalues: rankAtPrefixSum (ref)
	if p1 == nil then
		return 0
	end
	local left = p1.left
	local var1 = if left == nil then 0 else left.subtreeMeasuredSum + (left.subtreeCount - left.subtreeMeasuredCount) * p3
	
	if p2 < var1 then
		return rankAtPrefixSum(p1.left, p2, p3)
	end
	local left_1 = p1.left
	local var2 = if left_1 ~= nil then 0 else left_1.subtreeCount
	local var3 = var1 + (p1.measuredSize or p3)
	
	if p2 < var3 then
		return var2 + 1
	end
	local var4 = rankAtPrefixSum(p1.right, p2 - var3, p3)
	
	return if var4 == 0 then 0 else var2 + 1 + var4
end

local function entryAtPrefixSum(p1, p2, p3)
	-- upvalues: entryAtPrefixSum (ref)
	if p1 == nil then
		return 0, 0, 0
	end
	local left = p1.left
	local var1 = if left == nil then 0 else left.subtreeMeasuredSum + (left.subtreeCount - left.subtreeMeasuredCount) * p3
	
	if p2 < var1 then
		return entryAtPrefixSum(p1.left, p2, p3)
	end
	local left_1 = p1.left
	local var2 = if left_1 ~= nil then 0 else left_1.subtreeCount
	local measuredSize = p1.measuredSize or p3
	local var3 = var1 + measuredSize
	
	if p2 < var3 then
		return var2 + 1, var1, measuredSize
	end
	local var4, var5, var6 = entryAtPrefixSum(p1.right, p2 - var3, p3)
	
	if var4 == 0 then
		return 0, 0, 0
	end
	return var2 + 1 + var4, var3 + var5, var6
end

local function buildBalanced(p1, p2, p3)
	-- upvalues: buildBalanced (ref), refresh (ref)
	if p3 < p2 then
		return nil
	end
	local var1 = (p2 + p3) // 2
	local var2 = p1[var1]
	local t = {
		subtreeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		measuredSize = var2,
		subtreeMeasuredSum = var2 or 0,
		subtreeMeasuredCount = if var2 ~= nil then 0 else 1,
		left = buildBalanced(p1, p2, var1 - 1),
		right = buildBalanced(p1, var1 + 1, p3)
	}
	refresh(t)
	
	return t
end

local function buildBalancedMeasurements(p1, p2, p3)
	-- upvalues: buildBalancedMeasurements (ref), refresh (ref)
	if p3 < p2 then
		return nil
	end
	local var1 = (p2 + p3) // 2
	local var2 = p1(var1)
	local t = {
		subtreeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		measuredSize = var2,
		subtreeMeasuredSum = var2 or 0,
		subtreeMeasuredCount = if var2 ~= nil then 0 else 1,
		left = buildBalancedMeasurements(p1, p2, var1 - 1),
		right = buildBalancedMeasurements(p1, var1 + 1, p3)
	}
	refresh(t)
	
	return t
end

local function appendInOrder(p1, p2, p3)
	-- upvalues: appendInOrder (ref)
	if p1 == nil then
		return
	end
	appendInOrder(p1.left, p2, p3)
	table.insert(p2, p1.measuredSize or p3)
	appendInOrder(p1.right, p2, p3)
end

function t.new(p1)
	-- upvalues: prefixSumUpTo (ref), rankAtPrefixSum (ref), getMeasuredAt (ref), entryAtPrefixSum (ref), fillRangeFromNode (ref), updateAt (ref), insertAt (ref), removeAt (ref), buildBalanced (ref), refresh (ref), buildBalancedMeasurements (ref), appendInOrder (ref)
	local var1 = nil
	local var2 = 0
	p1 = p1 or 0
	
	return {
		prefixSum = function(p2)
			-- upvalues: prefixSumUpTo (copy), var1 (write), p1 (write)
			return if p2 <= 1 then 0 else prefixSumUpTo(var1, p2 - 1, p1)
		end,
		indexAtPrefixSum = function(p2)
			-- upvalues: var2 (write), var1 (write), p1 (write), rankAtPrefixSum (copy)
			if var2 == 0 or p2 <= 0 then
				return 1
			end
			local var3 = var1
			
			return if (if var3 == nil then 0 else var3.subtreeMeasuredSum + (var3.subtreeCount - var3.subtreeMeasuredCount) * p1) <= p2 then var2 + 1 else rankAtPrefixSum(var1, p2, p1)
		end,
		entryAtPrefixSum = function(p2)
			-- upvalues: var2 (write), var1 (write), getMeasuredAt (copy), p1 (write), entryAtPrefixSum (copy)
			if var2 == 0 then
				return 1, 0, 0
			elseif p2 <= 0 then
				local var3
				local var4 = 1
				local var5 = 0
				local var6 = var1
				
				if var6 == nil then
					var3 = nil
				else
					local left = var6.left
					local var7 = (if left ~= nil then 0 else left.subtreeCount) + 1
					var3 = if var7 > 1 then getMeasuredAt(var6.left, 1) elseif var7 < 1 then getMeasuredAt(var6.right, 1 - var7) else var6.measuredSize
				end
				return var4, var5, var3 or p1
			else
				local var8 = var1
				local var9 = if var8 == nil then 0 else var8.subtreeMeasuredSum + (var8.subtreeCount - var8.subtreeMeasuredCount) * p1
				
				if var9 <= p2 then
					return var2 + 1, var9, 0
				end
				return entryAtPrefixSum(var1, p2, p1)
			end
		end,
		getSize = function(p2)
			-- upvalues: var2 (write), var1 (write), getMeasuredAt (copy), p1 (write)
			local var3
			if p2 < 1 or var2 < p2 then
				return 0
			elseif var1 == nil then
				var3 = nil
			else
				local left = var1.left
				local var4 = (if left ~= nil then 0 else left.subtreeCount) + 1
				var3 = if p2 < var4 then getMeasuredAt(var1.left, p2) elseif var4 < p2 then getMeasuredAt(var1.right, p2 - var4) else var1.measuredSize
			end
			return var3 or p1
		end,
		fillRange = function(p2, p3, p4)
			-- upvalues: fillRangeFromNode (copy), var1 (write), p1 (write)
			fillRangeFromNode(var1, 0, 0, p2, p3, p1, p4)
			
			for i = #p4, p3 - p2 + 2, -1 do
				p4[i] = nil
			end
		end,
		update = function(p5, p6)
			-- upvalues: updateAt (copy), var1 (write)
			updateAt(var1, p5, p6)
		end,
		insert = function(p5, p6)
			-- upvalues: var1 (write), insertAt (copy), var2 (write)
			var1 = insertAt(var1, p5, p6)
			var2 += 1
		end,
		remove = function(p5)
			-- upvalues: var1 (write), removeAt (copy), var2 (write)
			var1 = removeAt(var1, p5)
			var2 -= 1
		end,
		buildFromArray = function(p5)
			-- upvalues: var1 (write), buildBalanced (copy), refresh (copy), var2 (write)
			local var3
			local p59Count = #p5
			
			if p59Count < 1 then
				var3 = nil
			else
				local var4 = (p59Count + 1) // 2
				local var5 = p5[var4]
				local t = {
					subtreeCount = 1,
					height = 1,
					left = nil,
					right = nil,
					measuredSize = var5,
					subtreeMeasuredSum = var5 or 0,
					subtreeMeasuredCount = if var5 ~= nil then 0 else 1,
					left = buildBalanced(p5, 1, var4 - 1),
					right = buildBalanced(p5, var4 + 1, p59Count)
				}
				refresh(t)
				var3 = t
			end
			var1 = var3
			var2 = p59Count
		end,
		buildFromMeasurements = function(p5, p6)
			-- upvalues: var1 (write), buildBalancedMeasurements (copy), var2 (write)
			var1 = buildBalancedMeasurements(p6, 1, p5)
			var2 = p5
		end,
		toArray = function()
			-- upvalues: var2 (write), var1 (write), p1 (write), appendInOrder (copy)
			local list = table.create(var2)
			
			if var1 == nil then
				return list
			end
			appendInOrder(var1.left, list, p1)
			table.insert(list, var1.measuredSize or p1)
			appendInOrder(var1.right, list, p1)
			
			return list
		end,
		setEstimatedItemLength = function(value)
			-- upvalues: p1 (write), var1 (write), var2 (write)
			local var3 = p1 ~= value and (if var1 ~= nil then 0 else var1.subtreeMeasuredCount) < var2
			p1 = value
			
			return var3
		end,
		getEstimatedItemLength = function()
			-- upvalues: p1 (write)
			return p1
		end,
		getMeasuredItemCount = function()
			-- upvalues: var1 (write)
			return if var1 == nil then 0 else var1.subtreeMeasuredCount
		end,
		prefersIncremental = function(p5)
			-- upvalues: var2 (write)
			return if var2 == 0 then false else p5 < var2 / math.log(var2, 2)
		end,
		length = function()
			-- upvalues: var2 (write)
			return var2
		end,
		totalSum = function()
			-- upvalues: var1 (write), p1 (write)
			return if var1 == nil then 0 else var1.subtreeMeasuredSum + (var1.subtreeCount - var1.subtreeMeasuredCount) * p1
		end
	}
end

return t