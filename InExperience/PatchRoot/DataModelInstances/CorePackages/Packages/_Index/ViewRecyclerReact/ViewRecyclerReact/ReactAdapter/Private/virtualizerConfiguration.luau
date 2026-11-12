local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact084
local _ = require(script:FindFirstAncestor("ViewRecyclerReact").Parent.ViewRecyclerRoblox)

local function _(p1)
	-- upvalues: FFlagViewRecyclerReact084 (copy)
	return if p1 == nil then nil else {
		key = p1.key,
		value = p1.value,
		itemViewType = p1.itemType,
		estimatedLength = if FFlagViewRecyclerReact084 then p1.estimatedLength else nil
	}
end

return function(Tbl, p1)
	-- upvalues: FFlagViewRecyclerReact084 (copy)
	local Copy = table.clone(Tbl)
	Copy.scrollingFrame = p1.scrollingFrame
	Copy.viewportOverlay = p1.viewportOverlay
	local PinnedStartItem = Tbl.pinnedStartItem
	Copy.pinnedStartItem = if PinnedStartItem == nil then nil else {
		key = PinnedStartItem.key,
		value = PinnedStartItem.value,
		itemViewType = PinnedStartItem.itemType,
		estimatedLength = if FFlagViewRecyclerReact084 then PinnedStartItem.estimatedLength else nil
	}
	local PinnedEndItem = Tbl.pinnedEndItem
	Copy.pinnedEndItem = if PinnedEndItem == nil then nil else {
		key = PinnedEndItem.key,
		value = PinnedEndItem.value,
		itemViewType = PinnedEndItem.itemType,
		estimatedLength = if FFlagViewRecyclerReact084 then PinnedEndItem.estimatedLength else nil
	}
	
	return Copy
end