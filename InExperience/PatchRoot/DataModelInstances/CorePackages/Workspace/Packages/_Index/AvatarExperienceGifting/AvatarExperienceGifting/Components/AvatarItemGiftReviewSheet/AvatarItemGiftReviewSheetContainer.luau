local avatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local reactModule = require(avatarExperienceGifting.Parent.React)
local _ = require(avatarExperienceGifting.Types.GiftSendFlowNavigationOverrides)
local avatarItemGiftReviewSheetPlaceholderViewModule = require(script.Parent.AvatarItemGiftReviewSheetPlaceholderView)
local useAvatarItemGiftReviewSheetViewModelModule = require(script.Parent.useAvatarItemGiftReviewSheetViewModel)

return function(p1)
	-- upvalues: useAvatarItemGiftReviewSheetViewModelModule (ref), reactModule (ref), avatarItemGiftReviewSheetPlaceholderViewModule (ref)
	return reactModule.createElement(avatarItemGiftReviewSheetPlaceholderViewModule, useAvatarItemGiftReviewSheetViewModelModule(p1.navigationOverrides))
end