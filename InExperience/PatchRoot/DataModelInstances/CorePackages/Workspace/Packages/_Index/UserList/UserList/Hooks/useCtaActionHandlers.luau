local GuiService = game:GetService("GuiService")
local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local EnteredChatFromEntryPointFunction = require(Parent.SocialCommon).Actions.EnteredChatFromEntryPoint
local FFlagUserListCtaAnalyticsEnabled = require(Parent.SharedFlags).FFlagUserListCtaAnalyticsEnabled
local FFlagUserListCanonicalCtaAnalyticsModule = require(UserList.Flags.FFlagUserListCanonicalCtaAnalytics)
local ReportCtaActivatedModule = require(UserList.Analytics.reportCtaActivated)
local FFlagSharedChatEntryPointAction = require(Parent.SharedFlags).FFlagSharedChatEntryPointAction
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonTypes = require(UserList.Common.Enums).ButtonTypes
local TextKeysModule = require(UserList.Common.TextKeys)
local _ = require(UserList.Common.Types)
local FriendingActionsModule = require(UserList.Cta.friendingActions)
local NotificationTypeList = GuiService:GetNotificationTypeList()

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), FFlagSharedChatEntryPointAction (copy), FFlagUserListCtaAnalyticsEnabled (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy), ButtonTypes (copy), ReportCtaActivatedModule (copy), EnteredChatFromEntryPointFunction (copy), GuiService (copy), NotificationTypeList (copy), FriendingActionsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
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
	local FriendshipOriginSourceType = if p1 then p1.friendshipOriginSourceType else nil
	local ChatEntryPoint = if FFlagSharedChatEntryPointAction and p1 then p1.chatEntryPoint else nil
	local OnCtaActivated = if FFlagUserListCtaAnalyticsEnabled and p1 then p1.onCtaActivated else nil
	local Analytics = if FFlagUserListCanonicalCtaAnalyticsModule and p1 then p1.analytics else nil
	
	return ReactModule.useMemo(function()
		-- upvalues: ButtonTypes (upval), FFlagUserListCtaAnalyticsEnabled (upval), OnCtaActivated (ref), FFlagUserListCanonicalCtaAnalyticsModule (upval), ReportCtaActivatedModule (upval), Analytics (ref), FFlagSharedChatEntryPointAction (upval), ChatEntryPoint (ref), UseDispatchResult (copy), EnteredChatFromEntryPointFunction (upval), GuiService (upval), NotificationTypeList (upval), UseRefResult (copy), FriendingActionsModule (upval), FriendshipOriginSourceType (copy), UseLocalizationResult (copy)
		return {
			[ButtonTypes.Chat] = function(UserId, p2)
				-- upvalues: FFlagUserListCtaAnalyticsEnabled (upval), OnCtaActivated (upval), ButtonTypes (upval), FFlagUserListCanonicalCtaAnalyticsModule (upval), ReportCtaActivatedModule (upval), Analytics (upval), FFlagSharedChatEntryPointAction (upval), ChatEntryPoint (upval), UseDispatchResult (upval), EnteredChatFromEntryPointFunction (upval), GuiService (upval), NotificationTypeList (upval)
				if FFlagUserListCtaAnalyticsEnabled and OnCtaActivated ~= nil then
					OnCtaActivated({ buttonType = ButtonTypes.Chat, userId = UserId })
				end
				if FFlagUserListCanonicalCtaAnalyticsModule then
					ReportCtaActivatedModule(Analytics, ButtonTypes.Chat, UserId, p2)
				end
				if FFlagSharedChatEntryPointAction and ChatEntryPoint ~= nil then
					UseDispatchResult(EnteredChatFromEntryPointFunction(ChatEntryPoint))
				end
				GuiService:BroadcastNotification(UserId, NotificationTypeList.LAUNCH_CONVERSATION)
			end,
			[ButtonTypes.Add] = function(TargetUserId, p2)
				-- upvalues: UseRefResult (upval), FFlagUserListCtaAnalyticsEnabled (upval), OnCtaActivated (upval), ButtonTypes (upval), FFlagUserListCanonicalCtaAnalyticsModule (upval), ReportCtaActivatedModule (upval), Analytics (upval), FriendingActionsModule (upval), UseDispatchResult (upval), FriendshipOriginSourceType (upval), UseLocalizationResult (upval)
				if UseRefResult.current[TargetUserId] then return end
				UseRefResult.current[TargetUserId] = true
				
				if FFlagUserListCtaAnalyticsEnabled and OnCtaActivated ~= nil then
					OnCtaActivated({ buttonType = ButtonTypes.Add, userId = TargetUserId })
				end
				if FFlagUserListCanonicalCtaAnalyticsModule then
					ReportCtaActivatedModule(Analytics, ButtonTypes.Add, TargetUserId, p2)
				end
				FriendingActionsModule.executeAddFriend({
					dispatch = UseDispatchResult,
					targetUserId = TargetUserId,
					friendshipOriginSourceType = FriendshipOriginSourceType,
					localized = UseLocalizationResult
				}):finally(function()
					-- upvalues: UseRefResult (upval), TargetUserId (copy)
					UseRefResult.current[TargetUserId] = nil
				end)
			end,
			[ButtonTypes.Accept] = function(TargetUserId, p2)
				-- upvalues: UseRefResult (upval), FFlagUserListCtaAnalyticsEnabled (upval), OnCtaActivated (upval), ButtonTypes (upval), FFlagUserListCanonicalCtaAnalyticsModule (upval), ReportCtaActivatedModule (upval), Analytics (upval), FriendingActionsModule (upval), UseDispatchResult (upval), UseLocalizationResult (upval)
				if UseRefResult.current[TargetUserId] then return end
				UseRefResult.current[TargetUserId] = true
				
				if FFlagUserListCtaAnalyticsEnabled and OnCtaActivated ~= nil then
					OnCtaActivated({ buttonType = ButtonTypes.Accept, userId = TargetUserId })
				end
				if FFlagUserListCanonicalCtaAnalyticsModule then
					ReportCtaActivatedModule(Analytics, ButtonTypes.Accept, TargetUserId, p2)
				end
				FriendingActionsModule.executeAcceptFriendRequest({
					dispatch = UseDispatchResult,
					targetUserId = TargetUserId,
					localized = UseLocalizationResult
				}):finally(function()
					-- upvalues: UseRefResult (upval), TargetUserId (copy)
					UseRefResult.current[TargetUserId] = nil
				end)
			end,
			[ButtonTypes.Dismiss] = function(TargetUserId, p2)
				-- upvalues: UseRefResult (upval), FFlagUserListCtaAnalyticsEnabled (upval), OnCtaActivated (upval), ButtonTypes (upval), FFlagUserListCanonicalCtaAnalyticsModule (upval), ReportCtaActivatedModule (upval), Analytics (upval), FriendingActionsModule (upval), UseDispatchResult (upval), UseLocalizationResult (upval)
				if UseRefResult.current[TargetUserId] then return end
				UseRefResult.current[TargetUserId] = true
				
				if FFlagUserListCtaAnalyticsEnabled and OnCtaActivated ~= nil then
					OnCtaActivated({ buttonType = ButtonTypes.Dismiss, userId = TargetUserId })
				end
				if FFlagUserListCanonicalCtaAnalyticsModule then
					ReportCtaActivatedModule(Analytics, ButtonTypes.Dismiss, TargetUserId, p2)
				end
				FriendingActionsModule.executeDeclineFriendRequest({
					dispatch = UseDispatchResult,
					targetUserId = TargetUserId,
					localized = UseLocalizationResult
				}):finally(function()
					-- upvalues: UseRefResult (upval), TargetUserId (copy)
					UseRefResult.current[TargetUserId] = nil
				end)
			end
		}
	end, {
		UseDispatchResult, UseLocalizationResult, FriendshipOriginSourceType,
		OnCtaActivated, ChatEntryPoint, Analytics
	})
end