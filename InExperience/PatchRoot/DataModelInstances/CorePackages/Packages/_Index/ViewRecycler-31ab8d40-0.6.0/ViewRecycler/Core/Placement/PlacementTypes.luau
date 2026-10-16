local ViewRecycler = script:FindFirstAncestor("ViewRecycler")

return table.freeze({
	IdentityKind = require(ViewRecycler.Core.Enums.IdentityKind),
	ITEM_PLACEMENT_KEYS = table.freeze({
		"mainAxisOffset",
		"mainAxisLength",
		"mainAxisEndLimit",
		"zIndex"
	}),
	PinnedPosition = require(ViewRecycler.Core.Enums.PinnedPosition)
})