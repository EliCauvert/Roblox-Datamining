local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local PostStatusBadgeViewModule = require(script.Parent.PostStatusBadgeView)
local UsePostStatusBadgeViewModelModule = require(script.Parent.usePostStatusBadgeViewModel)

return function(p1)
	-- upvalues: UsePostStatusBadgeViewModelModule (copy), ReactModule (copy), PostStatusBadgeViewModule (copy)
	local UsePostStatusBadgeViewModelModuleResult = UsePostStatusBadgeViewModelModule(p1)
	
	return if UsePostStatusBadgeViewModelModuleResult == nil then nil else ReactModule.createElement(PostStatusBadgeViewModule, UsePostStatusBadgeViewModelModuleResult)
end