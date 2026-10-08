local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

return function(p1)
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	assert(p1.itemLength > 0, "Layout.grid: itemLength must be positive")
	assert(p1.crossAxisCount ~= nil ~= (p1.crossAxisItemLength ~= nil), "Layout.grid: provide exactly one of crossAxisCount or crossAxisItemLength")
	local itemLength = p1.itemLength
	local spacing = p1.spacing or 0
	local paddingBefore = p1.paddingBefore or 0
	local paddingAfter = p1.paddingAfter or 0
	local var1 = itemLength + spacing
	local crossAxisCount = p1.crossAxisCount or 1
	local var2 = 0
	
	local function _()
		-- upvalues: var2 (write), crossAxisCount (write)
		return math.ceil(var2 / crossAxisCount)
	end
	
	return {
		getItemCount = function()
			-- upvalues: var2 (write)
			return var2
		end,
		getContentLength = function()
			-- upvalues: var2 (write), crossAxisCount (write), paddingBefore (ref), itemLength (ref), spacing (ref), paddingAfter (ref)
			local ceiled = math.ceil(var2 / crossAxisCount)
			
			return if ceiled == 0 then 0 else paddingBefore + ceiled * itemLength + (ceiled - 1) * spacing + paddingAfter
		end,
		getIntersectingIndexRange = function(p2, p3)
			-- upvalues: var2 (write), typesModule (copy), paddingBefore (ref), var1 (ref), itemLength (ref), crossAxisCount (write)
			if var2 == 0 or p3 <= p2 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var3 = 1
			local var4 = p2 - paddingBefore
			
			if var4 > 0 then
				var3 = var4 // var1 + 1
				
				if paddingBefore + (var3 - 1) * var1 + itemLength <= p2 then
					var3 += 1
				end
			end
			local var5 = p3 - paddingBefore
			
			if var5 <= 0 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var6 = var5 // var1 + 1
			
			if p3 <= paddingBefore + (var6 - 1) * var1 then
				var6 -= 1
			end
			local maxValue = math.max(1, var3)
			local minValue = math.min(math.ceil(var2 / crossAxisCount), var6)
			
			return if minValue < maxValue then typesModule.EMPTY_INDEX_RANGE else {
				firstIndex = (maxValue - 1) * crossAxisCount + 1,
				lastIndex = math.min(var2, minValue * crossAxisCount)
			}
		end,
		expandIndexRange = function(p2, p3, p4)
			-- upvalues: crossAxisCount (write), var2 (write)
			return {
				firstIndex = (math.max(1, (p2.firstIndex - 1) // crossAxisCount + 1 - p3) - 1) * crossAxisCount + 1,
				lastIndex = math.min(var2, math.min(math.ceil(var2 / crossAxisCount), (p2.lastIndex - 1) // crossAxisCount + 1 + (p4 or p3)) * crossAxisCount)
			}
		end,
		getItemLayout = function(p2)
			-- upvalues: crossAxisCount (write), paddingBefore (ref), var1 (ref), itemLength (ref)
			return {
				startOffset = paddingBefore + ((p2 - 1) // crossAxisCount + 1 - 1) * var1,
				length = itemLength,
				crossAxisIndex = (p2 - 1) % crossAxisCount + 1,
				crossAxisCount = crossAxisCount
			}
		end,
		updateItemMeasurement = staticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = staticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p2)
			-- upvalues: var2 (write), dataSourceChangeTypeModule (copy)
			if p2.type == dataSourceChangeTypeModule.Reset then
				var2 = #p2.keys
			elseif p2.type == dataSourceChangeTypeModule.Insert then
				var2 += #p2.keys
			elseif p2.type == dataSourceChangeTypeModule.Remove then
				var2 -= #p2.keys
			end
			return var2 ~= var2
		end,
		setViewportCrossAxisLength = function(vectorA)
			-- upvalues: p1 (ref), crossAxisCount (write)
			if p1.crossAxisItemLength == nil then
				return false
			end
			local maxValue = math.max(1, vectorA // p1.crossAxisItemLength)
			
			if maxValue == crossAxisCount then
				return false
			end
			crossAxisCount = maxValue
			
			return true
		end,
		destroy = staticPartsModule.noop
	}
end