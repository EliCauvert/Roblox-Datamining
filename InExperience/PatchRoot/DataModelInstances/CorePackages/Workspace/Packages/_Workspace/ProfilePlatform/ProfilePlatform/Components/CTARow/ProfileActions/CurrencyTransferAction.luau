local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local enums = require(parent.CurrencyTransfers).Enums
local transferDirection = enums.TransferDirection
local transferOrigination = enums.TransferOrigination
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.CurrencyTransfer] = if sharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer then function(p0)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), transferDirection (ref), transferOrigination (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.CurrencyTransfer],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p0 (ref), enumsModule (copy), eventNamesModule (copy), transferDirection (copy), transferOrigination (copy)
					if p0.buttonSurface == enumsModule.ButtonSurface.ContextualMenu then
						p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = p0.buttonSurface })
					else
						p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = p0.buttonSurface })
					end
					local navigateToTransfer = p0.navigateTo and p0.navigateTo.navigateToTransfer
					
					if navigateToTransfer then
						navigateToTransfer({
							recipientUserId = p0.profileId,
							direction = transferDirection.Send,
							transferOrigination = transferOrigination.Profile
						})
					end
				end
			}
		}
	end else nil
}