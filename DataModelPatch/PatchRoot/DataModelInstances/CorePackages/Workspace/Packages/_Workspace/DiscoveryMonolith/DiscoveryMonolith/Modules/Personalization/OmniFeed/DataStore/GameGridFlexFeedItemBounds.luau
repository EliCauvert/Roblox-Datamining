local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local GameCollectionItemTypes = require(Parent.GameCollections).GameCollectionItemTypes
local SpanForItemType = GameCollectionItemTypes.SpanForItemType
local CalculateSpanAwareGridsFunction = require(Parent.CollectionViews).calculateSpanAwareGrids
local Modules = DiscoveryMonolith.Modules
local SetGameGridFlexFeedItemInputModule = require(Modules.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput)
local ClearGameGridFlexFeedItemBoundsModule = require(Modules.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds)
local FFlagLuaAppApportioningInCollectionViews = require(Parent.SharedFlags).FFlagLuaAppApportioningInCollectionViews
local config = {
	[GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = { colSpan = 2, rowSpan = 1 }
}

local function getSpanConfig(p1)
	-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (copy), SpanForItemType (copy), config (copy)
	local SpanForItemTypeEntry = p1 and (if FFlagLuaAppEnableNxMRoduxApportioning then SpanForItemType[p1.componentType] else config[p1.componentType])
	
	return if SpanForItemTypeEntry then {
		colSpan = SpanForItemTypeEntry.colSpan,
		rowSpan = if FFlagLuaAppEnableNxMRoduxApportioning then SpanForItemTypeEntry.rowSpan else 1,
		minRowPadding = tonumber(p1.minRowPadding) or 0,
		alignmentType = p1.alignmentType
	} else nil
end

local function countPlacedTiles(Layout): number
	local Count = 0
	
	for _, value in Layout do
		for _, value1 in value do
			if value1 > 0 then
				Count += 1
			end
		end
	end
	return Count
end

local function recalculateFlexBounds(FlexItemsBounds, FlexItemsInput, Entries, ItemsPerRow)
	-- upvalues: CryoModule (copy), CalculateSpanAwareGridsFunction (copy), FFlagLuaAppApportioningInCollectionViews (copy), getSpanConfig (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), countPlacedTiles (copy)
	local JoinResult = CryoModule.Dictionary.join(FlexItemsBounds or {})
	local List = {}
	
	for _, value in ipairs(FlexItemsInput) do
		table.insert(List, { sortKey = value.sortKey, maxRows = value.numberOfRows })
	end
	local SpanAwareGrids = CalculateSpanAwareGridsFunction(Entries, List, ItemsPerRow, if FFlagLuaAppApportioningInCollectionViews then getSpanConfig else nil)
	local FirstIndex = 1
	
	for _, value1 in ipairs(List) do
		local SortKey = value1.sortKey
		local SpanAwareGrid = SpanAwareGrids[SortKey]
		
		if SpanAwareGrid then
			if FFlagLuaAppEnableNxMRoduxApportioning then
				local Layout = SpanAwareGrid.layout or {}
				JoinResult[SortKey] = { firstIndex = FirstIndex, layout = Layout }
				FirstIndex += countPlacedTiles(Layout)
			else
				JoinResult[SortKey] = {
					entryIndices = SpanAwareGrid.entryIndices,
					firstIndex = FirstIndex
				}
				FirstIndex += #SpanAwareGrid.entryIndices
			end
		end
	end
	return JoinResult
end

return function(p1, p2)
	-- upvalues: SetGameGridFlexFeedItemInputModule (copy), recalculateFlexBounds (copy), CryoModule (copy), ClearGameGridFlexFeedItemBoundsModule (copy)
	local P6 = p1 or {}
	
	if p2.type == SetGameGridFlexFeedItemInputModule.name then
		local Entry = P6[p2.topicId] or {}
		local List = {}
		local Flag = false
		
		for _, value in ipairs(Entry.flexItemsInput or {}) do
			if Flag then
				table.insert(List, value)
			elseif value.sortKey == p2.sortIndex then
				table.insert(List, { sortKey = p2.sortIndex, numberOfRows = p2.numberOfRows })
				Flag = true
			elseif p2.sortIndex < value.sortKey then
				table.insert(List, { sortKey = p2.sortIndex, numberOfRows = p2.numberOfRows })
				table.insert(List, value)
				Flag = true
			else
				table.insert(List, value)
			end
		end
		if not Flag then
			table.insert(List, { sortKey = p2.sortIndex, numberOfRows = p2.numberOfRows })
		end
		P6 = CryoModule.Dictionary.join(P6, {
			[p2.topicId] = {
				flexItemsInput = List,
				flexItemsBounds = recalculateFlexBounds(Entry.flexItemsBounds, List, p2.entries, p2.itemsPerRow)
			}
		})
		
		return P6
	else
		if p2.type == ClearGameGridFlexFeedItemBoundsModule.name then
			local Entry = P6[p2.topicId] or {}
			local FlexItemsInput = {}
			
			for _, value1 in ipairs(Entry.flexItemsInput or {}) do
				if value1.sortKey ~= p2.sortIndex then
					table.insert(FlexItemsInput, value1)
				end
			end
			P6 = CryoModule.Dictionary.join(P6, {
				[p2.topicId] = {
					flexItemsInput = FlexItemsInput,
					flexItemsBounds = recalculateFlexBounds(Entry.flexItemsBounds, FlexItemsInput, p2.entries, p2.itemsPerRow)
				}
			})
		end
		return P6
	end
end