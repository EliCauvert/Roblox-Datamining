local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Layout)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local frozen = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = table.freeze({}),
	additionalAssignments = table.freeze({}),
	placements = table.freeze({})
})

return function(p1)
	-- upvalues: frozen (ref), placementTypesModule (ref)
	if #p1.stickyIndices == 0 and p1.pinnedStartItem == nil and p1.pinnedEndItem == nil then
		return frozen
	end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var1 = if p1.pinnedStartItem == nil then 0 else p1.pinnedStartItem.length
	local var2 = 0
	local var3 = 1
	local stickyIndicesCount = #p1.stickyIndices
	while var3 <= stickyIndicesCount do
		local floored = math.floor((var3 + stickyIndicesCount) / 2)
		
		if p1.layout.getItemLayout(p1.stickyIndices[floored]).startOffset + p1.contentStartOffset - p1.scrollOffset < var1 then
			var2 = floored
			var3 = floored + 1
		else
			stickyIndicesCount = floored - 1
		end
	end
	if var2 > 0 then
		local var4 = p1.stickyIndices[var2]
		local itemLayout = p1.layout.getItemLayout(var4)
		local var5 = var1
		local var6 = p1.stickyIndices[var2 + 1]
		
		if var6 ~= nil then
			var5 = math.min(var1, p1.layout.getItemLayout(var6).startOffset + p1.contentStartOffset - p1.scrollOffset - itemLayout.length)
		end
		local itemKey = p1.dataSource.getItemKey(var4)
		table.insert(t, { key = itemKey, index = var4 })
		t_2[itemKey] = {
			viewportRelative = true,
			zIndex = 1,
			mainAxisOffset = var5,
			mainAxisLength = itemLayout.length
		}
	end
	for i, v in { p1.pinnedStartItem, p1.pinnedEndItem } do
		if v ~= nil then
			table.insert(t_1, {
				key = v.key,
				value = v.value,
				itemViewType = v.itemViewType,
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
		additionalAssignments = t_1,
		placements = t_2,
		hasViewportRelativePlacements = if var2 <= 0 then if p1.pinnedStartItem == nil then p1.pinnedEndItem ~= nil else true else true
	}
end