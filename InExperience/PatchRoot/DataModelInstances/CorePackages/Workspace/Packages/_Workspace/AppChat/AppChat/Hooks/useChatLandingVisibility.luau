local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableAppChatInExperience = sharedFlagsModule.GetFFlagEnableAppChatInExperience
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local getFFlagHideNotificationIconForVRModule = require(appChat.Flags.getFFlagHideNotificationIconForVR)
local fFlagAppChatRemoveNotifications = sharedFlagsModule.FFlagAppChatRemoveNotifications
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useIsInExperienceModule (ref), useIsChatEnabledModule (ref), useAppPolicyModule (ref), getFFlagHideNotificationIconForVRModule (ref), useSelector (ref), fFlagAppChatRemoveNotifications (ref), getFFlagEnableAppChatInExperience (ref)
	local var1 = useIsInExperienceModule()
	local var2 = useIsChatEnabledModule()
	
	return {
		topBarShowSearch = useAppPolicyModule(function(p1)
			return p1.getChatHeaderSearch()
		end) and (not var1 and var2),
		topBarShowCreateChatGroup = useAppPolicyModule(function(p1)
			return p1.getChatHeaderCreateChatGroup()
		end) and var2,
		topBarShowNotifications = not var1 and (useAppPolicyModule(function(p1)
			-- upvalues: getFFlagHideNotificationIconForVRModule (copy)
			return p1.getChatHeaderNotifications() and (not getFFlagHideNotificationIconForVRModule() or p1.getWebViewSupport())
		end) and not fFlagAppChatRemoveNotifications),
		topBarShowSnoozeNotifications = var1 and getFFlagEnableAppChatInExperience(),
		showSearchRow = var1,
		notificationCount = useSelector(function(p1)
			local notificationBadgeCounts = p1.NotificationBadgeCounts
			
			return if notificationBadgeCounts then notificationBadgeCounts.TopBarNotificationIcon else 0
		end)
	}
end