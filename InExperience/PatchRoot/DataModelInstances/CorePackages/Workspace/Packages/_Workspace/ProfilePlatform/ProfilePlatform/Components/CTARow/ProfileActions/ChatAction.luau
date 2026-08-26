local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local guiService = game:GetService("GuiService")
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local chatEntryPointNames = require(parent.SocialCommon).Enums.ChatEntryPointNames
local enteredChatFromEntryPointModule = require(parent.AppChat.EnteredChatFromEntryPoint)
local notificationTypeList = guiService:GetNotificationTypeList()
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.Chat] = function(p1)
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.Chat],
			variant = buttonVariant.Standard,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), enumsModule (copy), eventNamesModule (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy)
					if p1.buttonSurface == enumsModule.ButtonSurface.ContextualMenu then
						p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonChat, { buttonSurface = p1.buttonSurface })
					else
						p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonChat, { buttonSurface = p1.buttonSurface })
					end
					p1.dispatch(enteredChatFromEntryPointModule(chatEntryPointNames.ProfilePeekView))
					guiService:BroadcastNotification(p1.profileId, notificationTypeList.LAUNCH_CONVERSATION)
				end
			}
		}
	end
}