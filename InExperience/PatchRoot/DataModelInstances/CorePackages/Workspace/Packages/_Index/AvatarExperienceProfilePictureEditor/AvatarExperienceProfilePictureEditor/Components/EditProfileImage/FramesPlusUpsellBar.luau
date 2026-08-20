local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local plusSubscribeBannerModule = require(parent.AvatarExperienceCommon.PlusSubscribeBanner)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)

return function(p0) --[[ line: 19 | named "FramesPlusUpsellBar" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), plusSubscribeBannerModule (ref)
	local var4 = useLocalization({
		unlockBanner = textKeysModule.ProfileFramesUnlockBanner,
		subscribe = textKeysModule.Subscribe
	})
	
	return reactModule.createElement(plusSubscribeBannerModule, {
		showPlusIcon = true,
		testId = "FramesPlusUpsellBar",
		message = var4.unlockBanner,
		actionText = var4.subscribe,
		onActivated = p0.onSubscribeActivated,
		LayoutOrder = p0.layoutOrder
	})
end