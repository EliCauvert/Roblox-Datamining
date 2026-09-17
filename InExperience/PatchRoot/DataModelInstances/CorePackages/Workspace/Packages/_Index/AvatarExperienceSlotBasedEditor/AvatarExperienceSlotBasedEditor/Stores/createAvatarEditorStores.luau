local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local createSortAndFiltersStoreModule = require(script.Parent.Parent.Stores.createSortAndFiltersStore)
local _ = require(script.Parent.Parent.Stores.createThumbnailLatencyStore)

return function()
	-- upvalues: createSortAndFiltersStoreModule (ref)
	return {
		categoryInventoryStores = {},
		sortAndFiltersStore = createSortAndFiltersStoreModule(),
		thumbnailLatencyStores = {}
	}
end