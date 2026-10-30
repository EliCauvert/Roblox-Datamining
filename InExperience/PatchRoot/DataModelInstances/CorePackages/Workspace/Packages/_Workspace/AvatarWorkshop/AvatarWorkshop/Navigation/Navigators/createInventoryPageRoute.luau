local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.React)
local InventoryPagesDataModule = require(AvatarWorkshop.Constants.InventoryPagesData)
local _ = require(script.Parent.createPagesNavigator)

return function(p1, Screen)
	-- upvalues: InventoryPagesDataModule (copy)
	local InventoryPagesDataModuleEntry = InventoryPagesDataModule[p1]
	assert(InventoryPagesDataModuleEntry ~= nil, `createInventoryPageRoute: no InventoryPagesData entry for screen "{p0}"`)
	
	return {
		[p1] = {
			screen = Screen,
			params = { pageData = InventoryPagesDataModuleEntry }
		}
	}
end