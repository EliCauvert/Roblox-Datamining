local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local PostStatusRowViewModule = require(script.Parent.PostStatusRowView)
local UsePostStatusRowViewModelModule = require(script.Parent.usePostStatusRowViewModel)

return function(p1)
	-- upvalues: UsePostStatusRowViewModelModule (copy), ReactModule (copy), PostStatusRowViewModule (copy)
	local UsePostStatusRowViewModelModuleResult = UsePostStatusRowViewModelModule(p1)
	
	return if UsePostStatusRowViewModelModuleResult == nil then nil else ReactModule.createElement(PostStatusRowViewModule, UsePostStatusRowViewModelModuleResult)
end