local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

return function(p0)
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	assert(p0.itemLength > 0, "Layout.uniform: itemLength must be positive")
	local itemLength = p0.itemLength
	local spacing = p0.spacing or 0
	local paddingBefore = p0.paddingBefore or 0
	local paddingAfter = p0.paddingAfter or 0
	local var7 = itemLength + spacing
	local var8 = 0
	
	return {
		getItemCount = function()
			-- upvalues: var8 (write)
			return var8
		end,
		getContentLength = function()
			-- upvalues: var8 (write), paddingBefore (ref), itemLength (ref), spacing (ref), paddingAfter (ref)
			return if var8 == 0 then 0 else paddingBefore + var8 * itemLength + (var8 - 1) * spacing + paddingAfter
		end,
		getIntersectingIndexRange = function(p1, p2)
			-- upvalues: var8 (write), typesModule (copy), paddingBefore (ref), var7 (ref), itemLength (ref)
			if var8 == 0 or p2 <= p1 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var9 = 1
			local var10 = p1 - paddingBefore
			
			if var10 > 0 then
				var9 = var10 // var7 + 1
				
				if paddingBefore + (var9 - 1) * var7 + itemLength <= p1 then
					var9 += 1
				end
			end
			local var11 = p2 - paddingBefore
			
			if var11 <= 0 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var12 = var11 // var7 + 1
			
			if p2 <= paddingBefore + (var12 - 1) * var7 then
				var12 -= 1
			end
			local maxValue = math.max(1, var9)
			local minValue = math.min(var8, var12)
			
			return if minValue < maxValue then typesModule.EMPTY_INDEX_RANGE else { firstIndex = maxValue, lastIndex = minValue }
		end,
		expandIndexRange = function(p3, p4, p5)
			-- upvalues: staticPartsModule (copy), var8 (write)
			return staticPartsModule.expandItemRange(p3, p4, p5 or p4, var8)
		end,
		getItemLayout = function(p6)
			-- upvalues: paddingBefore (ref), var7 (ref), itemLength (ref)
			return {
				startOffset = paddingBefore + (p6 - 1) * var7,
				length = itemLength
			}
		end,
		updateItemMeasurement = staticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = staticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p7)
			-- upvalues: var8 (write), dataSourceChangeTypeModule (copy)
			if p7.type == dataSourceChangeTypeModule.Reset then
				var8 = #p7.keys
			elseif p7.type == dataSourceChangeTypeModule.Insert then
				var8 += #p7.keys
			elseif p7.type == dataSourceChangeTypeModule.Remove then
				var8 -= #p7.keys
			end
			return var8 ~= var8
		end,
		setViewportCrossAxisLength = staticPartsModule.geometryUnchanged,
		destroy = staticPartsModule.noop
	}
end