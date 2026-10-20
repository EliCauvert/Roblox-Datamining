local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataSource)
local _ = require(ViewRecycler.Core.Layout)
local PlacementTypesModule = require(ViewRecycler.Core.Placement.PlacementTypes)
local Frozen = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = table.freeze({}),
	additionalAssignments = table.freeze({}),
	placements = table.freeze({})
})

return function(p1)
	-- upvalues: Frozen (copy), PlacementTypesModule (copy)
	if #p1.stickyIndices == 0 and p1.pinnedStartItem == nil and p1.pinnedEndItem == nil then
		return Frozen
	end
	local RetainedItems = {}
	local AdditionalAssignments = {}
	local Placements = {}
	local Length = if p1.pinnedStartItem == nil then 0 else p1.pinnedStartItem.length
	local v1 = 0
	local v2 = 1
	local CountStickyIndices = #p1.stickyIndices
	while v2 <= CountStickyIndices do
		local Floored = math.floor((v2 + CountStickyIndices) / 2)
		
		if p1.layout.getItemLayout(p1.stickyIndices[Floored]).startOffset + p1.contentStartOffset - p1.scrollOffset < Length then
			v1 = Floored
			v2 = Floored + 1
		else
			CountStickyIndices = Floored - 1
		end
	end
	if v1 > 0 then
		local StickyIndice = p1.stickyIndices[v1]
		local ItemLayout = p1.layout.getItemLayout(StickyIndice)
		local Smallest: number = Length
		local StickyIndice1 = p1.stickyIndices[v1 + 1]
		
		if StickyIndice1 ~= nil then
			Smallest = math.min(Length, p1.layout.getItemLayout(StickyIndice1).startOffset + p1.contentStartOffset - p1.scrollOffset - ItemLayout.length)
		end
		local ItemKey = p1.dataSource.getItemKey(StickyIndice)
		table.insert(RetainedItems, { key = ItemKey, index = StickyIndice })
		Placements[ItemKey] = {
			viewportRelative = true,
			zIndex = 1,
			mainAxisOffset = Smallest,
			mainAxisLength = ItemLayout.length
		}
	end
	for _, value in { p1.pinnedStartItem, p1.pinnedEndItem } do
		if value ~= nil then
			table.insert(AdditionalAssignments, {
				key = value.key,
				value = value.value,
				itemViewType = value.itemViewType,
				identity = {
					kind = PlacementTypesModule.IdentityKind.Pinned,
					position = value.position,
					revision = value.revision
				}
			})
			Placements[value.key] = {
				viewportRelative = true,
				zIndex = 2,
				mainAxisOffset = if value.position == PlacementTypesModule.PinnedPosition.Start then 0 else math.max(0, p1.viewportLength - value.length),
				mainAxisLength = value.length
			}
		end
	end
	return {
		retainedItems = RetainedItems,
		additionalAssignments = AdditionalAssignments,
		placements = Placements,
		hasViewportRelativePlacements = v1 > 0 or (p1.pinnedStartItem ~= nil or p1.pinnedEndItem ~= nil)
	}
end