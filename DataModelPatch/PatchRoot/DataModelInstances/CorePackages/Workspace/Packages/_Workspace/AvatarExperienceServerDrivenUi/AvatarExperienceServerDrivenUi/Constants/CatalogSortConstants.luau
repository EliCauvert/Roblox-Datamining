local _ = require(script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Types.CatalogSortPropTypes)

return {
	DEFAULT_PREVIEW_COLUMNS = 3,
	DEFAULT_ITEM_FOOTERS = {
		{ contentType = "ItemName" },
		{ contentType = "Price" },
		{ contentType = "AgentName" }
	}
}