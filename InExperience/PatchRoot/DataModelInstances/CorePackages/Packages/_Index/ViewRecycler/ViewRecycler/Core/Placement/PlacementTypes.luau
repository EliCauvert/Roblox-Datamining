local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Layout)

return table.freeze({
	IdentityKind = require(viewRecycler.Core.Enums.IdentityKind),
	ITEM_PLACEMENT_KEYS = table.freeze({ "mainAxisOffset", "mainAxisLength", "zIndex" }),
	PinnedPosition = require(viewRecycler.Core.Enums.PinnedPosition)
})