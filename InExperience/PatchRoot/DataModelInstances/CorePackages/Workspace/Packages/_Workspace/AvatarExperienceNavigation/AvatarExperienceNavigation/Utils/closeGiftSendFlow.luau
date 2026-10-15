local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local avatarScreenModule = require(avatarExperienceNavigation.Enums.AvatarScreen)
local clearScreensModule = require(avatarExperienceNavigation.NavigationActions.ClearScreens)
local _ = require(avatarExperienceNavigation.Types.NavigationType)

return function(p1)
	-- upvalues: clearScreensModule (ref), avatarScreenModule (ref)
	p1.dispatch(clearScreensModule({
		avatarScreenModule.SendGiftRecipientPicker,
		avatarScreenModule.SendGiftReview
	}))
end