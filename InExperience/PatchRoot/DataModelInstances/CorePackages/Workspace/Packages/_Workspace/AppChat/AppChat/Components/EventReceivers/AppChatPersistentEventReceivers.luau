local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local AppChatAccountSettingsEventReceiverModule = require(script.Parent.AppChatAccountSettingsEventReceiver)
local AppChatInterventionEventReceiverModule = require(script.Parent.AppChatInterventionEventReceiver)
local AppChatThirdPartySettingsEventReceiverModule = require(script.Parent.AppChatThirdPartySettingsEventReceiver)
local AppChatNotificationEventReceiverModule = require(script.Parent.AppChatNotificationEventReceiver)
local AppChatRemoveThirdPartyRestrictionModule = require(script.Parent.AppChatRemoveThirdPartyRestriction)
local FFlagAppChatFriendsTabIxpEnabledModule = require(AppChat.Flags.FFlagAppChatFriendsTabIxpEnabled)
local FriendsChatExperimentExposureEventReceiverModule = nil

local function _()
	-- upvalues: FriendsChatExperimentExposureEventReceiverModule (ref)
	if FriendsChatExperimentExposureEventReceiverModule == nil then
		FriendsChatExperimentExposureEventReceiverModule = require(script.Parent.FriendsChatExperimentExposureEventReceiver)
	end
	return FriendsChatExperimentExposureEventReceiverModule
end

local FFlagEnableShareSheet = require(Parent.SharedFlags).FFlagEnableShareSheet
local ExternalChatMessageSenderRegistrationModule = if FFlagEnableShareSheet then require(script.Parent.ExternalChatMessageSenderRegistration) else nil
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")

return function(p1)
	-- upvalues: ReactModule (copy), AppChatAccountSettingsEventReceiverModule (copy), AppChatInterventionEventReceiverModule (copy), ThirdPartyUserService (copy), AppChatThirdPartySettingsEventReceiverModule (copy), AppChatRemoveThirdPartyRestrictionModule (copy), AppChatNotificationEventReceiverModule (copy), FFlagAppChatFriendsTabIxpEnabledModule (copy), FriendsChatExperimentExposureEventReceiverModule (ref), FFlagEnableShareSheet (copy), ExternalChatMessageSenderRegistrationModule (copy)
	local CreateElementFunction1 = ReactModule.createElement
	local Fragment = ReactModule.Fragment
	local v1 = nil
	local config = {
		accountSettings = ReactModule.createElement(AppChatAccountSettingsEventReceiverModule, { isInExperience = p1.isInExperience }),
		intervention = ReactModule.createElement(AppChatInterventionEventReceiverModule, {}),
		thirdPartySettings = ReactModule.createElement(if ThirdPartyUserService == nil or not ThirdPartyUserService:IsChatRestrictionSupported() then AppChatRemoveThirdPartyRestrictionModule else AppChatThirdPartySettingsEventReceiverModule),
		notification = ReactModule.createElement(AppChatNotificationEventReceiverModule, { isInExperience = p1.isInExperience })
	}
	local FriendsChatExperimentExposure = nil
	
	if FFlagAppChatFriendsTabIxpEnabledModule and p1.isInExperience then
		local CreateElementFunction = ReactModule.createElement
		
		if FriendsChatExperimentExposureEventReceiverModule == nil then
			FriendsChatExperimentExposureEventReceiverModule = require(script.Parent.FriendsChatExperimentExposureEventReceiver)
		end
		FriendsChatExperimentExposure = CreateElementFunction(FriendsChatExperimentExposureEventReceiverModule)
	else
		FriendsChatExperimentExposure = nil
	end
	config.friendsChatExperimentExposure = FriendsChatExperimentExposure
	config.externalChatMessageSenderRegistration = if FFlagEnableShareSheet then ReactModule.createElement(ExternalChatMessageSenderRegistrationModule, { isInExperience = p1.isInExperience }) else nil
	
	return CreateElementFunction1(Fragment, v1, config)
end