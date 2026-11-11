local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local CreateSortAndFiltersStoreModule = require(script.Parent.Parent.Stores.createSortAndFiltersStore)

return function()
	-- upvalues: CreateSortAndFiltersStoreModule (copy)
	return {
		categoryInventoryStores = {},
		sortAndFiltersStore = CreateSortAndFiltersStoreModule()
	}
end