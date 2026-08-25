local guiService = game:GetService("GuiService")
local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local socialCommonModule = require(parent.SocialCommon)
local localizationModule = require(parent.Localization)
local friendsNetworkingModule = require(parent.FriendsNetworking)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local useLocalization = localizationModule.Hooks.useLocalization
local enteredChatFromEntryPointModule = require(parent.AppChat.EnteredChatFromEntryPoint)
local chatEntryPointNames = socialCommonModule.Enums.ChatEntryPointNames
local friendshipOriginSourceType = friendsNetworkingModule.Enums.FriendshipOriginSourceType
local buttonTypes = require(parent.UserList).Enums.ButtonTypes
local textKeysModule = require(socialTabsPage.Common.TextKeys)
local _ = require(socialTabsPage.Common.Types)
local friendingActionsModule = require(socialTabsPage.Utils.friendingActions)
local notificationTypeList = guiService:GetNotificationTypeList()

return function()
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), buttonTypes (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref), friendingActionsModule (ref), friendshipOriginSourceType (ref)
	local var12 = useDispatch()
	local var13 = useLocalUserId()
	local var14 = reactModule.useRef({})
	local var15 = useLocalization({
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
	
	return reactModule.useMemo(function()
		-- upvalues: buttonTypes (copy), var12 (ref), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy), var14 (ref), friendingActionsModule (copy), var13 (ref), friendshipOriginSourceType (copy), var15 (ref)
		return {
			[buttonTypes.Chat] = function(p0)
				-- upvalues: var12 (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy)
				var12(enteredChatFromEntryPointModule(chatEntryPointNames.SocialTab))
				guiService:BroadcastNotification(p0, notificationTypeList.LAUNCH_CONVERSATION)
			end,
			[buttonTypes.Add] = function(p1)
				-- upvalues: var14 (copy), friendingActionsModule (copy), var12 (copy), var13 (copy), friendshipOriginSourceType (copy), var15 (copy)
				if var14.current[p1] then
					return
				end
				var14.current[p1] = true
				friendingActionsModule.executeAddFriend({
					dispatch = var12,
					currentUserId = var13,
					targetUserId = p1,
					friendshipOriginSourceType = friendshipOriginSourceType.UserProfile.rawValue(),
					localized = var15
				}):finally(function()
					-- upvalues: var14 (copy), p1 (ref)
					var14.current[p1] = nil
				end)
			end,
			[buttonTypes.Accept] = function(p2)
				-- upvalues: var14 (copy), friendingActionsModule (copy), var12 (copy), var13 (copy), var15 (copy)
				if var14.current[p2] then
					return
				end
				var14.current[p2] = true
				friendingActionsModule.executeAcceptFriendRequest({
					dispatch = var12,
					currentUserId = var13,
					targetUserId = p2,
					localized = var15
				}):finally(function()
					-- upvalues: var14 (copy), p2 (ref)
					var14.current[p2] = nil
				end)
			end
		}
	end, { var12, var13, var15 })
end