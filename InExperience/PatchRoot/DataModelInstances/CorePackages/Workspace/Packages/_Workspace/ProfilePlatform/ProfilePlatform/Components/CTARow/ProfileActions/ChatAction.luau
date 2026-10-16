local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local GuiService = game:GetService("GuiService")
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local ChatEntryPointNames = require(Parent.SocialCommon).Enums.ChatEntryPointNames
local EnteredChatFromEntryPointModule = require(Parent.AppChat.EnteredChatFromEntryPoint)
local NotificationTypeList = GuiService:GetNotificationTypeList()
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.Chat] = function(p1) --[[ Line: 19 ]]
		-- upvalues: EnumsModule (copy), ButtonVariant (copy), ProfileTypes (copy), EventNamesModule (copy), EnteredChatFromEntryPointModule (copy), ChatEntryPointNames (copy), GuiService (copy), NotificationTypeList (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.Chat],
			variant = ButtonVariant.Standard,
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 24 ]]
					-- upvalues: p1 (copy), EnumsModule (upval), EventNamesModule (upval), EnteredChatFromEntryPointModule (upval), ChatEntryPointNames (upval), GuiService (upval), NotificationTypeList (upval)
					if p1.buttonSurface == EnumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonChat, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonChat, { buttonSurface = p1.buttonSurface })
					end
					p1.dispatch(EnteredChatFromEntryPointModule(ChatEntryPointNames.ProfilePeekView))
					GuiService:BroadcastNotification(p1.profileId, NotificationTypeList.LAUNCH_CONVERSATION)
				end
			}
		}
	end
}