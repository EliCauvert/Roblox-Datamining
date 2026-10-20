local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local TypesModule = require(ViewRecycler.Core.Types)
local StaticPartsModule = require(ViewRecycler.Core.Layout.staticParts)

return function(p1)
	-- upvalues: TypesModule (copy), DataSourceChangeTypeModule (copy), StaticPartsModule (copy)
	assert(p1.itemLength > 0, "Layout.uniform: itemLength must be positive")
	local ItemLength = p1.itemLength
	local Spacing = p1.spacing or 0
	local PaddingBefore = p1.paddingBefore or 0
	local PaddingAfter = p1.paddingAfter or 0
	local NewItemLength = ItemLength + Spacing
	local CountKeys = 0
	
	return {
		getItemCount = function()
			-- upvalues: CountKeys (ref)
			return CountKeys
		end,
		getContentLength = function()
			-- upvalues: CountKeys (ref), PaddingBefore (copy), ItemLength (copy), Spacing (copy), PaddingAfter (copy)
			return if CountKeys == 0 then 0 else PaddingBefore + CountKeys * ItemLength + (CountKeys - 1) * Spacing + PaddingAfter
		end,
		getIntersectingIndexRange = function(p2, p3)
			-- upvalues: CountKeys (ref), TypesModule (upval), PaddingBefore (copy), NewItemLength (copy), ItemLength (copy)
			if CountKeys == 0 or p3 <= p2 then
				return TypesModule.EMPTY_INDEX_RANGE
			end
			local Count = 1
			local v1 = p2 - PaddingBefore
			
			if v1 > 0 then
				Count = v1 // NewItemLength + 1
				
				if PaddingBefore + (Count - 1) * NewItemLength + ItemLength <= p2 then
					Count += 1
				end
			end
			local v2 = p3 - PaddingBefore
			
			if v2 <= 0 then
				return TypesModule.EMPTY_INDEX_RANGE
			end
			local NewNewItemLength = v2 // NewItemLength + 1
			
			if p3 <= PaddingBefore + (NewNewItemLength - 1) * NewItemLength then
				NewNewItemLength -= 1
			end
			local Largest = math.max(1, Count)
			local Smallest = math.min(CountKeys, NewNewItemLength)
			
			return if Smallest < Largest then TypesModule.EMPTY_INDEX_RANGE else { firstIndex = Largest, lastIndex = Smallest }
		end,
		expandIndexRange = function(p2, p3, p4)
			-- upvalues: StaticPartsModule (upval), CountKeys (ref)
			return StaticPartsModule.expandItemRange(p2, p3, p4 or p3, CountKeys)
		end,
		getItemLayout = function(p2: number)
			-- upvalues: PaddingBefore (copy), NewItemLength (copy), ItemLength (copy)
			return {
				startOffset = PaddingBefore + (p2 - 1) * NewItemLength,
				length = ItemLength
			}
		end,
		getItemLayouts = function(p2: number, p3, p4)
			-- upvalues: PaddingBefore (copy), NewItemLength (copy), ItemLength (copy)
			for i = p2, p3 do
				p4[i - p2 + 1] = {
					startOffset = PaddingBefore + (i - 1) * NewItemLength,
					length = ItemLength
				}
			end
		end,
		updateItemMeasurement = StaticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = StaticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p5): boolean
			-- upvalues: CountKeys (ref), DataSourceChangeTypeModule (upval)
			local CountKeys1: number = CountKeys
			
			if p5.type == DataSourceChangeTypeModule.Reset then
				CountKeys = #p5.keys
			elseif p5.type == DataSourceChangeTypeModule.Insert then
				CountKeys += #p5.keys
			elseif p5.type == DataSourceChangeTypeModule.Remove then
				CountKeys -= #p5.keys
			end
			return CountKeys ~= CountKeys1
		end,
		setViewportCrossAxisLength = StaticPartsModule.geometryUnchanged,
		destroy = StaticPartsModule.noop
	}
end