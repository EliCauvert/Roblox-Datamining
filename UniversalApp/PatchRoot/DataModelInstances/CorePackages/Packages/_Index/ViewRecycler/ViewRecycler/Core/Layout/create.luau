local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

return function(p0)
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	local getItemLayout = p0.getItemLayout
	local var4 = 0
	
	return {
		getItemCount = function()
			-- upvalues: var4 (write)
			return var4
		end,
		getContentLength = function()
			-- upvalues: var4 (write), getItemLayout (ref)
			if var4 == 0 then
				return 0
			end
			local var5 = getItemLayout(var4)
			
			return var5.startOffset + var5.length
		end,
		getIntersectingIndexRange = function(p1, p2)
			-- upvalues: var4 (write), typesModule (copy), getItemLayout (ref)
			if var4 == 0 or p2 <= p1 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var6 = 1
			local var7 = var4
			while var6 < var7 do
				local var8 = (var6 + var7) // 2
				local var9 = getItemLayout(var8)
				
				if p1 < var9.startOffset + var9.length then
					var7 = var8
				else
					var6 = var8 + 1
				end
			end
			local var10 = getItemLayout(var6)
			
			if var10.startOffset + var10.length <= p1 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var11 = 1
			local var12 = var4
			while var11 < var12 do
				local var13 = (var11 + var12 + 1) // 2
				
				if getItemLayout(var13).startOffset < p2 then
					var11 = var13
				else
					var12 = var13 - 1
				end
			end
			return if p2 <= getItemLayout(var11).startOffset or var11 < var6 then typesModule.EMPTY_INDEX_RANGE else { firstIndex = var6, lastIndex = var11 }
		end,
		expandIndexRange = function(p3, p4, p5)
			-- upvalues: staticPartsModule (copy), var4 (write)
			return staticPartsModule.expandItemRange(p3, p4, p5 or p4, var4)
		end,
		getItemLayout = getItemLayout,
		updateItemMeasurement = staticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = staticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p6)
			-- upvalues: dataSourceChangeTypeModule (copy), var4 (write)
			if p6.type == dataSourceChangeTypeModule.Reset then
				var4 = #p6.keys
			elseif p6.type == dataSourceChangeTypeModule.Insert then
				var4 += #p6.keys
			elseif p6.type == dataSourceChangeTypeModule.Remove then
				var4 -= #p6.keys
			end
			return true
		end,
		setViewportCrossAxisLength = staticPartsModule.geometryUnchanged,
		destroy = staticPartsModule.noop
	}
end