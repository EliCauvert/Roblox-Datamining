local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local appChatAccountSettingsEventReceiverModule = require(script.Parent.AppChatAccountSettingsEventReceiver)
local appChatInterventionEventReceiverModule = require(script.Parent.AppChatInterventionEventReceiver)
local appChatThirdPartySettingsEventReceiverModule = require(script.Parent.AppChatThirdPartySettingsEventReceiver)
local appChatNotificationEventReceiverModule = require(script.Parent.AppChatNotificationEventReceiver)
local appChatRemoveThirdPartyRestrictionModule = require(script.Parent.AppChatRemoveThirdPartyRestriction)
local fFlagAppChatFriendsTabIxpEnabledModule = require(appChat.Flags.FFlagAppChatFriendsTabIxpEnabled)
local var1 = nil

local function _()
	-- upvalues: var1 (write)
	if var1 == nil then
		var1 = require(script.Parent.FriendsChatExperimentExposureEventReceiver)
	end
	return var1
end

local fFlagEnableShareSheet = require(parent.SharedFlags).FFlagEnableShareSheet
local var2 = if fFlagEnableShareSheet then require(script.Parent.ExternalChatMessageSenderRegistration) else nil
local thirdPartyUserService = game:GetService("ThirdPartyUserService")

return function(p1)
	-- upvalues: reactModule (ref), appChatAccountSettingsEventReceiverModule (ref), appChatInterventionEventReceiverModule (ref), thirdPartyUserService (ref), appChatThirdPartySettingsEventReceiverModule (ref), appChatRemoveThirdPartyRestrictionModule (ref), appChatNotificationEventReceiverModule (ref), fFlagAppChatFriendsTabIxpEnabledModule (ref), var1 (write), fFlagEnableShareSheet (ref), var2 (ref)
	local var3
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var4 = nil
	local t = {
		accountSettings = reactModule.createElement(appChatAccountSettingsEventReceiverModule, { isInExperience = p1.isInExperience }),
		intervention = reactModule.createElement(appChatInterventionEventReceiverModule, {}),
		thirdPartySettings = reactModule.createElement(if thirdPartyUserService == nil or not thirdPartyUserService:IsChatRestrictionSupported() then appChatRemoveThirdPartyRestrictionModule else appChatThirdPartySettingsEventReceiverModule),
		notification = reactModule.createElement(appChatNotificationEventReceiverModule, { isInExperience = p1.isInExperience })
	}
	
	if fFlagAppChatFriendsTabIxpEnabledModule and p1.isInExperience then
		var3 = reactModule.createElement
		
		if var1 == nil then
			var1 = require(script.Parent.FriendsChatExperimentExposureEventReceiver)
		end
		var3 = var3(var1)
	else
		var3 = nil
	end
	t.friendsChatExperimentExposure = var3
	t.externalChatMessageSenderRegistration = if fFlagEnableShareSheet then reactModule.createElement(var2, { isInExperience = p1.isInExperience }) else nil
	
	return createElement(fragment, var4, t)
end