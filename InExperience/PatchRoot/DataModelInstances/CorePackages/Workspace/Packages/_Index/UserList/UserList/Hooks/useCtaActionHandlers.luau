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

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), fFlagUserListCtaAnalyticsEnabled (ref), buttonTypes (ref), guiService (ref), notificationTypeList (ref), friendingActionsModule (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useRef({})
	local var3 = useLocalization({
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
	local var4 = if p1 then p1.friendshipOriginSourceType else nil
	local var5 = if fFlagUserListCtaAnalyticsEnabled then if p1 then p1.onCtaActivated else nil else nil
	
	return reactModule.useMemo(function()
		-- upvalues: buttonTypes (copy), fFlagUserListCtaAnalyticsEnabled (copy), var5 (write), guiService (copy), notificationTypeList (copy), var2 (ref), friendingActionsModule (copy), var1 (ref), var4 (ref), var3 (ref)
		return {
			[buttonTypes.Chat] = function(p2)
				-- upvalues: fFlagUserListCtaAnalyticsEnabled (copy), var5 (copy), buttonTypes (copy), guiService (copy), notificationTypeList (copy)
				if fFlagUserListCtaAnalyticsEnabled and var5 ~= nil then
					var5({ buttonType = buttonTypes.Chat, userId = p2 })
				end
				guiService:BroadcastNotification(p2, notificationTypeList.LAUNCH_CONVERSATION)
			end,
			[buttonTypes.Add] = function(p2)
				-- upvalues: var2 (copy), fFlagUserListCtaAnalyticsEnabled (copy), var5 (copy), buttonTypes (copy), friendingActionsModule (copy), var1 (copy), var4 (copy), var3 (copy)
				if var2.current[p2] then return end
				var2.current[p2] = true
				
				if fFlagUserListCtaAnalyticsEnabled and var5 ~= nil then
					var5({ buttonType = buttonTypes.Add, userId = p2 })
				end
				friendingActionsModule.executeAddFriend({
					dispatch = var1,
					targetUserId = p2,
					friendshipOriginSourceType = var4,
					localized = var3
				}):finally(function()
					-- upvalues: var2 (copy), p2 (ref)
					var2.current[p2] = nil
				end)
			end,
			[buttonTypes.Accept] = function(p2)
				-- upvalues: var2 (copy), fFlagUserListCtaAnalyticsEnabled (copy), var5 (copy), buttonTypes (copy), friendingActionsModule (copy), var1 (copy), var3 (copy)
				if var2.current[p2] then return end
				var2.current[p2] = true
				
				if fFlagUserListCtaAnalyticsEnabled and var5 ~= nil then
					var5({ buttonType = buttonTypes.Accept, userId = p2 })
				end
				friendingActionsModule.executeAcceptFriendRequest({ dispatch = var1, targetUserId = p2, localized = var3 }):finally(function()
					-- upvalues: var2 (copy), p2 (ref)
					var2.current[p2] = nil
				end)
			end,
			[buttonTypes.Dismiss] = function(p2)
				-- upvalues: var2 (copy), fFlagUserListCtaAnalyticsEnabled (copy), var5 (copy), buttonTypes (copy), friendingActionsModule (copy), var1 (copy), var3 (copy)
				if var2.current[p2] then return end
				var2.current[p2] = true
				
				if fFlagUserListCtaAnalyticsEnabled and var5 ~= nil then
					var5({ buttonType = buttonTypes.Dismiss, userId = p2 })
				end
				friendingActionsModule.executeDeclineFriendRequest({ dispatch = var1, targetUserId = p2, localized = var3 }):finally(function()
					-- upvalues: var2 (copy), p2 (ref)
					var2.current[p2] = nil
				end)
			end
		}
	end, { var1, var3, var4, var5 })
end