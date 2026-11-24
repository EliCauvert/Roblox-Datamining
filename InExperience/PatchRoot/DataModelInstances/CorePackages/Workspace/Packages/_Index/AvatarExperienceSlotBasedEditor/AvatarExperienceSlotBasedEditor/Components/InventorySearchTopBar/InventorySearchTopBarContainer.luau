local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local InventorySearchTopBarViewModule = require(script.Parent.InventorySearchTopBarView)
local UseInventorySearchTopBarViewModelModule = require(script.Parent.useInventorySearchTopBarViewModel)

return function()
	-- upvalues: UseInventorySearchTopBarViewModelModule (copy), ReactModule (copy), InventorySearchTopBarViewModule (copy)
	return ReactModule.createElement(InventorySearchTopBarViewModule, (UseInventorySearchTopBarViewModelModule()))
end