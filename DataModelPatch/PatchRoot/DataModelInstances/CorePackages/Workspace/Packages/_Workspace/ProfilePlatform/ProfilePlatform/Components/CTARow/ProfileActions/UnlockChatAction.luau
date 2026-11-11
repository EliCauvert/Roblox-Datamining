local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SocialUpsellModule = require(Parent.SocialUpsell)
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local StartFacialAgeEstimationFunction = SocialUpsellModule.Thunks.startFacialAgeEstimation
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.UnlockChat] = if require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat) then function(p1)
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), StartFacialAgeEstimationFunction (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy)
		return {
			variant = ButtonVariant.Emphasis,
			text = p1.localized[EnumsModule.ProfileActions.UnlockChat],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), StartFacialAgeEstimationFunction (upval), SocialUpsellType (upval), UpsellEntrySurfaceType (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonUnlockChat, { buttonSurface = p1.buttonSurface })
					p1.dispatch(StartFacialAgeEstimationFunction(SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.ProfileActionBar, nil, nil, UpsellEntrySurfaceType.ProfileActionBar, false))
				end
			}
		}
	end else nil
}