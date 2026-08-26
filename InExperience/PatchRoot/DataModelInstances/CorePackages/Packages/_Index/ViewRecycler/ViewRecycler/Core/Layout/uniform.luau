local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

return function(p1)
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	assert(p1.itemLength > 0, "Layout.uniform: itemLength must be positive")
	local itemLength = p1.itemLength
	local spacing = p1.spacing or 0
	local paddingBefore = p1.paddingBefore or 0
	local paddingAfter = p1.paddingAfter or 0
	local var1 = itemLength + spacing
	local var2 = 0
	
	return {
		getItemCount = function()
			-- upvalues: var2 (write)
			return var2
		end,
		getContentLength = function()
			-- upvalues: var2 (write), paddingBefore (ref), itemLength (ref), spacing (ref), paddingAfter (ref)
			return if var2 == 0 then 0 else paddingBefore + var2 * itemLength + (var2 - 1) * spacing + paddingAfter
		end,
		getIntersectingIndexRange = function(p2, p3)
			-- upvalues: var2 (write), typesModule (copy), paddingBefore (ref), var1 (ref), itemLength (ref)
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
			local minValue = math.min(var2, var6)
			
			return if minValue < maxValue then typesModule.EMPTY_INDEX_RANGE else { firstIndex = maxValue, lastIndex = minValue }
		end,
		expandIndexRange = function(p2, p3, p4)
			-- upvalues: staticPartsModule (copy), var2 (write)
			return staticPartsModule.expandItemRange(p2, p3, p4 or p3, var2)
		end,
		getItemLayout = function(p2)
			-- upvalues: paddingBefore (ref), var1 (ref), itemLength (ref)
			return {
				startOffset = paddingBefore + (p2 - 1) * var1,
				length = itemLength
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
		setViewportCrossAxisLength = staticPartsModule.geometryUnchanged,
		destroy = staticPartsModule.noop
	}
end