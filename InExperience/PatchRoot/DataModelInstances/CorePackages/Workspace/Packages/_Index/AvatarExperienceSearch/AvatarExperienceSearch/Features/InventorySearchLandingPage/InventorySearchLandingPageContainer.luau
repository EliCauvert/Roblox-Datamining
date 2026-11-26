local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSearch").Parent.React)
local InventorySearchLandingPageViewModule = require(script.Parent.InventorySearchLandingPageView)
local UseInventorySearchLandingPageViewModelModule = require(script.Parent.useInventorySearchLandingPageViewModel)

return function(p1)
	-- upvalues: UseInventorySearchLandingPageViewModelModule (copy), ReactModule (copy), InventorySearchLandingPageViewModule (copy)
	return ReactModule.createElement(InventorySearchLandingPageViewModule, (UseInventorySearchLandingPageViewModelModule(p1)))
end