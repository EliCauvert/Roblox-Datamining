local viewRecycler = script:FindFirstAncestor("ViewRecycler")

return table.freeze({
	IdentityKind = require(viewRecycler.Core.Enums.IdentityKind),
	ITEM_PLACEMENT_KEYS = table.freeze({
		"mainAxisOffset",
		"mainAxisLength",
		"mainAxisEndLimit",
		"zIndex"
	}),
	PinnedPosition = require(viewRecycler.Core.Enums.PinnedPosition)
})