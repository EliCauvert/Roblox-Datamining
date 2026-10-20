local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local AvatarScreenModule = require(AvatarExperienceNavigation.Enums.AvatarScreen)
local ClearScreensModule = require(AvatarExperienceNavigation.NavigationActions.ClearScreens)
local _ = require(AvatarExperienceNavigation.Types.NavigationType)

return function(p1)
	-- upvalues: ClearScreensModule (copy), AvatarScreenModule (copy)
	p1.dispatch(ClearScreensModule({
		AvatarScreenModule.SendGiftRecipientPicker,
		AvatarScreenModule.SendGiftReview
	}))
end