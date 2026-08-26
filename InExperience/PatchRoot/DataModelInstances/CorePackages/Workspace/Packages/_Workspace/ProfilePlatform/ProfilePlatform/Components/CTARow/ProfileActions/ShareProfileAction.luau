local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local profileSharePolicyEnum = require(parent.ProfileShareLinks).Enums.ProfileSharePolicyEnum
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.ShareProfile] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), profileSharePolicyEnum (ref), default (ref), contexts (ref), setCurrentToastMessage (ref), textKeysModule (ref)
		return {
			variant = buttonVariant.Standard,
			text = p1.localized[enumsModule.ProfileActions.ShareProfile],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), profileSharePolicyEnum (copy), default (copy), contexts (copy), setCurrentToastMessage (copy), textKeysModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfile, { buttonSurface = p1.buttonSurface })
					
					if p1.profileShareLink.policy == profileSharePolicyEnum.Disabled then
						default:setClipboardText({
							context = contexts.ProfileCard,
							text = string.format("%s/%s", p1.PROFILE_SHARE_LINK_URL, p1.profileId)
						})
						p1.dispatch(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
						
						return
					end
					p1.profileShareLink.onActivated()
				end
			}
		}
	end
}