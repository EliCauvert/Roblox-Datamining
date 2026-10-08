local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Virtualizer.ItemSequence)
local _ = require(viewRecycler.Core.Layout)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local frozen = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = table.freeze({}),
	additionalItems = table.freeze({}),
	placements = table.freeze({})
})

return function(p1)
	-- upvalues: frozen (ref), placementTypesModule (ref)
	if p1.activeStickyIndex == nil and p1.pinnedStartItem == nil and p1.pinnedEndItem == nil then
		return frozen
	end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var1 = if p1.pinnedStartItem == nil then 0 else p1.pinnedStartItem.length
	local activeStickyIndex = p1.activeStickyIndex
	
	if activeStickyIndex ~= nil then
		local itemLayout = p1.layout.getItemLayout(activeStickyIndex)
		local var2 = nil
		local nextStickyIndex = p1.nextStickyIndex
		
		if nextStickyIndex ~= nil then
			var2 = p1.layout.getItemLayout(nextStickyIndex).startOffset + p1.contentStartOffset - p1.scrollOffset
		end
		local itemKey = p1.itemSequence.getItemKey(activeStickyIndex)
		table.insert(t, { key = itemKey, index = activeStickyIndex })
		t_2[itemKey] = {
			viewportRelative = true,
			zIndex = 1,
			mainAxisOffset = var1,
			mainAxisLength = itemLayout.length,
			mainAxisEndLimit = var2
		}
	end
	for i, v in { p1.pinnedStartItem, p1.pinnedEndItem } do
		if v ~= nil then
			table.insert(t_1, {
				key = v.key,
				identity = {
					kind = placementTypesModule.IdentityKind.Pinned,
					position = v.position,
					revision = v.revision
				}
			})
			t_2[v.key] = {
				viewportRelative = true,
				zIndex = 2,
				mainAxisOffset = if v.position == placementTypesModule.PinnedPosition.Start then 0 else math.max(0, p1.viewportLength - v.length),
				mainAxisLength = v.length
			}
		end
	end
	return {
		retainedItems = t,
		additionalItems = t_1,
		placements = t_2,
		hasViewportRelativePlacements = if activeStickyIndex == nil then if p1.pinnedStartItem == nil then p1.pinnedEndItem ~= nil else true else true
	}
end