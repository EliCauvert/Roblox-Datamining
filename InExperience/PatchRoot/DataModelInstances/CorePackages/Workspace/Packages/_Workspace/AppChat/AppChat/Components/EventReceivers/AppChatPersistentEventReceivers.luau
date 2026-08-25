local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local appChatAccountSettingsEventReceiverModule = require(script.Parent.AppChatAccountSettingsEventReceiver)
local appChatInterventionEventReceiverModule = require(script.Parent.AppChatInterventionEventReceiver)
local appChatThirdPartySettingsEventReceiverModule = require(script.Parent.AppChatThirdPartySettingsEventReceiver)
local appChatNotificationEventReceiverModule = require(script.Parent.AppChatNotificationEventReceiver)
local appChatRemoveThirdPartyRestrictionModule = require(script.Parent.AppChatRemoveThirdPartyRestriction)
local fFlagAppChatFriendsTabIxpEnabledModule = require(appChat.Flags.FFlagAppChatFriendsTabIxpEnabled)
local var8 = nil

local function _()
	-- upvalues: var8 (write)
	if var8 == nil then
		var8 = require(script.Parent.FriendsChatExperimentExposureEventReceiver)
	end
	return var8
end

local fFlagEnableShareSheet = require(parent.SharedFlags).FFlagEnableShareSheet
local var9 = if fFlagEnableShareSheet then require(script.Parent.ExternalChatMessageSenderRegistration) else nil
local thirdPartyUserService = game:GetService("ThirdPartyUserService")

return function(p0)
	-- upvalues: reactModule (ref), appChatAccountSettingsEventReceiverModule (ref), appChatInterventionEventReceiverModule (ref), thirdPartyUserService (ref), appChatThirdPartySettingsEventReceiverModule (ref), appChatRemoveThirdPartyRestrictionModule (ref), appChatNotificationEventReceiverModule (ref), fFlagAppChatFriendsTabIxpEnabledModule (ref), var8 (write), fFlagEnableShareSheet (ref), var9 (ref)
	local var13
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var11 = nil
	local t = {
		accountSettings = reactModule.createElement(appChatAccountSettingsEventReceiverModule, { isInExperience = p0.isInExperience }),
		intervention = reactModule.createElement(appChatInterventionEventReceiverModule, {}),
		thirdPartySettings = reactModule.createElement(if thirdPartyUserService == nil or not thirdPartyUserService:IsChatRestrictionSupported() then appChatRemoveThirdPartyRestrictionModule else appChatThirdPartySettingsEventReceiverModule),
		notification = reactModule.createElement(appChatNotificationEventReceiverModule, { isInExperience = p0.isInExperience })
	}
	
	if fFlagAppChatFriendsTabIxpEnabledModule and p0.isInExperience then
		var13 = reactModule.createElement
		
		if var8 == nil then
			var8 = require(script.Parent.FriendsChatExperimentExposureEventReceiver)
		end
		var13 = var13(var8)
	else
		var13 = nil
	end
	t.friendsChatExperimentExposure = var13
	t.externalChatMessageSenderRegistration = if fFlagEnableShareSheet then reactModule.createElement(var9, { isInExperience = p0.isInExperience }) else nil
	
	return createElement(fragment, var11, t)
end