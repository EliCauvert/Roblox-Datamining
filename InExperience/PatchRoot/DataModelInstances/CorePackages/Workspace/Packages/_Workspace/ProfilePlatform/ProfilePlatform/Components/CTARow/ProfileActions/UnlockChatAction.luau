local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local socialUpsellModule = require(parent.SocialUpsell)
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local startFacialAgeEstimation = socialUpsellModule.Thunks.startFacialAgeEstimation
local socialUpsellType = socialUpsellModule.Enums.SocialUpsellType
local upsellEntrySurfaceType = socialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.UnlockChat] = if require(profilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat) then function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), startFacialAgeEstimation (ref), socialUpsellType (ref), upsellEntrySurfaceType (ref)
		return {
			variant = buttonVariant.Emphasis,
			text = p1.localized[enumsModule.ProfileActions.UnlockChat],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), startFacialAgeEstimation (copy), socialUpsellType (copy), upsellEntrySurfaceType (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonUnlockChat, { buttonSurface = p1.buttonSurface })
					p1.dispatch(startFacialAgeEstimation(socialUpsellType.FacialAgeEstimation .. upsellEntrySurfaceType.ProfileActionBar, nil, nil, upsellEntrySurfaceType.ProfileActionBar, false))
				end
			}
		}
	end else nil
}