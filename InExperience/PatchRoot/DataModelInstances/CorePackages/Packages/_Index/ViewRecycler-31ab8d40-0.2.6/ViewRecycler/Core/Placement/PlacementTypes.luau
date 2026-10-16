local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataSource)
local _ = require(ViewRecycler.Core.Layout)

return table.freeze({
	IdentityKind = require(ViewRecycler.Core.Enums.IdentityKind),
	ITEM_PLACEMENT_KEYS = table.freeze({ "mainAxisOffset", "mainAxisLength", "zIndex" }),
	PinnedPosition = require(ViewRecycler.Core.Enums.PinnedPosition)
})