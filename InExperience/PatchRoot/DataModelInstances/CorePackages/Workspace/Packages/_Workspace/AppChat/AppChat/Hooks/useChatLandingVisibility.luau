local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableAppChatInExperienceFunction = SharedFlagsModule.GetFFlagEnableAppChatInExperience
local UseAppPolicyModule = require(AppChat.Hooks.useAppPolicy)
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local GetFFlagHideNotificationIconForVRModule = require(AppChat.Flags.getFFlagHideNotificationIconForVR)
local FFlagAppChatRemoveNotifications = SharedFlagsModule.FFlagAppChatRemoveNotifications
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 24 | Named "useChatLandingVisibility" ]]
	-- upvalues: UseIsInExperienceModule (copy), UseIsChatEnabledModule (copy), UseAppPolicyModule (copy), GetFFlagHideNotificationIconForVRModule (copy), UseSelectorFunction (copy), FFlagAppChatRemoveNotifications (copy), GetFFlagEnableAppChatInExperienceFunction (copy)
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1) --[[ Line: 28 ]]
		return p1.getChatHeaderSearch()
	end)
	local UseAppPolicyModuleResult1 = UseAppPolicyModule(function(p1) --[[ Line: 31 ]]
		return p1.getChatHeaderCreateChatGroup()
	end)
	local UseAppPolicyModuleResult2 = UseAppPolicyModule(function(p1) --[[ Line: 34 ]]
		-- upvalues: GetFFlagHideNotificationIconForVRModule (upval)
		return p1.getChatHeaderNotifications() and (not GetFFlagHideNotificationIconForVRModule() or p1.getWebViewSupport())
	end)
	
	return {
		topBarShowSearch = UseAppPolicyModuleResult and (not UseIsInExperienceModuleResult and UseIsChatEnabledModuleResult),
		topBarShowCreateChatGroup = UseAppPolicyModuleResult1 and UseIsChatEnabledModuleResult,
		topBarShowNotifications = not UseIsInExperienceModuleResult and (UseAppPolicyModuleResult2 and not FFlagAppChatRemoveNotifications),
		topBarShowSnoozeNotifications = UseIsInExperienceModuleResult and GetFFlagEnableAppChatInExperienceFunction(),
		showSearchRow = UseIsInExperienceModuleResult,
		notificationCount = UseSelectorFunction(function(p1) --[[ Line: 39 ]]
			local NotificationBadgeCounts = p1.NotificationBadgeCounts
			
			return NotificationBadgeCounts and NotificationBadgeCounts.TopBarNotificationIcon or 0
		end)
	}
end