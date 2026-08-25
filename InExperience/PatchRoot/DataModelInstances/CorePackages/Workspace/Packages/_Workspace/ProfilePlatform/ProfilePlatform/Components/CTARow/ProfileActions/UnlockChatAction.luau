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
	[enumsModule.ProfileActions.UnlockChat] = if require(profilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat) then function(p0)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), startFacialAgeEstimation (ref), socialUpsellType (ref), upsellEntrySurfaceType (ref)
		return {
			variant = buttonVariant.Emphasis,
			text = p0.localized[enumsModule.ProfileActions.UnlockChat],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p0 (ref), eventNamesModule (copy), startFacialAgeEstimation (copy), socialUpsellType (copy), upsellEntrySurfaceType (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonUnlockChat, { buttonSurface = p0.buttonSurface })
					p0.dispatch(startFacialAgeEstimation(socialUpsellType.FacialAgeEstimation .. upsellEntrySurfaceType.ProfileActionBar, nil, nil, upsellEntrySurfaceType.ProfileActionBar, false))
				end
			}
		}
	end else nil
}