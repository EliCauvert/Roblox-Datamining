local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

return function(p1)
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	local getItemLayout = p1.getItemLayout
	local var1 = 0
	
	return {
		getItemCount = function()
			-- upvalues: var1 (write)
			return var1
		end,
		getContentLength = function()
			-- upvalues: var1 (write), getItemLayout (ref)
			if var1 == 0 then
				return 0
			end
			local var2 = getItemLayout(var1)
			
			return var2.startOffset + var2.length
		end,
		getIntersectingIndexRange = function(p2, p3)
			-- upvalues: var1 (write), typesModule (copy), getItemLayout (ref)
			if var1 == 0 or p3 <= p2 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var2 = 1
			local var3 = var1
			while var2 < var3 do
				local var4 = (var2 + var3) // 2
				local var5 = getItemLayout(var4)
				
				if p2 < var5.startOffset + var5.length then
					var3 = var4
				else
					var2 = var4 + 1
				end
			end
			local var6 = getItemLayout(var2)
			
			if var6.startOffset + var6.length <= p2 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var7 = 1
			local var8 = var1
			while var7 < var8 do
				local var9 = (var7 + var8 + 1) // 2
				
				if getItemLayout(var9).startOffset < p3 then
					var7 = var9
				else
					var8 = var9 - 1
				end
			end
			return if p3 <= getItemLayout(var7).startOffset or var7 < var2 then typesModule.EMPTY_INDEX_RANGE else { firstIndex = var2, lastIndex = var7 }
		end,
		expandIndexRange = function(p4, p5, p6)
			-- upvalues: staticPartsModule (copy), var1 (write)
			return staticPartsModule.expandItemRange(p4, p5, p6 or p5, var1)
		end,
		getItemLayout = getItemLayout,
		updateItemMeasurement = staticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = staticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p4)
			-- upvalues: dataSourceChangeTypeModule (copy), var1 (write)
			if p4.type == dataSourceChangeTypeModule.Reset then
				var1 = #p4.keys
			elseif p4.type == dataSourceChangeTypeModule.Insert then
				var1 += #p4.keys
			elseif p4.type == dataSourceChangeTypeModule.Remove then
				var1 -= #p4.keys
			end
			return true
		end,
		setViewportCrossAxisLength = staticPartsModule.geometryUnchanged,
		destroy = staticPartsModule.noop
	}
end