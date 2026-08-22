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

return function(p0) --[[ line: 34 | named "buildPlacementPlan" ]]
	-- upvalues: frozen (ref), placementTypesModule (ref)
	if #p0.stickyIndices == 0 and p0.pinnedStartItem == nil and p0.pinnedEndItem == nil then
		return frozen
	end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var6 = if p0.pinnedStartItem == nil then 0 else p0.pinnedStartItem.length
	local var7 = 0
	local var8 = 1
	local stickyIndicesCount = #p0.stickyIndices
	while var8 <= stickyIndicesCount do
		local floored = math.floor((var8 + stickyIndicesCount) / 2)
		
		if p0.layout.getItemLayout(p0.stickyIndices[floored]).startOffset + p0.contentStartOffset - p0.scrollOffset < var6 then
			var7 = floored
			var8 = floored + 1
		else
			stickyIndicesCount = floored - 1
		end
	end
	if var7 > 0 then
		local var11 = p0.stickyIndices[var7]
		local itemLayout = p0.layout.getItemLayout(var11)
		local var13 = var6
		local var14 = p0.stickyIndices[var7 + 1]
		
		if var14 ~= nil then
			var13 = math.min(var6, p0.layout.getItemLayout(var14).startOffset + p0.contentStartOffset - p0.scrollOffset - itemLayout.length)
		end
		local itemKey = p0.dataSource.getItemKey(var11)
		table.insert(t, { key = itemKey, index = var11 })
		t_2[itemKey] = {
			viewportRelative = true,
			zIndex = 1,
			mainAxisOffset = var13,
			mainAxisLength = itemLayout.length
		}
	end
	for i, v in { p0.pinnedStartItem, p0.pinnedEndItem } do
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
				mainAxisOffset = if v.position == placementTypesModule.PinnedPosition.Start then 0 else math.max(0, p0.viewportLength - v.length),
				mainAxisLength = v.length
			}
		end
	end
	return {
		retainedItems = t,
		additionalAssignments = t_1,
		placements = t_2,
		hasViewportRelativePlacements = if var7 <= 0 then if p0.pinnedStartItem == nil then p0.pinnedEndItem ~= nil else true else true
	}
end