local guiService = game:GetService("GuiService")
local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local localizationModule = require(parent.Localization)
local enumsModule = require(userList.Common.Enums)
local fFlagUserListCtaAnalyticsEnabled = require(parent.SharedFlags).FFlagUserListCtaAnalyticsEnabled
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local buttonTypes = enumsModule.ButtonTypes
local textKeysModule = require(userList.Common.TextKeys)
local _ = require(userList.Common.Types)
local friendingActionsModule = require(userList.Cta.friendingActions)
local notificationTypeList = guiService:GetNotificationTypeList()

return function(p0) --[[ line: 29 | named "useCtaActionHandlers" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), fFlagUserListCtaAnalyticsEnabled (ref), buttonTypes (ref), guiService (ref), notificationTypeList (ref), friendingActionsModule (ref)
	local var9 = useDispatch()
	local var10 = reactModule.useRef({})
	local var11 = useLocalization({
		friendRequestSent = textKeysModule.FriendRequestSent,
		friendAdded = textKeysModule.FriendAdded,
		invalidTargetUserError = textKeysModule.InvalidTargetUserError,
		alreadyFriendError = textKeysModule.AlreadyFriendError,
		maxFriendsError = textKeysModule.MaxFriendsError,
		invalidNicknameError = textKeysModule.InvalidNicknameError,
		unauthorizedError = textKeysModule.UnauthorizedError,
		userBannedError = textKeysModule.UserBannedError,
		userBlockedError = textKeysModule.UserBlockedError,
		userNotPassedCaptchaError = textKeysModule.UserNotPassedCaptchaError,
		tooManyRequestsError = textKeysModule.TooManyRequestsError,
		defaultFriendingError = textKeysModule.DefaultFriendingError
	})
	local var12 = if p0 then p0.friendshipOriginSourceType else nil
	local var13 = if fFlagUserListCtaAnalyticsEnabled then if p0 then p0.onCtaActivated else nil else nil
	
	return reactModule.useMemo(function() --[[ line: 55 ]]
		-- upvalues: buttonTypes (copy), fFlagUserListCtaAnalyticsEnabled (copy), var13 (write), guiService (copy), notificationTypeList (copy), var10 (ref), friendingActionsModule (copy), var9 (ref), var12 (ref), var11 (ref)
		return {
			[buttonTypes.Chat] = function(p1) --[[ line: 57 ]]
				-- upvalues: fFlagUserListCtaAnalyticsEnabled (copy), var13 (copy), buttonTypes (copy), guiService (copy), notificationTypeList (copy)
				if fFlagUserListCtaAnalyticsEnabled and var13 ~= nil then
					var13({ buttonType = buttonTypes.Chat, userId = p1 })
				end
				guiService:BroadcastNotification(p1, notificationTypeList.LAUNCH_CONVERSATION)
			end,
			[buttonTypes.Add] = function(p2) --[[ line: 64 ]]
				-- upvalues: var10 (copy), fFlagUserListCtaAnalyticsEnabled (copy), var13 (copy), buttonTypes (copy), friendingActionsModule (copy), var9 (copy), var12 (copy), var11 (copy)
				if var10.current[p2] then return end
				var10.current[p2] = true
				
				if fFlagUserListCtaAnalyticsEnabled and var13 ~= nil then
					var13({ buttonType = buttonTypes.Add, userId = p2 })
				end
				friendingActionsModule.executeAddFriend({
					dispatch = var9,
					targetUserId = p2,
					friendshipOriginSourceType = var12,
					localized = var11
				}):finally(function() --[[ line: 79 ]]
					-- upvalues: var10 (copy), p2 (ref)
					var10.current[p2] = nil
				end)
			end,
			[buttonTypes.Accept] = function(p3) --[[ line: 84 ]]
				-- upvalues: var10 (copy), fFlagUserListCtaAnalyticsEnabled (copy), var13 (copy), buttonTypes (copy), friendingActionsModule (copy), var9 (copy), var11 (copy)
				if var10.current[p3] then return end
				var10.current[p3] = true
				
				if fFlagUserListCtaAnalyticsEnabled and var13 ~= nil then
					var13({ buttonType = buttonTypes.Accept, userId = p3 })
				end
				friendingActionsModule.executeAcceptFriendRequest({ dispatch = var9, targetUserId = p3, localized = var11 }):finally(function() --[[ line: 98 ]]
					-- upvalues: var10 (copy), p3 (ref)
					var10.current[p3] = nil
				end)
			end,
			[buttonTypes.Dismiss] = function(p4) --[[ line: 103 ]]
				-- upvalues: var10 (copy), fFlagUserListCtaAnalyticsEnabled (copy), var13 (copy), buttonTypes (copy), friendingActionsModule (copy), var9 (copy), var11 (copy)
				if var10.current[p4] then return end
				var10.current[p4] = true
				
				if fFlagUserListCtaAnalyticsEnabled and var13 ~= nil then
					var13({ buttonType = buttonTypes.Dismiss, userId = p4 })
				end
				friendingActionsModule.executeDeclineFriendRequest({ dispatch = var9, targetUserId = p4, localized = var11 }):finally(function() --[[ line: 117 ]]
					-- upvalues: var10 (copy), p4 (ref)
					var10.current[p4] = nil
				end)
			end
		}
	end, { var9, var11, var12, var13 })
end