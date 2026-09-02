local _ = require(script.Parent.ISizeTree)
local weightedOrderStatisticTreeModule = require(script.Parent.WeightedOrderStatisticTree)
local t = {}

local function concatenateMergingUnmeasured(p1, p2)
	-- upvalues: weightedOrderStatisticTreeModule (ref)
	if p1 == nil then
		return p2
	elseif p2 == nil then
		return p1
	end
	local var1, var2 = weightedOrderStatisticTreeModule.popMaximum(p1)
	local var3, var4 = weightedOrderStatisticTreeModule.popMinimum(p2)
	
	return if var2.measuredSize == nil and var4.measuredSize == nil then weightedOrderStatisticTreeModule.join(var1, weightedOrderStatisticTreeModule.newNode(var2.itemCount + var4.itemCount, nil), var3) else weightedOrderStatisticTreeModule.concatenate(weightedOrderStatisticTreeModule.join(var1, var2, nil), weightedOrderStatisticTreeModule.join(nil, var4, var3))
end

local function concatenatePieces(p1, p2, p3, p4, p5)
	-- upvalues: concatenateMergingUnmeasured (ref), weightedOrderStatisticTreeModule (ref)
	local var1 = p1
	
	if p2 > 0 then
		var1 = concatenateMergingUnmeasured(var1, weightedOrderStatisticTreeModule.newNode(p2, nil))
	end
	var1 = concatenateMergingUnmeasured(var1, p3)
	
	if p4 > 0 then
		var1 = concatenateMergingUnmeasured(var1, weightedOrderStatisticTreeModule.newNode(p4, nil))
	end
	return concatenateMergingUnmeasured(var1, p5)
end

local function growUnmeasuredRun(p1, p2)
	-- upvalues: weightedOrderStatisticTreeModule (ref), growUnmeasuredRun (ref)
	if p1 == nil then
		return nil, false
	end
	local var1 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	
	if p2 <= var1 then
		local var2, var3 = growUnmeasuredRun(p1.left, p2)
		p1.left = var2
		
		if var3 then
			weightedOrderStatisticTreeModule.refresh(p1)
		end
		return p1, var3
	elseif var1 + p1.itemCount < p2 then
		local var4, var5 = growUnmeasuredRun(p1.right, p2 - var1 - p1.itemCount)
		p1.right = var4
		
		if var5 then
			weightedOrderStatisticTreeModule.refresh(p1)
		end
		return p1, var5
	elseif p1.measuredSize == nil then
		p1.itemCount += 1
		weightedOrderStatisticTreeModule.refresh(p1)
		
		return p1, true
	end
	return p1, false
end

local function shrinkUnmeasuredRun(p1, p2)
	-- upvalues: weightedOrderStatisticTreeModule (ref), shrinkUnmeasuredRun (ref)
	if p1 == nil then
		return nil, false
	end
	local var1 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	
	if p2 <= var1 then
		local var2, var3 = shrinkUnmeasuredRun(p1.left, p2)
		p1.left = var2
		
		if var3 then
			weightedOrderStatisticTreeModule.refresh(p1)
		end
		return p1, var3
	elseif var1 + p1.itemCount < p2 then
		local var4, var5 = shrinkUnmeasuredRun(p1.right, p2 - var1 - p1.itemCount)
		p1.right = var4
		
		if var5 then
			weightedOrderStatisticTreeModule.refresh(p1)
		end
		return p1, var5
	elseif p1.measuredSize == nil and p1.itemCount > 1 then
		p1.itemCount -= 1
		weightedOrderStatisticTreeModule.refresh(p1)
		
		return p1, true
	end
	return p1, false
end

local function mergeAdjacentUnmeasured(p1)
	-- upvalues: weightedOrderStatisticTreeModule (ref)
	if p1.measuredSize == nil then
		if p1.left ~= nil then
			local var1, var2 = weightedOrderStatisticTreeModule.popMaximum(p1.left)
			
			if var2.measuredSize == nil then
				p1.itemCount += var2.itemCount
				p1.left = var1
			else
				p1.left = weightedOrderStatisticTreeModule.join(var1, var2, nil)
			end
		end
		if p1.right ~= nil then
			local var3, var4 = weightedOrderStatisticTreeModule.popMinimum(p1.right)
			
			if var4.measuredSize == nil then
				p1.itemCount += var4.itemCount
				p1.right = var3
			else
				p1.right = weightedOrderStatisticTreeModule.join(nil, var4, var3)
			end
		end
	end
	return weightedOrderStatisticTreeModule.balance(p1)
end

local function measureAt(p1, p2, p3)
	-- upvalues: weightedOrderStatisticTreeModule (ref), measureAt (ref), mergeAdjacentUnmeasured (ref), concatenatePieces (ref)
	if p1 == nil then
		return nil
	end
	local var1 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	
	if p2 <= var1 then
		p1.left = measureAt(p1.left, p2, p3)
		
		return mergeAdjacentUnmeasured(p1)
	elseif var1 + p1.itemCount < p2 then
		p1.right = measureAt(p1.right, p2 - var1 - p1.itemCount, p3)
		
		return mergeAdjacentUnmeasured(p1)
	elseif p1.itemCount == 1 then
		p1.measuredSize = p3
		
		return mergeAdjacentUnmeasured(p1)
	end
	local var2 = p2 - var1
	
	return concatenatePieces(p1.left, var2 - 1, weightedOrderStatisticTreeModule.newNode(1, p3), p1.itemCount - var2, p1.right)
end

local function unmeasureAt(p1, p2)
	-- upvalues: weightedOrderStatisticTreeModule (ref), unmeasureAt (ref), mergeAdjacentUnmeasured (ref)
	if p1 == nil then
		return nil
	end
	local var1 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	
	if p2 <= var1 then
		p1.left = unmeasureAt(p1.left, p2)
	elseif var1 + p1.itemCount < p2 then
		p1.right = unmeasureAt(p1.right, p2 - var1 - p1.itemCount)
	else
		assert(p1.itemCount == 1, "CollapsedEstimatedTree: unmeasure requires a unit node")
		p1.measuredSize = nil
	end
	return mergeAdjacentUnmeasured(p1)
end

local function insertMeasuredAt(p1, p2, p3)
	-- upvalues: weightedOrderStatisticTreeModule (ref), insertMeasuredAt (ref), mergeAdjacentUnmeasured (ref), concatenateMergingUnmeasured (ref), concatenatePieces (ref)
	if p1 == nil then
		return weightedOrderStatisticTreeModule.newNode(1, p3)
	end
	local var1 = weightedOrderStatisticTreeModule.nodeItemCount(p1.left)
	
	if p2 <= var1 then
		p1.left = insertMeasuredAt(p1.left, p2, p3)
		
		return mergeAdjacentUnmeasured(p1)
	elseif var1 + p1.itemCount < p2 then
		p1.right = insertMeasuredAt(p1.right, p2 - var1 - p1.itemCount, p3)
		
		return mergeAdjacentUnmeasured(p1)
	elseif p1.measuredSize == nil then
		local var2 = p2 - var1
		
		return concatenatePieces(p1.left, var2 - 1, weightedOrderStatisticTreeModule.newNode(1, p3), p1.itemCount - var2 + 1, p1.right)
	end
	local left = p1.left
	local right = p1.right
	p1.left = nil
	p1.right = nil
	weightedOrderStatisticTreeModule.refresh(p1)
	
	return concatenateMergingUnmeasured(concatenateMergingUnmeasured(left, weightedOrderStatisticTreeModule.newNode(1, p3)), weightedOrderStatisticTreeModule.concatenate(p1, right))
end

function t.new(p1)
	-- upvalues: weightedOrderStatisticTreeModule (ref), measureAt (ref), unmeasureAt (ref), growUnmeasuredRun (ref), concatenateMergingUnmeasured (ref), insertMeasuredAt (ref), shrinkUnmeasuredRun (ref)
	local var1 = nil
	p1 = p1 or 0
	
	local function length()
		-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write)
		return weightedOrderStatisticTreeModule.nodeItemCount(var1)
	end
	
	return {
		prefixSum = function(p2)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			return if p2 <= 1 then 0 else weightedOrderStatisticTreeModule.prefixSumUpTo(var1, p2 - 1, p1)
		end,
		indexAtPrefixSum = function(p2)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			local var2 = weightedOrderStatisticTreeModule.nodeItemCount(var1)
			
			return if var2 == 0 or p2 <= 0 then 1 elseif weightedOrderStatisticTreeModule.nodeEffectiveSum(var1, p1) <= p2 then var2 + 1 else weightedOrderStatisticTreeModule.entryAtPrefixSum(var1, p2, p1)
		end,
		entryAtPrefixSum = function(p2)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
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
			return weightedOrderStatisticTreeModule.entryAtPrefixSum(var1, p2, p1)
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
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), measureAt (copy), unmeasureAt (copy)
			if p5 < 1 or weightedOrderStatisticTreeModule.nodeItemCount(var1) < p5 then return end
			local var2 = weightedOrderStatisticTreeModule.measuredAt(var1, p5)
			
			if var2 ~= nil and p6 ~= nil then
				var1 = weightedOrderStatisticTreeModule.updateAt(var1, p5, p6)
				
				return
			elseif var2 == nil and p6 ~= nil then
				var1 = measureAt(var1, p5, p6)
				
				return
			elseif var2 ~= nil and p6 == nil then
				var1 = unmeasureAt(var1, p5)
			end
		end,
		insert = function(p5, p6)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), growUnmeasuredRun (copy), concatenateMergingUnmeasured (copy), insertMeasuredAt (copy)
			local var2 = weightedOrderStatisticTreeModule.nodeItemCount(var1)
			
			if var2 == 0 then
				var1 = weightedOrderStatisticTreeModule.newNode(1, p6)
				
				return
			elseif p6 ~= nil then
				var1 = insertMeasuredAt(var1, p5, p6)
				
				return
			elseif p5 <= var2 then
				local _ = nil
				local var3, var4 = growUnmeasuredRun(var1, p5)
				var1 = var3
				
				if var4 then return end
			end
			if p5 > 1 then
				local _ = nil
				local var5, var6 = growUnmeasuredRun(var1, p5 - 1)
				var1 = var5
				
				if var6 then
					return
				end
			end
			local var7, var8 = weightedOrderStatisticTreeModule.splitByItems(var1, p5 - 1)
			var1 = concatenateMergingUnmeasured(concatenateMergingUnmeasured(var7, weightedOrderStatisticTreeModule.newNode(1, nil)), var8)
		end,
		remove = function(p5)
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), shrinkUnmeasuredRun (copy), concatenateMergingUnmeasured (copy)
			if p5 < 1 or weightedOrderStatisticTreeModule.nodeItemCount(var1) < p5 then return end
			local _ = nil
			local var2, var3 = shrinkUnmeasuredRun(var1, p5)
			var1 = var2
			
			if var3 then
				return
			end
			local var4, var5 = weightedOrderStatisticTreeModule.splitByItems(var1, p5 - 1)
			local _, var6 = weightedOrderStatisticTreeModule.splitByItems(var5, 1)
			var1 = concatenateMergingUnmeasured(var4, var6)
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
			local t = {}
			
			for i = 1, p6 do
				local var2 = p7(i)
				local var3 = t[#t]
				
				if var2 == nil and var3 ~= nil and var3.measuredSize == nil then
					var3.itemCount += 1
				else
					table.insert(t, { itemCount = 1, measuredSize = var2 })
				end
			end
			var1 = weightedOrderStatisticTreeModule.buildBalanced(t, 1, #t)
		end,
		toArray = function()
			-- upvalues: length (ref), weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			local list = table.create(length())
			weightedOrderStatisticTreeModule.appendToArray(var1, list, p1)
			
			return list
		end,
		setEstimatedItemLength = function(value)
			-- upvalues: p1 (write), weightedOrderStatisticTreeModule (copy), var1 (write)
			local var4 = p1 ~= value and weightedOrderStatisticTreeModule.nodeMeasuredCount(var1) < weightedOrderStatisticTreeModule.nodeItemCount(var1)
			p1 = value
			
			return var4
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
			local var4 = weightedOrderStatisticTreeModule.nodeItemCount(var1)
			
			return if var4 == 0 then false else p8 * math.log(math.max(weightedOrderStatisticTreeModule.nodeCount(var1), 2), 2) < var4
		end,
		length = length,
		totalSum = function()
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write), p1 (write)
			return weightedOrderStatisticTreeModule.nodeEffectiveSum(var1, p1)
		end,
		getNodeCount = function()
			-- upvalues: weightedOrderStatisticTreeModule (copy), var1 (write)
			return weightedOrderStatisticTreeModule.nodeCount(var1)
		end
	}
end

return t