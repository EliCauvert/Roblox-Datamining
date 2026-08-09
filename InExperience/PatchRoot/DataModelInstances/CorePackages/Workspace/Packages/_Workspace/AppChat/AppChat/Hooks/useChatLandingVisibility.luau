local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getFFlagEnableAppChatInExperience = require(parent.SharedFlags).GetFFlagEnableAppChatInExperience
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local getFFlagHideNotificationIconForVRModule = require(appChat.Flags.getFFlagHideNotificationIconForVR)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 23 | named "useChatLandingVisibility" ]]
	-- upvalues: useIsInExperienceModule (ref), useIsChatEnabledModule (ref), useAppPolicyModule (ref), getFFlagHideNotificationIconForVRModule (ref), useSelector (ref), getFFlagEnableAppChatInExperience (ref)
	local var5 = useIsInExperienceModule()
	local var6 = useIsChatEnabledModule()
	
	return {
		topBarShowSearch = useAppPolicyModule(function(p0) --[[ line: 27 ]]
			return p0.getChatHeaderSearch()
		end) and (not var5 and var6),
		topBarShowCreateChatGroup = useAppPolicyModule(function(p1) --[[ line: 30 ]]
			return p1.getChatHeaderCreateChatGroup()
		end) and var6,
		topBarShowNotifications = not var5 and useAppPolicyModule(function(p2) --[[ line: 33 ]]
			-- upvalues: getFFlagHideNotificationIconForVRModule (copy)
			return p2.getChatHeaderNotifications() and (not getFFlagHideNotificationIconForVRModule() or p2.getWebViewSupport())
		end),
		topBarShowSnoozeNotifications = var5 and getFFlagEnableAppChatInExperience(),
		showSearchRow = var5,
		notificationCount = useSelector(function(p3) --[[ line: 38 ]]
			local notificationBadgeCounts = p3.NotificationBadgeCounts
			
			return if notificationBadgeCounts then notificationBadgeCounts.TopBarNotificationIcon else 0
		end)
	}
end