local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local TModule = require(Parent.t)
local _ = require(Parent.Signals)
local _ = require(DataHydration.DataHydrationTypes)

return {
	marketplaceCatalogCategoryResponseItemValidator = TModule.interface({
		id = TModule.string,
		title = TModule.string,
		name = TModule.string,
		taxonomyId = TModule.optional(TModule.string),
		buttonsEnabled = TModule.optional(TModule.table),
		subcategories = TModule.optional(TModule.table),
		defaultSubcategoryId = TModule.optional(TModule.string),
		assetTypes = TModule.optional(TModule.table),
		bundleTypes = TModule.optional(TModule.table),
		canAnimateCameraBasedMood = TModule.optional(TModule.boolean),
		cameraFocus = TModule.optional(TModule.string),
		cameraZoomRadius = TModule.optional(TModule.number),
		tileType = TModule.optional(TModule.string),
		timeToRefresh = TModule.optional(TModule.number),
		categoryId = TModule.optional(TModule.number),
		subcategoryId = TModule.optional(TModule.number),
		looksWidgetContextForOrganicContent = TModule.optional(TModule.string)
	})
}