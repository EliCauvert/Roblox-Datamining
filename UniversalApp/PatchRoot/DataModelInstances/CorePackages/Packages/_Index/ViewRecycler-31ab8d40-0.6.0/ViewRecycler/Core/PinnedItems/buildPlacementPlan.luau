local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Virtualizer.ItemSequence)
local _ = require(ViewRecycler.Core.Layout)
local PlacementTypesModule = require(ViewRecycler.Core.Placement.PlacementTypes)
local Frozen = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = table.freeze({}),
	additionalItems = table.freeze({}),
	placements = table.freeze({})
})

return function(p1)
	-- upvalues: Frozen (copy), PlacementTypesModule (copy)
	if p1.activeStickyIndex == nil and p1.pinnedStartItem == nil and p1.pinnedEndItem == nil then
		return Frozen
	end
	local RetainedItems = {}
	local AdditionalItems = {}
	local Placements = {}
	local Length = if p1.pinnedStartItem == nil then 0 else p1.pinnedStartItem.length
	local ActiveStickyIndex = p1.activeStickyIndex
	
	if ActiveStickyIndex ~= nil then
		local ItemLayout = p1.layout.getItemLayout(ActiveStickyIndex)
		local StartOffsetDelta = nil
		local NextStickyIndex = p1.nextStickyIndex
		
		if NextStickyIndex ~= nil then
			StartOffsetDelta = p1.layout.getItemLayout(NextStickyIndex).startOffset + p1.contentStartOffset - p1.scrollOffset
		end
		local ItemKey = p1.itemSequence.getItemKey(ActiveStickyIndex)
		table.insert(RetainedItems, { key = ItemKey, index = ActiveStickyIndex })
		Placements[ItemKey] = {
			viewportRelative = true,
			zIndex = 1,
			mainAxisOffset = Length,
			mainAxisLength = ItemLayout.length,
			mainAxisEndLimit = StartOffsetDelta
		}
	end
	for _, value in { p1.pinnedStartItem, p1.pinnedEndItem } do
		if value ~= nil then
			table.insert(AdditionalItems, {
				key = value.key,
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
		additionalItems = AdditionalItems,
		placements = Placements,
		hasViewportRelativePlacements = ActiveStickyIndex ~= nil or p1.pinnedStartItem ~= nil or p1.pinnedEndItem ~= nil
	}
end