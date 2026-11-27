local FFlagAXEnableInventorySearch = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.AvatarExperienceFlags).FFlagAXEnableInventorySearch
local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local CreateInventorySearchStoreModule = require(script.Parent.Parent.Stores.createInventorySearchStore)
local CreateSortAndFiltersStoreModule = require(script.Parent.Parent.Stores.createSortAndFiltersStore)
local _ = require(script.Parent.Parent.Stores.createThumbnailLatencyStore)

return function()
	-- upvalues: CreateSortAndFiltersStoreModule (copy), FFlagAXEnableInventorySearch (copy), CreateInventorySearchStoreModule (copy)
	return {
		categoryInventoryStores = {},
		sortAndFiltersStore = CreateSortAndFiltersStoreModule(),
		thumbnailLatencyStores = {},
		inventorySearchStore = if FFlagAXEnableInventorySearch then CreateInventorySearchStoreModule() else nil
	}
end