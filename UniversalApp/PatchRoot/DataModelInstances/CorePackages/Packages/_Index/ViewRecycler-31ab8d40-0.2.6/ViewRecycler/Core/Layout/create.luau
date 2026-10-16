local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local TypesModule = require(ViewRecycler.Core.Types)
local StaticPartsModule = require(ViewRecycler.Core.Layout.staticParts)

return function(p1) --[[ Line: 17 | Named "create" ]]
	-- upvalues: TypesModule (copy), DataSourceChangeTypeModule (copy), StaticPartsModule (copy)
	local GetItemLayoutFunction = p1.getItemLayout
	local CountKeys = 0
	
	return {
		getItemCount = function() --[[ Line: 21 ]]
			-- upvalues: CountKeys (ref)
			return CountKeys
		end,
		getContentLength = function() --[[ Line: 25 ]]
			-- upvalues: CountKeys (ref), GetItemLayoutFunction (copy)
			if CountKeys == 0 then
				return 0
			else
				local ItemLayout = GetItemLayoutFunction(CountKeys)
				
				return ItemLayout.startOffset + ItemLayout.length
			end
		end,
		getIntersectingIndexRange = function(p2, p3) --[[ Line: 33 ]]
			-- upvalues: CountKeys (ref), TypesModule (upval), GetItemLayoutFunction (copy)
			if CountKeys == 0 or p3 <= p2 then
				return TypesModule.EMPTY_INDEX_RANGE
			end
			local v1 = 1
			local CountKeys1: number = CountKeys
			while v1 < CountKeys1 do
				local CountKeysRatio = (v1 + CountKeys1) // 2
				local ItemLayout = GetItemLayoutFunction(CountKeysRatio)
				
				if p2 < ItemLayout.startOffset + ItemLayout.length then
					CountKeys1 = CountKeysRatio
				else
					v1 = CountKeysRatio + 1
				end
			end
			local FirstIndex: number = v1
			local ItemLayout = GetItemLayoutFunction(FirstIndex)
			
			if ItemLayout.startOffset + ItemLayout.length <= p2 then
				return TypesModule.EMPTY_INDEX_RANGE
			end
			local LastIndex = 1
			local CountKeys2: number = CountKeys
			while LastIndex < CountKeys2 do
				local LastIndexRatio = (LastIndex + CountKeys2 + 1) // 2
				
				if GetItemLayoutFunction(LastIndexRatio).startOffset < p3 then
					LastIndex = LastIndexRatio
				else
					CountKeys2 = LastIndexRatio - 1
				end
			end
			return if p3 <= GetItemLayoutFunction(LastIndex).startOffset or LastIndex < FirstIndex then TypesModule.EMPTY_INDEX_RANGE else { firstIndex = FirstIndex, lastIndex = LastIndex }
		end,
		expandIndexRange = function(p4, p5, p6) --[[ Line: 90 ]]
			-- upvalues: StaticPartsModule (upval), CountKeys (ref)
			return StaticPartsModule.expandItemRange(p4, p5, p6 or p5, CountKeys)
		end,
		getItemLayout = GetItemLayoutFunction,
		updateItemMeasurement = StaticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = StaticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p4): boolean --[[ Line: 73 ]]
			-- upvalues: DataSourceChangeTypeModule (upval), CountKeys (ref)
			if p4.type == DataSourceChangeTypeModule.Reset then
				CountKeys = #p4.keys
			elseif p4.type == DataSourceChangeTypeModule.Insert then
				CountKeys += #p4.keys
			elseif p4.type == DataSourceChangeTypeModule.Remove then
				CountKeys -= #p4.keys
			end
			return true
		end,
		setViewportCrossAxisLength = StaticPartsModule.geometryUnchanged,
		destroy = StaticPartsModule.noop
	}
end