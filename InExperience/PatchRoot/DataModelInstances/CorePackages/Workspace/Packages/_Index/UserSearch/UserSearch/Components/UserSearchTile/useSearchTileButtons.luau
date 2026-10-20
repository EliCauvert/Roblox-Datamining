local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local DashModule = require(Parent.Dash)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local _ = require(UserSearch.Common.LocalTypes)
local UseRelationshipSelectorModule = require(script.Parent.useRelationshipSelector)
local EventNamesModule = require(UserSearch.Analytics.EventNames)
local FriendsNetworkingModule = require(UserSearch.Networking.FriendsNetworking)
local Enums = require(Parent.FriendsNetworking).Enums
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local PresenceHelpersModule = require(UserSearch.Utils.PresenceHelpers)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local FFlagUserSearchAddFocusActionsSupport = require(Parent.SharedFlags).FFlagUserSearchAddFocusActionsSupport
local FFlagSduiUserSearchTile = require(Parent.SharedFlags).FFlagSduiUserSearchTile
local FFlagFixUserSearchAddFriendFocusActionModule = require(UserSearch.Flags.FFlagFixUserSearchAddFriendFocusAction)
local FFlagUserSearchHideFriendActionsForBlockedUsersModule = require(UserSearch.Flags.FFlagUserSearchHideFriendActionsForBlockedUsers)
local UseIsUserBlockedModule = if FFlagUserSearchHideFriendActionsForBlockedUsersModule then require(script.Parent.useIsUserBlocked) else nil
local FriendsStoreChallengeNetworkModule = require(UserSearch.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()
local Enums1 = require(Parent.DataHydration).Friends.Enums
local FFlagMigrateFriendshipStatusesUserSearchModule = require(UserSearch.Flags.FFlagMigrateFriendshipStatusesUserSearch) or FFlagSduiUserSearchTile

return function(p1, Callback)
	-- upvalues: UseLocalUserIdFunction (copy), UseDispatchFunction (copy), UseRelationshipSelectorModule (copy), UseStyleFunction (copy), FFlagUserSearchHideFriendActionsForBlockedUsersModule (copy), UseIsUserBlockedModule (copy), UseJoinUserInExperienceFunction (copy), Contexts (copy), Images (copy), PresenceHelpersModule (copy), FFlagUserSearchAddFocusActionsSupport (copy), FocusNavigationEventNameEnum (copy), FFlagMigrateFriendshipStatusesUserSearchModule (copy), GetResult (copy), FriendsNetworkingModule (copy), SetCurrentToastMessageFunction (copy), EventNamesModule (copy), DashModule (copy), FFlagFixUserSearchAddFriendFocusActionModule (copy), Enums1 (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), Enums (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRelationshipSelectorModuleResult = UseRelationshipSelectorModule(p1.userId)
	local UseStyleResult = UseStyleFunction()
	local UseIsUserBlockedModuleResult = if FFlagUserSearchHideFriendActionsForBlockedUsersModule then UseIsUserBlockedModule(p1.userId) else false
	local UseJoinUserInExperienceResult = UseJoinUserInExperienceFunction(p1.userId, {
		analyticProps = { context = Contexts.PlayerSearch, subpage = p1.subpage }
	})
	local IconsCommonPlusSmall = if p1.shouldUseCompactTiles then Images["icons/common/plus_small"] else Images["icons/actions/friends/friendAdd"]
	local IconsCommonPlusSmall1 = if p1.shouldUseCompactTiles then Images["icons/common/plus_small"] else Images["icons/actions/friends/friendpending"]
	local IconsCommonPlay = Images["icons/common/play"]
	
	return if FFlagUserSearchHideFriendActionsForBlockedUsersModule and UseIsUserBlockedModuleResult then nil elseif UseRelationshipSelectorModuleResult.status == Enum.FriendStatus.Friend and p1.shouldUseCompactTiles and PresenceHelpersModule.isUserInGame(p1.userPresence) then {
		{
			isSecondary = false,
			icon = IconsCommonPlay,
			isDisabled = UseJoinUserInExperienceResult.isLoading,
			onActivated = function()
				-- upvalues: UseJoinUserInExperienceResult (copy)
				UseJoinUserInExperienceResult.joinExperience()
			end,
			imageColor = UseStyleResult.Theme.ContextualPrimaryContent.Color,
			backgroundColor = UseStyleResult.Theme.OnlineStatus.Color,
			focusEventName = if FFlagUserSearchAddFocusActionsSupport and p1.shouldAddFocusEventName then FocusNavigationEventNameEnum.HoldToPlay else nil
		}
	} elseif UseRelationshipSelectorModuleResult.isMyself or UseRelationshipSelectorModuleResult.status == Enum.FriendStatus.Friend then nil elseif UseRelationshipSelectorModuleResult.status == Enum.FriendStatus.FriendRequestReceived then {
		{
			isSecondary = false,
			isDisabled = false,
			icon = IconsCommonPlusSmall,
			focusEventName = if FFlagUserSearchAddFocusActionsSupport and p1.shouldAddFocusEventName then FocusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil,
			onActivated = function()
				-- upvalues: FFlagMigrateFriendshipStatusesUserSearchModule (upval), GetResult (upval), p1 (copy), UseDispatchResult (copy), FriendsNetworkingModule (upval), UseLocalUserIdResult (copy), SetCurrentToastMessageFunction (upval), Callback (copy), EventNamesModule (upval)
				(if FFlagMigrateFriendshipStatusesUserSearchModule then GetResult.AcceptFriendRequest(p1.userId) else UseDispatchResult(FriendsNetworkingModule.AcceptFriendRequestFromUserId.API({
					targetUserId = p1.userId,
					currentUserId = UseLocalUserIdResult
				}))):andThen(function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
					UseDispatchResult(SetCurrentToastMessageFunction({ toastMessage = "Feature.Friends.Action.FriendAdded" }))
				end):catch(function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
					UseDispatchResult(SetCurrentToastMessageFunction({
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
					}))
				end)
				
				if Callback then
					Callback(EventNamesModule.PlayerFriendAccept)
				end
			end
		}
	} elseif UseRelationshipSelectorModuleResult.status == Enum.FriendStatus.FriendRequestSent then {
		{
			isSecondary = false,
			isDisabled = true,
			icon = IconsCommonPlusSmall1,
			onActivated = DashModule.noop()
		}
	} elseif UseRelationshipSelectorModuleResult.status and UseRelationshipSelectorModuleResult.status ~= Enum.FriendStatus.NotFriend then nil else {
		{
			isSecondary = false,
			isDisabled = false,
			icon = IconsCommonPlusSmall,
			focusEventName = if FFlagUserSearchAddFocusActionsSupport and p1.shouldAddFocusEventName then if FFlagFixUserSearchAddFriendFocusActionModule then FocusNavigationEventNameEnum.HoldToAddFriend else FocusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil,
			onActivated = function()
				-- upvalues: FFlagMigrateFriendshipStatusesUserSearchModule (upval), GetResult (upval), p1 (copy), Enums1 (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), UseDispatchResult (copy), FriendsNetworkingModule (upval), UseLocalUserIdResult (copy), Enums (upval), SetCurrentToastMessageFunction (upval), Callback (copy), EventNamesModule (upval)
				(if FFlagMigrateFriendshipStatusesUserSearchModule then GetResult.RequestFriendship(p1.userId, Enums1.FriendshipOriginSourceType.PlayerSearch, nil, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil) else UseDispatchResult(FriendsNetworkingModule.RequestFriendshipFromUserId.API({
					targetUserId = p1.userId,
					currentUserId = UseLocalUserIdResult,
					friendshipOriginSourceType = Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()
				}))):andThen(function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
					UseDispatchResult(SetCurrentToastMessageFunction({
						toastMessage = "Feature.Friends.Action.FriendRequestSent"
					}))
				end):catch(function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
					UseDispatchResult(SetCurrentToastMessageFunction({
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
					}))
				end)
				
				if Callback then
					Callback(EventNamesModule.PlayerFriendRequest)
				end
			end
		}
	}
end