local _ = require(script.Parent.ISizeTree)
local weightedOrderStatisticTreeModule = require(script.Parent.WeightedOrderStatisticTree)
local t = {}

local function prefixSumUpTo(p1, p2, p3)
	-- upvalues: weightedOrderStatisticTreeModule (ref), prefixSumUpTo (ref)
	if p1 == nil or p2 <= 0 then
		return 0
	end
	local var1 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left) + 1
	
	return if p2 < var1 then prefixSumUpTo(p1.left, p2, p3) elseif var1 < p2 then weightedOrderStatisticTreeModule.nodeEffectiveSum(p1.left, p3) + (p1.measuredSize or p3) + prefixSumUpTo(p1.right, p2 - var1, p3) else weightedOrderStatisticTreeModule.nodeEffectiveSum(p1.left, p3) + (p1.measuredSize or p3)
end

local function rankAtPrefixSum(p1, p2, p3)
	-- upvalues: weightedOrderStatisticTreeModule (ref), rankAtPrefixSum (ref)
	if p1 == nil then
		return 0
	end
	local var1 = weightedOrderStatisticTreeModule.nodeEffectiveSum(p1.left, p3)
	
	if p2 < var1 then
		return rankAtPrefixSum(p1.left, p2, p3)
	end
	local var2 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	local measuredSize = p1.measuredSize or p3
	
	if p2 < var1 + measuredSize then
		return var2 + 1
	end
	local var3 = rankAtPrefixSum(p1.right, p2 - var1 - measuredSize, p3)
	
	return if var3 == 0 then 0 else var2 + 1 + var3
end

local function entryAtPrefixSum(p1, p2, p3)
	-- upvalues: weightedOrderStatisticTreeModule (ref), entryAtPrefixSum (ref)
	if p1 == nil then
		return 0, 0, 0
	end
	local var1 = weightedOrderStatisticTreeModule.nodeEffectiveSum(p1.left, p3)
	
	if p2 < var1 then
		return entryAtPrefixSum(p1.left, p2, p3)
	end
	local var2 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	local measuredSize = p1.measuredSize or p3
	
	if p2 < var1 + measuredSize then
		return var2 + 1, var1, measuredSize
	end
	local var3, var4, var5 = entryAtPrefixSum(p1.right, p2 - var1 - measuredSize, p3)
	
	if var3 == 0 then
		return 0, 0, 0
	end
	return var2 + 1 + var3, var1 + measuredSize + var4, var5
end

function t.new(p1)
	-- upvalues: weightedOrderStatisticTreeModule (ref), prefixSumUpTo (ref), rankAtPrefixSum (ref), entryAtPrefixSum (ref)
	local var1 = nil
	p1 = p1 or 0
	
	local function length()
		-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write)
		return weightedOrderStatisticTreeModule.nodeItemCount(var1)
	end
	
	return {
		prefixSum = function(p2)
			-- upvalues: prefixSumUpTo (copy), var1 (write), p1 (write)
			return if p2 <= 1 then 0 else prefixSumUpTo(var1, p2 - 1, p1)
		end,
		indexAtPrefixSum = function(p2)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write), rankAtPrefixSum (copy)
			local var2 = weightedOrderStatisticTreeModule.nodeItemCount(var1)
			
			return if var2 == 0 or p2 <= 0 then 1 elseif weightedOrderStatisticTreeModule.nodeEffectiveSum(var1, p1) <= p2 then var2 + 1 else rankAtPrefixSum(var1, p2, p1)
		end,
		entryAtPrefixSum = function(p2)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write), entryAtPrefixSum (copy)
			local var2 = weightedOrderStatisticTreeModule.nodeItemCount(var1)
			
			if var2 == 0 then
				return 1, 0, 0
			elseif p2 <= 0 then
				return 1, 0, weightedOrderStatisticTreeModule.measuredAt(var1, 1) or p1
			end
			local var3 = weightedOrderStatisticTreeModule.nodeEffectiveSum(var1, p1)
			
			if var3 <= p2 then
				return var2 + 1, var3, 0
			end
			return entryAtPrefixSum(var1, p2, p1)
		end,
		getSize = function(p2)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			return if p2 < 1 or weightedOrderStatisticTreeModule.nodeItemCount(var1) < p2 then 0 else weightedOrderStatisticTreeModule.measuredAt(var1, p2) or p1
		end,
		fillRange = function(p2, p3, p4)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			weightedOrderStatisticTreeModule.fillRangeFromNode(var1, 0, 0, p2, p3, p1, p4)
			
			for i = #p4, p3 - p2 + 2, -1 do
				p4[i] = nil
			end
		end,
		update = function(p5, p6)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write)
			weightedOrderStatisticTreeModule.updateUnitAt(var1, p5, p6)
		end,
		insert = function(p5, p6)
			-- upvalues: var1 (write), weightedOrderStatisticTreeModule (copy)
			var1 = weightedOrderStatisticTreeModule.insertUnitAt(var1, p5, p6)
		end,
		remove = function(p5)
			-- upvalues: var1 (write), weightedOrderStatisticTreeModule (copy)
			var1 = weightedOrderStatisticTreeModule.removeUnitAt(var1, p5)
		end,
		buildFromArray = function(p5)
			-- upvalues: var1 (write), weightedOrderStatisticTreeModule (copy)
			local list = table.create(#p5)
			
			for i, v in p5 do
				list[i] = { itemCount = 1, measuredSize = v }
			end
			var1 = weightedOrderStatisticTreeModule.buildBalanced(list, 1, #list)
		end,
		buildFromMeasurements = function(p6, p7)
			-- upvalues: var1 (write), weightedOrderStatisticTreeModule (copy)
			local list = table.create(p6)
			
			for i = 1, p6 do
				list[i] = { itemCount = 1, measuredSize = p7(i) }
			end
			var1 = weightedOrderStatisticTreeModule.buildBalanced(list, 1, p6)
		end,
		toArray = function()
			-- upvalues: length (ref), weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			local list = table.create(length())
			weightedOrderStatisticTreeModule.appendToArray(var1, list, p1)
			
			return list
		end,
		setEstimatedItemLength = function(value)
			-- upvalues: p1 (write), weightedOrderStatisticTreeModule (copy), var1 (write)
			local var2 = p1 ~= value and weightedOrderStatisticTreeModule.nodeMeasuredCount(var1) < weightedOrderStatisticTreeModule.nodeItemCount(var1)
			p1 = value
			
			return var2
		end,
		getEstimatedItemLength = function()
			-- upvalues: p1 (write)
			return p1
		end,
		getMeasuredItemCount = function()
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write)
			return weightedOrderStatisticTreeModule.nodeMeasuredCount(var1)
		end,
		prefersIncremental = function(p8)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write)
			local var2 = weightedOrderStatisticTreeModule.nodeItemCount(var1)
			
			return if var2 == 0 then false else p8 < var2 / math.log(var2, 2)
		end,
		length = length,
		totalSum = function()
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			return weightedOrderStatisticTreeModule.nodeEffectiveSum(var1, p1)
		end
	}
end

return t