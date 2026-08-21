local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

return function(p0) --[[ line: 26 | named "grid" ]]
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	assert(p0.itemLength > 0, "Layout.grid: itemLength must be positive")
	assert(p0.crossAxisCount ~= nil ~= (p0.crossAxisItemLength ~= nil), "Layout.grid: provide exactly one of crossAxisCount or crossAxisItemLength")
	local itemLength = p0.itemLength
	local spacing = p0.spacing or 0
	local paddingBefore = p0.paddingBefore or 0
	local paddingAfter = p0.paddingAfter or 0
	local var7 = itemLength + spacing
	local crossAxisCount = p0.crossAxisCount or 1
	local var9 = 0
	
	local function _() --[[ line: 42 | named "rowCount" ]]
		-- upvalues: var9 (write), crossAxisCount (write)
		return math.ceil(var9 / crossAxisCount)
	end
	
	return {
		getItemCount = function() --[[ line: 46 ]]
			-- upvalues: var9 (write)
			return var9
		end,
		getContentLength = function() --[[ line: 50 ]]
			-- upvalues: var9 (write), crossAxisCount (write), paddingBefore (ref), itemLength (ref), spacing (ref), paddingAfter (ref)
			local ceiled = math.ceil(var9 / crossAxisCount)
			
			return if ceiled == 0 then 0 else paddingBefore + ceiled * itemLength + (ceiled - 1) * spacing + paddingAfter
		end,
		getIntersectingIndexRange = function(p1, p2) --[[ line: 68 ]]
			-- upvalues: var9 (write), typesModule (copy), paddingBefore (ref), var7 (ref), itemLength (ref), crossAxisCount (write)
			if var9 == 0 or p2 <= p1 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var11 = 1
			local var12 = p1 - paddingBefore
			
			if var12 > 0 then
				var11 = var12 // var7 + 1
				
				if paddingBefore + (var11 - 1) * var7 + itemLength <= p1 then
					var11 += 1
				end
			end
			local var13 = p2 - paddingBefore
			
			if var13 <= 0 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var14 = var13 // var7 + 1
			
			if p2 <= paddingBefore + (var14 - 1) * var7 then
				var14 -= 1
			end
			local maxValue = math.max(1, var11)
			local minValue = math.min(math.ceil(var9 / crossAxisCount), var14)
			
			return if minValue < maxValue then typesModule.EMPTY_INDEX_RANGE else {
				firstIndex = (maxValue - 1) * crossAxisCount + 1,
				lastIndex = math.min(var9, minValue * crossAxisCount)
			}
		end,
		expandIndexRange = function(p3, p4, p5) --[[ line: 104 ]]
			-- upvalues: crossAxisCount (write), var9 (write)
			return {
				firstIndex = (math.max(1, (p3.firstIndex - 1) // crossAxisCount + 1 - p4) - 1) * crossAxisCount + 1,
				lastIndex = math.min(var9, math.min(math.ceil(var9 / crossAxisCount), (p3.lastIndex - 1) // crossAxisCount + 1 + (p5 or p4)) * crossAxisCount)
			}
		end,
		getItemLayout = function(p6) --[[ line: 58 ]]
			-- upvalues: crossAxisCount (write), paddingBefore (ref), var7 (ref), itemLength (ref)
			return {
				startOffset = paddingBefore + ((p6 - 1) // crossAxisCount + 1 - 1) * var7,
				length = itemLength,
				crossAxisIndex = (p6 - 1) % crossAxisCount + 1,
				crossAxisCount = crossAxisCount
			}
		end,
		updateItemMeasurement = staticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = staticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p7) --[[ line: 116 ]]
			-- upvalues: var9 (write), dataSourceChangeTypeModule (copy)
			if p7.type == dataSourceChangeTypeModule.Reset then
				var9 = #p7.keys
			elseif p7.type == dataSourceChangeTypeModule.Insert then
				var9 += #p7.keys
			elseif p7.type == dataSourceChangeTypeModule.Remove then
				var9 -= #p7.keys
			end
			return var9 ~= var9
		end,
		setViewportCrossAxisLength = function(vectorA) --[[ line: 128 ]]
			-- upvalues: p0 (ref), crossAxisCount (write)
			if p0.crossAxisItemLength == nil then
				return false
			end
			local maxValue = math.max(1, vectorA // p0.crossAxisItemLength)
			
			if maxValue == crossAxisCount then
				return false
			end
			crossAxisCount = maxValue
			
			return true
		end,
		destroy = staticPartsModule.noop
	}
end