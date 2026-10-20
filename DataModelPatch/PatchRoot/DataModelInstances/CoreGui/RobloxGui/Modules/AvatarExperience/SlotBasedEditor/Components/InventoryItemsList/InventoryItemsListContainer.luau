local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local InventoryItemsListModule = require(script.Parent.InventoryItemsList)
local UseInventoryItemsListPropsModule = require(script.Parent.useInventoryItemsListProps)
local FFlagAXAddInventoryItemsListProps = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddInventoryItemsListProps

return ReactModule.memo(function(p1)
	-- upvalues: FFlagAXAddInventoryItemsListProps (copy), UseInventoryItemsListPropsModule (copy), ReactModule (copy), InventoryItemsListModule (copy)
	return ReactModule.createElement(InventoryItemsListModule, if FFlagAXAddInventoryItemsListProps then UseInventoryItemsListPropsModule(p1) else UseInventoryItemsListPropsModule())
end)