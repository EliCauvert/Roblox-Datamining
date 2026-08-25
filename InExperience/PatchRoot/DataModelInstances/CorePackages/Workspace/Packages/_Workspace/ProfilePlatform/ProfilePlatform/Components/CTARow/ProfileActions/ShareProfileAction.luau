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
	[enumsModule.ProfileActions.ShareProfile] = function(p0)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), profileSharePolicyEnum (ref), default (ref), contexts (ref), setCurrentToastMessage (ref), textKeysModule (ref)
		return {
			variant = buttonVariant.Standard,
			text = p0.localized[enumsModule.ProfileActions.ShareProfile],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p0 (ref), eventNamesModule (copy), profileSharePolicyEnum (copy), default (copy), contexts (copy), setCurrentToastMessage (copy), textKeysModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfile, { buttonSurface = p0.buttonSurface })
					
					if p0.profileShareLink.policy == profileSharePolicyEnum.Disabled then
						default:setClipboardText({
							context = contexts.ProfileCard,
							text = string.format("%s/%s", p0.PROFILE_SHARE_LINK_URL, p0.profileId)
						})
						p0.dispatch(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
						
						return
					end
					p0.profileShareLink.onActivated()
				end
			}
		}
	end
}