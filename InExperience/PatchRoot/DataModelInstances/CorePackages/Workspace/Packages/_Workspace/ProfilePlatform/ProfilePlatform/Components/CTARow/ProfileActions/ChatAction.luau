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
	[enumsModule.ProfileActions.Chat] = function(p0)
		-- upvalues: enumsModule (ref), buttonVariant (ref), profileTypes (ref), eventNamesModule (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.Chat],
			variant = buttonVariant.Standard,
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p0 (ref), enumsModule (copy), eventNamesModule (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy)
					if p0.buttonSurface == enumsModule.ButtonSurface.ContextualMenu then
						p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonChat, { buttonSurface = p0.buttonSurface })
					else
						p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonChat, { buttonSurface = p0.buttonSurface })
					end
					p0.dispatch(enteredChatFromEntryPointModule(chatEntryPointNames.ProfilePeekView))
					guiService:BroadcastNotification(p0.profileId, notificationTypeList.LAUNCH_CONVERSATION)
				end
			}
		}
	end
}