local _ = require(script:FindFirstAncestor("ViewRecyclerReact").Parent.ViewRecyclerRoblox)

local function _(p1)
	return if p1 == nil then nil else {
		key = p1.key,
		value = p1.value,
		itemViewType = p1.itemType
	}
end

return function(Tbl, p1)
	local Copy = table.clone(Tbl)
	Copy.scrollingFrame = p1.scrollingFrame
	Copy.viewportOverlay = p1.viewportOverlay
	local PinnedStartItem = Tbl.pinnedStartItem
	Copy.pinnedStartItem = if PinnedStartItem == nil then nil else {
		key = PinnedStartItem.key,
		value = PinnedStartItem.value,
		itemViewType = PinnedStartItem.itemType
	}
	local PinnedEndItem = Tbl.pinnedEndItem
	Copy.pinnedEndItem = if PinnedEndItem == nil then nil else {
		key = PinnedEndItem.key,
		value = PinnedEndItem.value,
		itemViewType = PinnedEndItem.itemType
	}
	
	return Copy
end