local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local ProfileSharePolicyEnum = require(Parent.ProfileShareLinks).Enums.ProfileSharePolicyEnum
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.ShareProfile] = function(p1) --[[ Line: 24 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), ProfileSharePolicyEnum (copy), Default (copy), Contexts (copy), SetCurrentToastMessageFunction (copy), TextKeysModule (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p1.localized[EnumsModule.ProfileActions.ShareProfile],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 29 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), ProfileSharePolicyEnum (upval), Default (upval), Contexts (upval), SetCurrentToastMessageFunction (upval), TextKeysModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonShareProfile, { buttonSurface = p1.buttonSurface })
					
					if p1.profileShareLink.policy == ProfileSharePolicyEnum.Disabled then
						Default:setClipboardText({
							context = Contexts.ProfileCard,
							text = string.format("%s/%s", p1.PROFILE_SHARE_LINK_URL, p1.profileId)
						})
						p1.dispatch(SetCurrentToastMessageFunction({ toastMessage = TextKeysModule.LinkCopied }))
						
						return
					else
						p1.profileShareLink.onActivated()
					end
				end
			}
		}
	end
}