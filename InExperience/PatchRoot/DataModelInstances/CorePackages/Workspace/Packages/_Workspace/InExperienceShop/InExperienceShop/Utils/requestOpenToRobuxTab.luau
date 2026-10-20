local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local IsSideSheetEnabledModule = require(InExperienceShop.Parent.InExperienceSideSheetUtils.isSideSheetEnabled)

return function()
	-- upvalues: IsSideSheetEnabledModule (copy), GetInExperienceShopStoreModule (copy)
	if IsSideSheetEnabledModule then
		GetInExperienceShopStoreModule(false).setShouldOpenToRobuxTab(true)
	end
end