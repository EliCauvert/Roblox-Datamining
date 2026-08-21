local _ = require(script.Parent.ISizeTree)
local t = {}

local function _(p0) --[[ line: 24 | named "nodeHeight" ]]
	return if p0 == nil then 0 else p0.height
end

local _ = function(p1) --[[ line: 28 | named "nodeCount" ]]
	return if p1 == nil then 0 else p1.subtreeCount
end

local _ = function(p2) --[[ line: 32 | named "nodeMeasuredSum" ]]
	return if p2 == nil then 0 else p2.subtreeMeasuredSum
end

local _ = function(p3) --[[ line: 36 | named "nodeMeasuredCount" ]]
	return if p3 == nil then 0 else p3.subtreeMeasuredCount
end

local _ = function(p4, p5) --[[ line: 40 | named "nodeEffectiveSum" ]]
	return if p4 == nil then 0 else p4.subtreeMeasuredSum + (p4.subtreeCount - p4.subtreeMeasuredCount) * p5
end

local function fillRangeFromNode(p6, p7, p8, p9, p10, p11, p12) --[[ line: 47 ]]
	-- upvalues: fillRangeFromNode (ref)
	if p6 == nil then return end
	local left = p6.left
	left = p7 + (if left ~= nil then 0 else left.subtreeCount) + 1
	local left_1 = p6.left
	local var15 = p8 + (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeCount - left_1.subtreeMeasuredCount) * p11)
	
	if p9 < left then
		fillRangeFromNode(p6.left, p7, p8, p9, p10, p11, p12)
	end
	local measuredSize = p6.measuredSize or p11
	
	if p9 <= left and left <= p10 then
		local var17 = left - p9 + 1
		local var18 = p12[var17]
		
		if var18 == nil then
			var18 = { startOffset = 0, length = 0 }
			p12[var17] = var18
		end
		var18.startOffset = var15
		var18.length = measuredSize
	end
	if left < p10 then
		fillRangeFromNode(p6.right, left, var15 + measuredSize, p9, p10, p11, p12)
	end
end

local function refresh(p13) --[[ line: 89 ]]
	local left = p13.left
	local var19 = (if left ~= nil then 0 else left.subtreeCount) + 1
	local right = p13.right
	p13.subtreeCount = var19 + (if right ~= nil then 0 else right.subtreeCount)
	local left_1 = p13.left
	local var20 = (if left_1 ~= nil then 0 else left_1.subtreeMeasuredCount) + (if p13.measuredSize ~= nil then 0 else 1)
	local right_1 = p13.right
	p13.subtreeMeasuredCount = var20 + (if right_1 ~= nil then 0 else right_1.subtreeMeasuredCount)
	local left_2 = p13.left
	local var21 = (if left_2 ~= nil then 0 else left_2.subtreeMeasuredSum) + (p13.measuredSize or 0)
	local right_2 = p13.right
	p13.subtreeMeasuredSum = var21 + (if right_2 ~= nil then 0 else right_2.subtreeMeasuredSum)
	local left_3 = p13.left
	local right_3 = p13.right
	p13.height = math.max(if left_3 ~= nil then 0 else left_3.height, if right_3 ~= nil then 0 else right_3.height) + 1
end

local _ = function(p14) --[[ line: 98 | named "newNode" ]]
	return {
		subtreeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		measuredSize = p14,
		subtreeMeasuredSum = p14 or 0,
		subtreeMeasuredCount = if p14 ~= nil then 0 else 1
	}
end

local _ = function(p15) --[[ line: 110 | named "rotateRight" ]]
	-- upvalues: refresh (ref)
	local left = p15.left
	local right = left.right
	left.right = p15
	p15.left = right
	refresh(p15)
	refresh(left)
	
	return left
end

local _ = function(p16) --[[ line: 120 | named "rotateLeft" ]]
	-- upvalues: refresh (ref)
	local right = p16.right
	local left = right.left
	right.left = p16
	p16.right = left
	refresh(p16)
	refresh(right)
	
	return right
end

local function balance(p17) --[[ line: 130 ]]
	-- upvalues: refresh (ref)
	refresh(p17)
	local left = p17.left
	local right = p17.right
	local var22 = (if left ~= nil then 0 else left.height) - (if right ~= nil then 0 else right.height)
	
	if var22 > 1 then
		local left_1 = p17.left
		local left_2 = left_1.left
		local right_1 = left_1.right
		
		if (if left_2 ~= nil then 0 else left_2.height) < (if right_1 ~= nil then 0 else right_1.height) then
			left_2 = left_1.right
			right_1 = left_2.left
			left_2.left = left_1
			left_1.right = right_1
			refresh(left_1)
			refresh(left_2)
			p17.left = left_2
		end
		local left_3 = p17.left
		local right_2 = left_3.right
		left_3.right = p17
		p17.left = right_2
		refresh(p17)
		refresh(left_3)
		
		return left_3
	elseif var22 >= -1 then
		return p17
	end
	local right_1 = p17.right
	local right_2 = right_1.right
	local left_1 = right_1.left
	
	if (if right_2 ~= nil then 0 else right_2.height) < (if left_1 ~= nil then 0 else left_1.height) then
		right_2 = right_1.left
		left_1 = right_2.right
		right_2.right = right_1
		right_1.left = left_1
		refresh(right_1)
		refresh(right_2)
		p17.right = right_2
	end
	local right_3 = p17.right
	local left_2 = right_3.left
	right_3.left = p17
	p17.right = left_2
	refresh(p17)
	refresh(right_3)
	
	return right_3
end

local function insertAt(p18, p19, p20) --[[ line: 156 ]]
	-- upvalues: insertAt (ref), balance (ref)
	if p18 == nil then
		return {
			subtreeCount = 1,
			height = 1,
			left = nil,
			right = nil,
			measuredSize = p20,
			subtreeMeasuredSum = p20 or 0,
			subtreeMeasuredCount = if p20 ~= nil then 0 else 1
		}
	end
	local left = p18.left
	local var23 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p19 <= var23 then
		p18.left = insertAt(p18.left, p19, p20)
	else
		p18.right = insertAt(p18.right, p19 - var23, p20)
	end
	return balance(p18)
end

local function findMin(a) --[[ line: 173 ]]
	-- upvalues: findMin (ref)
	return if a.left == nil then a else findMin(a.left)
end

local function removeAt(p21, p22) --[[ line: 177 ]]
	-- upvalues: removeAt (ref), findMin (ref), balance (ref)
	if p21 == nil then
		return nil
	end
	local left = p21.left
	local var24 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p22 < var24 then
		p21.left = removeAt(p21.left, p22)
	elseif var24 < p22 then
		p21.right = removeAt(p21.right, p22 - var24)
	elseif p21.left == nil then
		return p21.right
	elseif p21.right == nil then
		return p21.left
	end
	local right = p21.right
	p21.measuredSize = (if right.left ~= nil then right else findMin(right.left)).measuredSize
	p21.right = removeAt(p21.right, 1)
	return balance(p21)
end

local function getMeasuredAt(p23, p24) --[[ line: 206 ]]
	-- upvalues: getMeasuredAt (ref)
	if p23 == nil then
		return nil
	end
	local left = p23.left
	local var25 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	return if p24 < var25 then getMeasuredAt(p23.left, p24) elseif var25 < p24 then getMeasuredAt(p23.right, p24 - var25) else p23.measuredSize
end

local function updateAt(p25, p26, p27) --[[ line: 223 ]]
	-- upvalues: updateAt (ref), refresh (ref)
	if p25 == nil then return end
	local left = p25.left
	local var26 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p26 < var26 then
		updateAt(p25.left, p26, p27)
	elseif var26 < p26 then
		updateAt(p25.right, p26 - var26, p27)
	else
		p25.measuredSize = p27
	end
	refresh(p25)
end

local function prefixSumUpTo(p28, p29, p30) --[[ line: 243 ]]
	-- upvalues: prefixSumUpTo (ref)
	if p28 == nil or p29 <= 0 then
		return 0
	end
	local left = p28.left
	local var27 = (if left ~= nil then 0 else left.subtreeCount) + 1
	
	if p29 < var27 then
		return prefixSumUpTo(p28.left, p29, p30)
	elseif var27 < p29 then
		local left_1 = p28.left
		
		return (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeCount - left_1.subtreeMeasuredCount) * p30) + (p28.measuredSize or p30) + prefixSumUpTo(p28.right, p29 - var27, p30)
	end
	local left_1 = p28.left
	
	return (if left_1 == nil then 0 else left_1.subtreeMeasuredSum + (left_1.subtreeCount - left_1.subtreeMeasuredCount) * p30) + (p28.measuredSize or p30)
end

local function rankAtPrefixSum(p31, p32, p33) --[[ line: 266 ]]
	-- upvalues: rankAtPrefixSum (ref)
	if p31 == nil then
		return 0
	end
	local left = p31.left
	local var28 = if left == nil then 0 else left.subtreeMeasuredSum + (left.subtreeCount - left.subtreeMeasuredCount) * p33
	
	if p32 < var28 then
		return rankAtPrefixSum(p31.left, p32, p33)
	end
	local left_1 = p31.left
	local var29 = if left_1 ~= nil then 0 else left_1.subtreeCount
	local var30 = var28 + (p31.measuredSize or p33)
	
	if p32 < var30 then
		return var29 + 1
	end
	local var31 = rankAtPrefixSum(p31.right, p32 - var30, p33)
	
	return if var31 == 0 then 0 else var29 + 1 + var31
end

local function entryAtPrefixSum(p34, p35, p36) --[[ line: 291 ]]
	-- upvalues: entryAtPrefixSum (ref)
	if p34 == nil then
		return 0, 0, 0
	end
	local left = p34.left
	local var32 = if left == nil then 0 else left.subtreeMeasuredSum + (left.subtreeCount - left.subtreeMeasuredCount) * p36
	
	if p35 < var32 then
		return entryAtPrefixSum(p34.left, p35, p36)
	end
	local left_1 = p34.left
	local var33 = if left_1 ~= nil then 0 else left_1.subtreeCount
	local measuredSize = p34.measuredSize or p36
	local var35 = var32 + measuredSize
	
	if p35 < var35 then
		return var33 + 1, var32, measuredSize
	end
	local var36, var37, var38 = entryAtPrefixSum(p34.right, p35 - var35, p36)
	
	if var36 == 0 then
		return 0, 0, 0
	end
	return var33 + 1 + var36, var35 + var37, var38
end

local function buildBalanced(p37, p38, p39) --[[ line: 316 ]]
	-- upvalues: buildBalanced (ref), refresh (ref)
	if p39 < p38 then
		return nil
	end
	local var39 = (p38 + p39) // 2
	local var40 = p37[var39]
	local t = {
		subtreeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		measuredSize = var40,
		subtreeMeasuredSum = var40 or 0,
		subtreeMeasuredCount = if var40 ~= nil then 0 else 1,
		left = buildBalanced(p37, p38, var39 - 1),
		right = buildBalanced(p37, var39 + 1, p39)
	}
	refresh(t)
	
	return t
end

local function buildBalancedMeasurements(p40, p41, p42) --[[ line: 328 ]]
	-- upvalues: buildBalancedMeasurements (ref), refresh (ref)
	if p42 < p41 then
		return nil
	end
	local var42 = (p41 + p42) // 2
	local var43 = p40(var42)
	local t = {
		subtreeCount = 1,
		height = 1,
		left = nil,
		right = nil,
		measuredSize = var43,
		subtreeMeasuredSum = var43 or 0,
		subtreeMeasuredCount = if var43 ~= nil then 0 else 1,
		left = buildBalancedMeasurements(p40, p41, var42 - 1),
		right = buildBalancedMeasurements(p40, var42 + 1, p42)
	}
	refresh(t)
	
	return t
end

local function appendInOrder(p43, p44, p45) --[[ line: 340 ]]
	-- upvalues: appendInOrder (ref)
	if p43 == nil then
		return
	end
	appendInOrder(p43.left, p44, p45)
	table.insert(p44, p43.measuredSize or p45)
	appendInOrder(p43.right, p44, p45)
end

function t.new(p46) --[[ line: 349 ]]
	-- upvalues: prefixSumUpTo (ref), rankAtPrefixSum (ref), getMeasuredAt (ref), entryAtPrefixSum (ref), fillRangeFromNode (ref), updateAt (ref), insertAt (ref), removeAt (ref), buildBalanced (ref), refresh (ref), buildBalancedMeasurements (ref), appendInOrder (ref)
	local var45 = nil
	local var46 = 0
	p46 = p46 or 0
	
	return {
		prefixSum = function(p47) --[[ line: 354 ]]
			-- upvalues: prefixSumUpTo (copy), var45 (write), p46 (write)
			return if p47 <= 1 then 0 else prefixSumUpTo(var45, p47 - 1, p46)
		end,
		indexAtPrefixSum = function(p48) --[[ line: 362 ]]
			-- upvalues: var46 (write), var45 (write), p46 (write), rankAtPrefixSum (copy)
			if var46 == 0 or p48 <= 0 then
				return 1
			end
			local var48 = var45
			
			return if (if var48 == nil then 0 else var48.subtreeMeasuredSum + (var48.subtreeCount - var48.subtreeMeasuredCount) * p46) <= p48 then var46 + 1 else rankAtPrefixSum(var45, p48, p46)
		end,
		entryAtPrefixSum = function(p49) --[[ line: 372 ]]
			-- upvalues: var46 (write), var45 (write), getMeasuredAt (copy), p46 (write), entryAtPrefixSum (copy)
			if var46 == 0 then
				return 1, 0, 0
			elseif p49 <= 0 then
				local var52
				local var49 = 1
				local var50 = 0
				local var51 = var45
				
				if var51 == nil then
					var52 = nil
				else
					local left = var51.left
					local var53 = (if left ~= nil then 0 else left.subtreeCount) + 1
					var52 = if var53 > 1 then getMeasuredAt(var51.left, 1) elseif var53 < 1 then getMeasuredAt(var51.right, 1 - var53) else var51.measuredSize
				end
				return var49, var50, var52 or p46
			else
				local var54 = var45
				local var55 = if var54 == nil then 0 else var54.subtreeMeasuredSum + (var54.subtreeCount - var54.subtreeMeasuredCount) * p46
				
				if var55 <= p49 then
					return var46 + 1, var55, 0
				end
				return entryAtPrefixSum(var45, p49, p46)
			end
		end,
		getSize = function(p50) --[[ line: 385 ]]
			-- upvalues: var46 (write), var45 (write), getMeasuredAt (copy), p46 (write)
			local var56
			if p50 < 1 or var46 < p50 then
				return 0
			elseif var45 == nil then
				var56 = nil
			else
				local left = var45.left
				local var57 = (if left ~= nil then 0 else left.subtreeCount) + 1
				var56 = if p50 < var57 then getMeasuredAt(var45.left, p50) elseif var57 < p50 then getMeasuredAt(var45.right, p50 - var57) else var45.measuredSize
			end
			return var56 or p46
		end,
		fillRange = function(p51, p52, p53) --[[ line: 392 ]]
			-- upvalues: fillRangeFromNode (copy), var45 (write), p46 (write)
			fillRangeFromNode(var45, 0, 0, p51, p52, p46, p53)
			
			for i = #p53, p52 - p51 + 2, -1 do
				p53[i] = nil
			end
		end,
		update = function(p54, p55) --[[ line: 399 ]]
			-- upvalues: updateAt (copy), var45 (write)
			updateAt(var45, p54, p55)
		end,
		insert = function(p56, p57) --[[ line: 403 ]]
			-- upvalues: var45 (write), insertAt (copy), var46 (write)
			var45 = insertAt(var45, p56, p57)
			var46 += 1
		end,
		remove = function(p58) --[[ line: 408 ]]
			-- upvalues: var45 (write), removeAt (copy), var46 (write)
			var45 = removeAt(var45, p58)
			var46 -= 1
		end,
		buildFromArray = function(p59) --[[ line: 413 ]]
			-- upvalues: var45 (write), buildBalanced (copy), refresh (copy), var46 (write)
			local var59
			local p59Count = #p59
			
			if p59Count < 1 then
				var59 = nil
			else
				local var60 = (p59Count + 1) // 2
				local var61 = p59[var60]
				local t = {
					subtreeCount = 1,
					height = 1,
					left = nil,
					right = nil,
					measuredSize = var61,
					subtreeMeasuredSum = var61 or 0,
					subtreeMeasuredCount = if var61 ~= nil then 0 else 1,
					left = buildBalanced(p59, 1, var60 - 1),
					right = buildBalanced(p59, var60 + 1, p59Count)
				}
				refresh(t)
				var59 = t
			end
			var45 = var59
			var46 = p59Count
		end,
		buildFromMeasurements = function(p60, p61) --[[ line: 419 ]]
			-- upvalues: var45 (write), buildBalancedMeasurements (copy), var46 (write)
			var45 = buildBalancedMeasurements(p61, 1, p60)
			var46 = p60
		end,
		toArray = function() --[[ line: 424 ]]
			-- upvalues: var46 (write), var45 (write), p46 (write), appendInOrder (copy)
			local list = table.create(var46)
			
			if var45 == nil then
				return list
			end
			appendInOrder(var45.left, list, p46)
			table.insert(list, var45.measuredSize or p46)
			appendInOrder(var45.right, list, p46)
			
			return list
		end,
		setEstimatedItemLength = function(value) --[[ line: 430 ]]
			-- upvalues: p46 (write), var45 (write), var46 (write)
			local var64 = p46 ~= value and (if var45 ~= nil then 0 else var45.subtreeMeasuredCount) < var46
			p46 = value
			
			return var64
		end,
		getEstimatedItemLength = function() --[[ line: 436 ]]
			-- upvalues: p46 (write)
			return p46
		end,
		getMeasuredItemCount = function() --[[ line: 440 ]]
			-- upvalues: var45 (write)
			return if var45 == nil then 0 else var45.subtreeMeasuredCount
		end,
		prefersIncremental = function(p62) --[[ line: 454 ]]
			-- upvalues: var46 (write)
			return if var46 == 0 then false else p62 < var46 / math.log(var46, 2)
		end,
		length = function() --[[ line: 444 ]]
			-- upvalues: var46 (write)
			return var46
		end,
		totalSum = function() --[[ line: 448 ]]
			-- upvalues: var45 (write), p46 (write)
			return if var45 == nil then 0 else var45.subtreeMeasuredSum + (var45.subtreeCount - var45.subtreeMeasuredCount) * p46
		end
	}
end

return t