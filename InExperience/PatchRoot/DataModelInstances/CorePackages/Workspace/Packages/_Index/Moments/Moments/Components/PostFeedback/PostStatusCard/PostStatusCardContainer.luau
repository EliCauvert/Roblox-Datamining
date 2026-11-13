local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local PostStatusCardViewModule = require(script.Parent.PostStatusCardView)
local UsePostStatusCardViewModelModule = require(script.Parent.usePostStatusCardViewModel)
local UseHidePostStatusToastModule = require(Moments.Components.PostFeedback.PostStatusToast.useHidePostStatusToast)
local FFlagMomentsHidePostStatusToast = SharedFlagsModule.FFlagMomentsHidePostStatusToast

return function()
	-- upvalues: FFlagMomentsHidePostStatusToast (copy), UseHidePostStatusToastModule (copy), UsePostStatusCardViewModelModule (copy), ReactModule (copy), PostStatusCardViewModule (copy)
	if FFlagMomentsHidePostStatusToast then
		UseHidePostStatusToastModule()
	end
	local UsePostStatusCardViewModelModuleResult = UsePostStatusCardViewModelModule()
	
	return if UsePostStatusCardViewModelModuleResult == nil then nil else ReactModule.createElement(PostStatusCardViewModule, UsePostStatusCardViewModelModuleResult)
end