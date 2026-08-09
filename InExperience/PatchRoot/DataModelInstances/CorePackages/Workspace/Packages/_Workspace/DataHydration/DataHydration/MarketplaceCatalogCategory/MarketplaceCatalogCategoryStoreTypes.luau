local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local tModule = require(parent.t)
local _ = require(parent.Signals)
local _ = require(dataHydration.DataHydrationTypes)

return {
	marketplaceCatalogCategoryResponseItemValidator = tModule.interface({
		id = tModule.string,
		title = tModule.string,
		name = tModule.string,
		taxonomyId = tModule.optional(tModule.string),
		buttonsEnabled = tModule.optional(tModule.table),
		subcategories = tModule.optional(tModule.table),
		defaultSubcategoryId = tModule.optional(tModule.string),
		assetTypes = tModule.optional(tModule.table),
		bundleTypes = tModule.optional(tModule.table),
		canAnimateCameraBasedMood = tModule.optional(tModule.boolean),
		cameraFocus = tModule.optional(tModule.string),
		cameraZoomRadius = tModule.optional(tModule.number),
		tileType = tModule.optional(tModule.string),
		timeToRefresh = tModule.optional(tModule.number),
		categoryId = tModule.optional(tModule.number),
		subcategoryId = tModule.optional(tModule.number)
	})
}