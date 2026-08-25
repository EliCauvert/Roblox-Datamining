local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local createSortAndFiltersStoreModule = require(script.Parent.Parent.Stores.createSortAndFiltersStore)

return function()
	-- upvalues: createSortAndFiltersStoreModule (ref)
	return {
		categoryInventoryStores = {},
		sortAndFiltersStore = createSortAndFiltersStoreModule()
	}
end