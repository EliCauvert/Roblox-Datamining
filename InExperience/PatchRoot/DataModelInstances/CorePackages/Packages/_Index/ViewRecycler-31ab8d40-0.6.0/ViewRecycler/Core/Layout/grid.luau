local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local TypesModule = require(ViewRecycler.Core.Types)
local StaticPartsModule = require(ViewRecycler.Core.Layout.staticParts)

return function(p1) --[[ Line: 26 | Named "grid" ]]
	-- upvalues: TypesModule (copy), DataSourceChangeTypeModule (copy), StaticPartsModule (copy)
	assert(p1.itemLength > 0, "Layout.grid: itemLength must be positive")
	assert(p1.crossAxisCount ~= nil ~= (p1.crossAxisItemLength ~= nil), "Layout.grid: provide exactly one of crossAxisCount or crossAxisItemLength")
	local ItemLength = p1.itemLength
	local Spacing = p1.spacing or 0
	local PaddingBefore = p1.paddingBefore or 0
	local PaddingAfter = p1.paddingAfter or 0
	local NewItemLength = ItemLength + Spacing
	local CrossAxisCount = p1.crossAxisCount or 1
	local CountKeys = 0
	
	local function _(): number --[[ Line: 42 | Named "rowCount" ]]
		-- upvalues: CountKeys (ref), CrossAxisCount (ref)
		return (math.ceil(CountKeys / CrossAxisCount))
	end
	
	return {
		getItemCount = function() --[[ Line: 46 ]]
			-- upvalues: CountKeys (ref)
			return CountKeys
		end,
		getContentLength = function() --[[ Line: 50 ]]
			-- upvalues: CountKeys (ref), CrossAxisCount (ref), PaddingBefore (copy), ItemLength (copy), Spacing (copy), PaddingAfter (copy)
			local Ceiled = math.ceil(CountKeys / CrossAxisCount)
			
			return if Ceiled == 0 then 0 else PaddingBefore + Ceiled * ItemLength + (Ceiled - 1) * Spacing + PaddingAfter
		end,
		getIntersectingIndexRange = function(p2, p3) --[[ Line: 68 ]]
			-- upvalues: CountKeys (ref), TypesModule (upval), PaddingBefore (copy), NewItemLength (copy), ItemLength (copy), CrossAxisCount (ref)
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
			local Smallest = math.min(math.ceil(CountKeys / CrossAxisCount), NewNewItemLength)
			
			return if Smallest < Largest then TypesModule.EMPTY_INDEX_RANGE else {
				firstIndex = (Largest - 1) * CrossAxisCount + 1,
				lastIndex = math.min(CountKeys, Smallest * CrossAxisCount)
			}
		end,
		expandIndexRange = function(p2, p3, p4) --[[ Line: 104 ]]
			-- upvalues: CrossAxisCount (ref), CountKeys (ref)
			return {
				firstIndex = (math.max(1, (p2.firstIndex - 1) // CrossAxisCount + 1 - p3) - 1) * CrossAxisCount + 1,
				lastIndex = math.min(CountKeys, math.min(math.ceil(CountKeys / CrossAxisCount), (p2.lastIndex - 1) // CrossAxisCount + 1 + (p4 or p3)) * CrossAxisCount)
			}
		end,
		getItemLayout = function(p2: number) --[[ Line: 58 ]]
			-- upvalues: CrossAxisCount (ref), PaddingBefore (copy), NewItemLength (copy), ItemLength (copy)
			return {
				startOffset = PaddingBefore + ((p2 - 1) // CrossAxisCount + 1 - 1) * NewItemLength,
				length = ItemLength,
				crossAxisIndex = (p2 - 1) % CrossAxisCount + 1,
				crossAxisCount = CrossAxisCount
			}
		end,
		updateItemMeasurement = StaticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = StaticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p2): boolean --[[ Line: 116 ]]
			-- upvalues: CountKeys (ref), DataSourceChangeTypeModule (upval)
			local CountKeys1: number = CountKeys
			
			if p2.type == DataSourceChangeTypeModule.Reset then
				CountKeys = #p2.keys
			elseif p2.type == DataSourceChangeTypeModule.Insert then
				CountKeys += #p2.keys
			elseif p2.type == DataSourceChangeTypeModule.Remove then
				CountKeys -= #p2.keys
			end
			return CountKeys ~= CountKeys1
		end,
		setViewportCrossAxisLength = function(p2: number): boolean --[[ Line: 128 ]]
			-- upvalues: p1 (copy), CrossAxisCount (ref)
			if p1.crossAxisItemLength == nil then
				return false
			end
			local Largest = math.max(1, p2 // p1.crossAxisItemLength)
			
			if Largest == CrossAxisCount then
				return false
			else
				CrossAxisCount = Largest
				
				return true
			end
		end,
		destroy = StaticPartsModule.noop
	}
end