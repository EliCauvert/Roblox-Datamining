local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local dashModule = require(parent.Dash)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local _ = require(userSearch.Common.LocalTypes)
local useRelationshipSelectorModule = require(script.Parent.useRelationshipSelector)
local eventNamesModule = require(userSearch.Analytics.EventNames)
local roactUtilsModule = require(parent.RoactUtils)
local friendsNetworkingModule = require(userSearch.Networking.FriendsNetworking)
local enums = require(parent.FriendsNetworking).Enums
local useJoinUserInExperience = require(parent.SocialExperienceJoin).useJoinUserInExperience
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local presenceHelpersModule = require(userSearch.Utils.PresenceHelpers)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local fFlagUserSearchAddFocusActionsSupport = require(parent.SharedFlags).FFlagUserSearchAddFocusActionsSupport
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagSduiUserSearchTile = require(parent.SharedFlags).FFlagSduiUserSearchTile
local fFlagFixUserSearchAddFriendFocusActionModule = require(userSearch.Flags.FFlagFixUserSearchAddFriendFocusAction)
local fFlagUserSearchHideFriendActionsForBlockedUsersModule = require(userSearch.Flags.FFlagUserSearchHideFriendActionsForBlockedUsers)
local fFlagMigrateFriendshipStatusesUserSearchModule = require(userSearch.Flags.FFlagMigrateFriendshipStatusesUserSearch)
local var1 = if fFlagUserSearchHideFriendActionsForBlockedUsersModule then require(script.Parent.useIsUserBlocked) else nil
local var2 = require(parent.DataHydration).Friends.FriendsStore.get()
local enums_1 = require(parent.DataHydration).Friends.Enums
local fFlagMigrateFriendshipStatusesUserSearchModule_1 = fFlagMigrateFriendshipStatusesUserSearchModule or fFlagSduiUserSearchTile

return function(p1, p2)
	-- upvalues: useLocalUserId (ref), useDispatch (ref), useRelationshipSelectorModule (ref), useStyle (ref), fFlagUserSearchHideFriendActionsForBlockedUsersModule (ref), var1 (ref), useJoinUserInExperience (ref), contexts (ref), images (ref), presenceHelpersModule (ref), fFlagUserSearchAddFocusActionsSupport (ref), focusNavigationEventNameEnum (ref), fFlagMigrateFriendshipStatusesUserSearchModule_1 (ref), var2 (ref), friendsNetworkingModule (ref), setCurrentToastMessage (ref), fFlagConnectionsToFriendsRename (ref), eventNamesModule (ref), dashModule (ref), fFlagFixUserSearchAddFriendFocusActionModule (ref), enums_1 (ref), enums (ref)
	local var3 = useLocalUserId()
	local var4 = useDispatch()
	local var5 = useRelationshipSelectorModule(p1.userId)
	local var6 = useStyle()
	local var7 = if fFlagUserSearchHideFriendActionsForBlockedUsersModule then var1(p1.userId) else false
	local var8 = useJoinUserInExperience(p1.userId, {
		analyticProps = { context = contexts.PlayerSearch, subpage = p1.subpage }
	})
	local var9 = if p1.shouldUseCompactTiles then images["icons/common/plus_small"] else images["icons/actions/friends/friendAdd"]
	
	return if fFlagUserSearchHideFriendActionsForBlockedUsersModule and var7 then nil elseif var5.status == Enum.FriendStatus.Friend and p1.shouldUseCompactTiles and presenceHelpersModule.isUserInGame(p1.userPresence) then {
		{
			isSecondary = false,
			icon = images["icons/common/play"],
			isDisabled = var8.isLoading,
			onActivated = function()
				-- upvalues: var8 (ref)
				var8.joinExperience()
			end,
			imageColor = var6.Theme.ContextualPrimaryContent.Color,
			backgroundColor = var6.Theme.OnlineStatus.Color,
			focusEventName = if fFlagUserSearchAddFocusActionsSupport and p1.shouldAddFocusEventName then focusNavigationEventNameEnum.HoldToPlay else nil
		}
	} elseif var5.isMyself or var5.status == Enum.FriendStatus.Friend then nil elseif var5.status == Enum.FriendStatus.FriendRequestReceived then {
		{
			isSecondary = false,
			isDisabled = false,
			icon = var9,
			focusEventName = if fFlagUserSearchAddFocusActionsSupport and p1.shouldAddFocusEventName then focusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil,
			onActivated = function()
				-- upvalues: fFlagMigrateFriendshipStatusesUserSearchModule_1 (copy), var2 (copy), p1 (ref), var4 (ref), friendsNetworkingModule (copy), var3 (ref), setCurrentToastMessage (copy), fFlagConnectionsToFriendsRename (copy), p2 (ref), eventNamesModule (copy)
				;(if fFlagMigrateFriendshipStatusesUserSearchModule_1 then var2.AcceptFriendRequest(p1.userId) else var4(friendsNetworkingModule.AcceptFriendRequestFromUserId.API({ targetUserId = p1.userId, currentUserId = var3 }))):andThen(function()
					-- upvalues: var4 (copy), setCurrentToastMessage (copy), fFlagConnectionsToFriendsRename (copy)
					var4(setCurrentToastMessage({
						toastMessage = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendAdded" else "Feature.Friends.Action.ConnectionAdded"
					}))
				end):catch(function()
					-- upvalues: var4 (copy), setCurrentToastMessage (copy)
					var4(setCurrentToastMessage({
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
					}))
				end)
				
				if p2 then
					p2(eventNamesModule.PlayerFriendAccept)
				end
			end
		}
	} elseif var5.status == Enum.FriendStatus.FriendRequestSent then {
		{
			isSecondary = false,
			isDisabled = true,
			icon = if p1.shouldUseCompactTiles then images["icons/common/plus_small"] else images["icons/actions/friends/friendpending"],
			onActivated = dashModule.noop()
		}
	} elseif var5.status and var5.status ~= Enum.FriendStatus.NotFriend then nil else {
		{
			isSecondary = false,
			isDisabled = false,
			icon = var9,
			focusEventName = if fFlagUserSearchAddFocusActionsSupport and p1.shouldAddFocusEventName then if fFlagFixUserSearchAddFriendFocusActionModule then focusNavigationEventNameEnum.HoldToAddFriend else focusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil,
			onActivated = function()
				-- upvalues: fFlagMigrateFriendshipStatusesUserSearchModule_1 (copy), var2 (copy), p1 (ref), enums_1 (copy), var4 (ref), friendsNetworkingModule (copy), var3 (ref), enums (copy), setCurrentToastMessage (copy), fFlagConnectionsToFriendsRename (copy), p2 (ref), eventNamesModule (copy)
				;(if fFlagMigrateFriendshipStatusesUserSearchModule_1 then var2.RequestFriendship(p1.userId, enums_1.FriendshipOriginSourceType.PlayerSearch) else var4(friendsNetworkingModule.RequestFriendshipFromUserId.API({
					targetUserId = p1.userId,
					currentUserId = var3,
					friendshipOriginSourceType = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()
				}))):andThen(function()
					-- upvalues: var4 (copy), setCurrentToastMessage (copy), fFlagConnectionsToFriendsRename (copy)
					var4(setCurrentToastMessage({
						toastMessage = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendRequestSent" else "Feature.Friends.Action.ConnectionRequestSent"
					}))
				end):catch(function()
					-- upvalues: var4 (copy), setCurrentToastMessage (copy)
					var4(setCurrentToastMessage({
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
					}))
				end)
				
				if p2 then
					p2(eventNamesModule.PlayerFriendRequest)
				end
			end
		}
	}
end