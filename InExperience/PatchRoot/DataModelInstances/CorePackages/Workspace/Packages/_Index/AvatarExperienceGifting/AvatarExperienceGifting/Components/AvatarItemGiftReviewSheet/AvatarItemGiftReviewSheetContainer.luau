local AvatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local ReactModule = require(AvatarExperienceGifting.Parent.React)
local _ = require(AvatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local AvatarItemGiftReviewSheetPlaceholderViewModule = require(script.Parent.AvatarItemGiftReviewSheetPlaceholderView)
local UseAvatarItemGiftReviewSheetViewModelModule = require(script.Parent.useAvatarItemGiftReviewSheetViewModel)

return function(p1) --[[ Line: 14 | Named "AvatarItemGiftReviewSheetContainer" ]]
	-- upvalues: UseAvatarItemGiftReviewSheetViewModelModule (copy), ReactModule (copy), AvatarItemGiftReviewSheetPlaceholderViewModule (copy)
	return ReactModule.createElement(AvatarItemGiftReviewSheetPlaceholderViewModule, (UseAvatarItemGiftReviewSheetViewModelModule(p1.navigationOverrides)))
end