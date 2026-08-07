local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local createSortAndFiltersStoreModule = require(script.Parent.Parent.Stores.createSortAndFiltersStore)

return function() --[[ line: 19 | named "createAvatarEditorStores" ]]
	-- upvalues: createSortAndFiltersStoreModule (ref)
	return {
		categoryInventoryStores = {},
		sortAndFiltersStore = createSortAndFiltersStoreModule()
	}
end