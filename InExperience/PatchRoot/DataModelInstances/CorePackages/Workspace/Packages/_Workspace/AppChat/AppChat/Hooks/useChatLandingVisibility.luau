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

return function() --[[ line: 24 | named "useChatLandingVisibility" ]]
	-- upvalues: useIsInExperienceModule (ref), useIsChatEnabledModule (ref), useAppPolicyModule (ref), getFFlagHideNotificationIconForVRModule (ref), useSelector (ref), fFlagAppChatRemoveNotifications (ref), getFFlagEnableAppChatInExperience (ref)
	local var6 = useIsInExperienceModule()
	local var7 = useIsChatEnabledModule()
	
	return {
		topBarShowSearch = useAppPolicyModule(function(p0) --[[ line: 28 ]]
			return p0.getChatHeaderSearch()
		end) and (not var6 and var7),
		topBarShowCreateChatGroup = useAppPolicyModule(function(p1) --[[ line: 31 ]]
			return p1.getChatHeaderCreateChatGroup()
		end) and var7,
		topBarShowNotifications = not var6 and (useAppPolicyModule(function(p2) --[[ line: 34 ]]
			-- upvalues: getFFlagHideNotificationIconForVRModule (copy)
			return p2.getChatHeaderNotifications() and (not getFFlagHideNotificationIconForVRModule() or p2.getWebViewSupport())
		end) and not fFlagAppChatRemoveNotifications),
		topBarShowSnoozeNotifications = var6 and getFFlagEnableAppChatInExperience(),
		showSearchRow = var6,
		notificationCount = useSelector(function(p3) --[[ line: 39 ]]
			local notificationBadgeCounts = p3.NotificationBadgeCounts
			
			return if notificationBadgeCounts then notificationBadgeCounts.TopBarNotificationIcon else 0
		end)
	}
end