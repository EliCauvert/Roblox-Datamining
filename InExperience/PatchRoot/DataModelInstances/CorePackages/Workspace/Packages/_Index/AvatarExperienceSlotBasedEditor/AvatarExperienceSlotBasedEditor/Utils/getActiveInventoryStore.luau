local _ = require(script.Parent.Parent.Stores.createAvatarEditorStores)
local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)

return function(p1, p2, p3)
	local SearchInventoryStores = p1.searchInventoryStores
	
	return if p3 and SearchInventoryStores and SearchInventoryStores[p2] then SearchInventoryStores[p2] else p1.categoryInventoryStores[p2]
end