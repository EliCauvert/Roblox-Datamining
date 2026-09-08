local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local plusSubscribeBannerModule = require(parent.AvatarExperienceCommon.PlusSubscribeBanner)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), plusSubscribeBannerModule (ref)
	local var1 = useLocalization({
		unlockBanner = textKeysModule.ProfileFramesUnlockBanner,
		subscribe = textKeysModule.Subscribe
	})
	
	return reactModule.createElement(plusSubscribeBannerModule, {
		showPlusIcon = true,
		testId = "FramesPlusUpsellBar",
		message = var1.unlockBanner,
		actionText = var1.subscribe,
		onActivated = p1.onSubscribeActivated,
		LayoutOrder = p1.layoutOrder
	})
end