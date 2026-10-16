local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local Enums = require(Parent.CurrencyTransfers).Enums
local TransferDirection = Enums.TransferDirection
local TransferOrigination = Enums.TransferOrigination
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.CurrencyTransfer] = if require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer then function(p1) --[[ Line: 18 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), TransferDirection (copy), TransferOrigination (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.CurrencyTransfer],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 22 ]]
					-- upvalues: p1 (copy), EnumsModule (upval), EventNamesModule (upval), TransferDirection (upval), TransferOrigination (upval)
					if p1.buttonSurface == EnumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = p1.buttonSurface })
					end
					local NavigateToTransfer: (any) -> () = p1.navigateTo and p1.navigateTo.navigateToTransfer
					
					if NavigateToTransfer then
						NavigateToTransfer({
							recipientUserId = p1.profileId,
							direction = TransferDirection.Send,
							transferOrigination = TransferOrigination.Profile
						})
					end
				end
			}
		}
	end else nil
}