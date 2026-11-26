local FFlagAXEnableInventorySearch = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.AvatarExperienceFlags).FFlagAXEnableInventorySearch
local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local CreateInventorySearchStoreModule = require(script.Parent.Parent.Stores.createInventorySearchStore)
local CreateSortAndFiltersStoreModule = require(script.Parent.Parent.Stores.createSortAndFiltersStore)
local _ = require(script.Parent.Parent.Stores.createThumbnailLatencyStore)

return function()
	-- upvalues: CreateSortAndFiltersStoreModule (copy), FFlagAXEnableInventorySearch (copy), CreateInventorySearchStoreModule (copy)
	local v1 = nil
	
	local function startNewSearches()
		-- upvalues: v1 (ref)
		local SearchInventoryStores = v1.searchInventoryStores
		
		if not SearchInventoryStores then return end
		for _, searchInventoryStore in SearchInventoryStores do
			searchInventoryStore.startNewSearch()
		end
	end
	
	v1 = {
		categoryInventoryStores = {},
		sortAndFiltersStore = CreateSortAndFiltersStoreModule(),
		thumbnailLatencyStores = {},
		inventorySearchStore = if FFlagAXEnableInventorySearch then CreateInventorySearchStoreModule(startNewSearches) else nil,
		searchInventoryStores = if FFlagAXEnableInventorySearch then {} else nil
	}
	
	return v1
end