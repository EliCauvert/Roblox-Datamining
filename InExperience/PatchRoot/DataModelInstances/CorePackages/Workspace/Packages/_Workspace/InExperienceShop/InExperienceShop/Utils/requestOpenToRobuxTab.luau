local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local isSideSheetEnabledModule = require(inExperienceShop.Parent.InExperienceSideSheetUtils.isSideSheetEnabled)

return function()
	-- upvalues: isSideSheetEnabledModule (ref), getInExperienceShopStoreModule (ref)
	if isSideSheetEnabledModule then
		getInExperienceShopStoreModule(false).setShouldOpenToRobuxTab(true)
	end
end