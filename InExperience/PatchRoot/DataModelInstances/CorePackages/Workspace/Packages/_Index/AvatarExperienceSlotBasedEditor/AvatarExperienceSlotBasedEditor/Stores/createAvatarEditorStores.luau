local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local CreateSortAndFiltersStoreModule = require(script.Parent.Parent.Stores.createSortAndFiltersStore)
local _ = require(script.Parent.Parent.Stores.createThumbnailLatencyStore)

return function()
	-- upvalues: CreateSortAndFiltersStoreModule (copy)
	return {
		categoryInventoryStores = {},
		sortAndFiltersStore = CreateSortAndFiltersStoreModule(),
		thumbnailLatencyStores = {}
	}
end