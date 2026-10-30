local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local CreateInventoryPageStoreModule = require(AvatarWorkshop.Stores.Creators.createInventoryPageStore)
local _ = require(AvatarWorkshop.Constants.InventoryPagesData)
local t = {}

return function(Key)
	-- upvalues: t (copy), CreateInventoryPageStoreModule (copy)
	if t[Key] then
		return t[Key]
	else
		t[Key] = CreateInventoryPageStoreModule(Key)
		
		return t[Key]
	end
end