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
	local var1 = useDispatch()
	local var2 = useLocalUserId()
	local var3 = reactModule.useRef({})
	local var4 = useLocalization({
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
		-- upvalues: buttonTypes (copy), var1 (ref), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy), var3 (ref), friendingActionsModule (copy), var2 (ref), friendshipOriginSourceType (copy), var4 (ref)
		return {
			[buttonTypes.Chat] = function(p1)
				-- upvalues: var1 (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy)
				var1(enteredChatFromEntryPointModule(chatEntryPointNames.SocialTab))
				guiService:BroadcastNotification(p1, notificationTypeList.LAUNCH_CONVERSATION)
			end,
			[buttonTypes.Add] = function(p1)
				-- upvalues: var3 (copy), friendingActionsModule (copy), var1 (copy), var2 (copy), friendshipOriginSourceType (copy), var4 (copy)
				if var3.current[p1] then
					return
				end
				var3.current[p1] = true
				friendingActionsModule.executeAddFriend({
					dispatch = var1,
					currentUserId = var2,
					targetUserId = p1,
					friendshipOriginSourceType = friendshipOriginSourceType.UserProfile.rawValue(),
					localized = var4
				}):finally(function()
					-- upvalues: var3 (copy), p1 (ref)
					var3.current[p1] = nil
				end)
			end,
			[buttonTypes.Accept] = function(p1)
				-- upvalues: var3 (copy), friendingActionsModule (copy), var1 (copy), var2 (copy), var4 (copy)
				if var3.current[p1] then
					return
				end
				var3.current[p1] = true
				friendingActionsModule.executeAcceptFriendRequest({
					dispatch = var1,
					currentUserId = var2,
					targetUserId = p1,
					localized = var4
				}):finally(function()
					-- upvalues: var3 (copy), p1 (ref)
					var3.current[p1] = nil
				end)
			end
		}
	end, { var1, var2, var4 })
end