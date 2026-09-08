local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local isPioneerLaunch = require(inExperienceShop.Parent.PioneerUtils).isPioneerLaunch

return function()
	-- upvalues: isPioneerLaunch (ref), getInExperienceShopStoreModule (ref)
	if isPioneerLaunch() then
		getInExperienceShopStoreModule(false).setShouldOpenToRobuxTab(true)
	end
end