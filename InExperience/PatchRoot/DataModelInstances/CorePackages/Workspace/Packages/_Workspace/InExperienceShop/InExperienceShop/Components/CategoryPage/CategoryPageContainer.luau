local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local categoryPageViewModule = require(script.Parent.CategoryPageView)
local useCategoryPageViewModelModule = require(script.Parent.useCategoryPageViewModel)

return function(p0)
	-- upvalues: useCategoryPageViewModelModule (ref), reactModule (ref), categoryPageViewModule (ref)
	return reactModule.createElement(categoryPageViewModule, useCategoryPageViewModelModule(p0))
end