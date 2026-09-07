local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Layout)

return table.freeze({
	IdentityKind = table.freeze({ Data = "data", Pinned = "pinned" }),
	ITEM_PLACEMENT_KEYS = table.freeze({ "mainAxisOffset", "mainAxisLength", "zIndex" }),
	PinnedPosition = table.freeze({ Start = "start", Finish = "finish" })
})