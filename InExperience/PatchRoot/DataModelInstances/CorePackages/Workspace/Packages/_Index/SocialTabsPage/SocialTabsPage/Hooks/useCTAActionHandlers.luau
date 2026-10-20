local GuiService = game:GetService("GuiService")
local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EnteredChatFromEntryPointModule = require(Parent.AppChat.EnteredChatFromEntryPoint)
local ChatEntryPointNames = require(Parent.SocialCommon).Enums.ChatEntryPointNames
local FriendshipOriginSourceType = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType
local ButtonTypes = require(Parent.UserList).Enums.ButtonTypes
local TextKeysModule = require(SocialTabsPage.Common.TextKeys)
local _ = require(SocialTabsPage.Common.Types)
local FriendingActionsModule = require(SocialTabsPage.Utils.friendingActions)
local NotificationTypeList = GuiService:GetNotificationTypeList()

return function()
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ButtonTypes (copy), EnteredChatFromEntryPointModule (copy), ChatEntryPointNames (copy), GuiService (copy), NotificationTypeList (copy), FriendingActionsModule (copy), FriendshipOriginSourceType (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRefResult = ReactModule.useRef({})
	local UseLocalizationResult = UseLocalizationFunction({
		friendRequestSent = TextKeysModule.FriendRequestSent,
		friendAdded = TextKeysModule.FriendAdded,
		invalidTargetUserError = TextKeysModule.InvalidTargetUserError,
		alreadyFriendError = TextKeysModule.AlreadyFriendError,
		maxFriendsError = TextKeysModule.MaxFriendsError,
		invalidNicknameError = TextKeysModule.InvalidNicknameError,
		unauthorizedError = TextKeysModule.UnauthorizedError,
		userBannedError = TextKeysModule.UserBannedError,
		userBlockedError = TextKeysModule.UserBlockedError,
		userNotPassedCaptchaError = TextKeysModule.UserNotPassedCaptchaError,
		tooManyRequestsError = TextKeysModule.TooManyRequestsError,
		defaultFriendingError = TextKeysModule.DefaultFriendingError
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: ButtonTypes (upval), UseDispatchResult (copy), EnteredChatFromEntryPointModule (upval), ChatEntryPointNames (upval), GuiService (upval), NotificationTypeList (upval), UseRefResult (copy), FriendingActionsModule (upval), UseLocalUserIdResult (copy), FriendshipOriginSourceType (upval), UseLocalizationResult (copy)
		return {
			[ButtonTypes.Chat] = function(Data)
				-- upvalues: UseDispatchResult (upval), EnteredChatFromEntryPointModule (upval), ChatEntryPointNames (upval), GuiService (upval), NotificationTypeList (upval)
				UseDispatchResult(EnteredChatFromEntryPointModule(ChatEntryPointNames.SocialTab))
				GuiService:BroadcastNotification(Data, NotificationTypeList.LAUNCH_CONVERSATION)
			end,
			[ButtonTypes.Add] = function(TargetUserId)
				-- upvalues: UseRefResult (upval), FriendingActionsModule (upval), UseDispatchResult (upval), UseLocalUserIdResult (upval), FriendshipOriginSourceType (upval), UseLocalizationResult (upval)
				if not UseRefResult.current[TargetUserId] then
					UseRefResult.current[TargetUserId] = true
					FriendingActionsModule.executeAddFriend({
						dispatch = UseDispatchResult,
						currentUserId = UseLocalUserIdResult,
						targetUserId = TargetUserId,
						friendshipOriginSourceType = FriendshipOriginSourceType.UserProfile.rawValue(),
						localized = UseLocalizationResult
					}):finally(function()
						-- upvalues: UseRefResult (upval), TargetUserId (copy)
						UseRefResult.current[TargetUserId] = nil
					end)
					
					return
				end
			end,
			[ButtonTypes.Accept] = function(TargetUserId)
				-- upvalues: UseRefResult (upval), FriendingActionsModule (upval), UseDispatchResult (upval), UseLocalUserIdResult (upval), UseLocalizationResult (upval)
				if not UseRefResult.current[TargetUserId] then
					UseRefResult.current[TargetUserId] = true
					FriendingActionsModule.executeAcceptFriendRequest({
						dispatch = UseDispatchResult,
						currentUserId = UseLocalUserIdResult,
						targetUserId = TargetUserId,
						localized = UseLocalizationResult
					}):finally(function()
						-- upvalues: UseRefResult (upval), TargetUserId (copy)
						UseRefResult.current[TargetUserId] = nil
					end)
					
					return
				end
			end
		}
	end, {
		UseDispatchResult,
		UseLocalUserIdResult,
		UseLocalizationResult
	})
end