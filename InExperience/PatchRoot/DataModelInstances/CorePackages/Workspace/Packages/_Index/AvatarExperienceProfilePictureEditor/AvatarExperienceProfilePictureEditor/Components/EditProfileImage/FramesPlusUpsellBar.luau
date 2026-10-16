local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local PlusSubscribeBannerModule = require(Parent.AvatarExperienceCommon.PlusSubscribeBanner)
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)

return function(p1) --[[ Line: 20 | Named "FramesPlusUpsellBar" ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), PlusSubscribeBannerModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		unlockBanner = TextKeysModule.ProfileFramesUnlockBanner,
		subscribe = TextKeysModule.Subscribe
	})
	
	return ReactModule.createElement(PlusSubscribeBannerModule, {
		showPlusIcon = true,
		testId = "FramesPlusUpsellBar",
		message = UseLocalizationResult.unlockBanner,
		actionText = p1.actionText or UseLocalizationResult.subscribe,
		onActivated = p1.onSubscribeActivated,
		LayoutOrder = p1.layoutOrder
	})
end