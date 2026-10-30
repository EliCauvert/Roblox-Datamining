local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ReactModule = require(AvatarWorkshop.Parent.React)
local _ = require(AvatarWorkshop.Constants.InventoryPagesData)
local UseNavigationModule = require(AvatarWorkshop.Hooks.useNavigation)
local _ = require(script.Parent.InventoryGridTypes)
local InventoryGridViewModule = require(script.Parent.InventoryGridView)
local UseInventoryGridViewModelModule = require(script.Parent.useInventoryGridViewModel)

return function(_)
	-- upvalues: UseNavigationModule (copy), UseInventoryGridViewModelModule (copy), ReactModule (copy), InventoryGridViewModule (copy)
	return ReactModule.createElement(InventoryGridViewModule, (UseInventoryGridViewModelModule({ pageData = UseNavigationModule().getParam("pageData") })))
end