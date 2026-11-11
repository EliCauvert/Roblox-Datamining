local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local CategoryPageViewModule = require(script.Parent.CategoryPageView)
local UseCategoryPageViewModelModule = require(script.Parent.useCategoryPageViewModel)

return function(p1)
	-- upvalues: UseCategoryPageViewModelModule (copy), ReactModule (copy), CategoryPageViewModule (copy)
	return ReactModule.createElement(CategoryPageViewModule, (UseCategoryPageViewModelModule(p1)))
end