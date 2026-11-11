local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local DashModule = require(Parent.Dash)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local _ = require(UserSearch.Common.LocalTypes)
local UseRelationshipSelectorModule = require(script.Parent.useRelationshipSelector)
local EventNamesModule = require(UserSearch.Analytics.EventNames)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FriendsNetworkingModule = require(UserSearch.Networking.FriendsNetworking)
local Enums = require(Parent.FriendsNetworking).Enums
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local PresenceHelpersModule = require(UserSearch.Utils.PresenceHelpers)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local FriendRequestNicknamesIXP = require(Parent.FriendRequestNicknames).FriendRequestNicknamesIXP
local FFlagUserSearchAddFocusActionsSupport = require(Parent.SharedFlags).FFlagUserSearchAddFocusActionsSupport
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename

return function(p1, Callback)
	-- upvalues: UseLocalUserIdFunction (copy), UseDispatchFunction (copy), UseRelationshipSelectorModule (copy), FriendRequestNicknamesIXP (copy), UseStyleFunction (copy), UseJoinUserInExperienceFunction (copy), Contexts (copy), Images (copy), PresenceHelpersModule (copy), FFlagUserSearchAddFocusActionsSupport (copy), FocusNavigationEventNameEnum (copy), FriendsNetworkingModule (copy), SetCurrentToastMessageFunction (copy), FFlagConnectionsToFriendsRename (copy), EventNamesModule (copy), DashModule (copy), AppPage (copy), Enums (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRelationshipSelectorModuleResult = UseRelationshipSelectorModule(p1.userId)
	local UseFriendRequestNicknamesResult = FriendRequestNicknamesIXP.useFriendRequestNicknames()
	local UseStyleResult = UseStyleFunction()
	local UseJoinUserInExperienceResult = UseJoinUserInExperienceFunction(p1.userId, {
		analyticProps = { context = Contexts.PlayerSearch, subpage = p1.subpage }
	})
	local IconsCommonPlusSmall = if p1.shouldUseCompactTiles then Images["icons/common/plus_small"] else Images["icons/actions/friends/friendAdd"]
	local IconsCommonPlusSmall1 = if p1.shouldUseCompactTiles then Images["icons/common/plus_small"] else Images["icons/actions/friends/friendpending"]
	local IconsCommonPlay = Images["icons/common/play"]
	
	return if UseRelationshipSelectorModuleResult.status == Enum.FriendStatus.Friend and p1.shouldUseCompactTiles and PresenceHelpersModule.isUserInGame(p1.userPresence) then {
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
				-- upvalues: UseDispatchResult (copy), FriendsNetworkingModule (upval), p1 (copy), UseLocalUserIdResult (copy), SetCurrentToastMessageFunction (upval), FFlagConnectionsToFriendsRename (upval), Callback (copy), EventNamesModule (upval)
				UseDispatchResult(FriendsNetworkingModule.AcceptFriendRequestFromUserId.API({
					targetUserId = p1.userId,
					currentUserId = UseLocalUserIdResult
				})):andThen(function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), FFlagConnectionsToFriendsRename (upval)
					UseDispatchResult(SetCurrentToastMessageFunction({
						toastMessage = if FFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendAdded" else "Feature.Friends.Action.ConnectionAdded"
					}))
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
			focusEventName = if FFlagUserSearchAddFocusActionsSupport and p1.shouldAddFocusEventName then FocusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil,
			onActivated = function()
				-- upvalues: FriendRequestNicknamesIXP (upval), UseFriendRequestNicknamesResult (copy), Callback (copy), EventNamesModule (upval), AppPage (upval), p1 (copy), Enums (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), FriendsNetworkingModule (upval), UseLocalUserIdResult (copy), SetCurrentToastMessageFunction (upval), FFlagConnectionsToFriendsRename (upval)
				if FriendRequestNicknamesIXP.FFlagFriendRequestNicknames and UseFriendRequestNicknamesResult then
					if Callback then
						Callback(EventNamesModule.PlayerFriendRequest)
					end
					local config = {
						name = AppPage.SetNicknameModal,
						extraProps = {
							friendRequestParams = {
								targetUserId = p1.userId,
								source = Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()
							}
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config))
						
						return
					end
				else
					UseDispatchResult(FriendsNetworkingModule.RequestFriendshipFromUserId.API({
						targetUserId = p1.userId,
						currentUserId = UseLocalUserIdResult,
						friendshipOriginSourceType = Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()
					})):andThen(function()
						-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), FFlagConnectionsToFriendsRename (upval)
						UseDispatchResult(SetCurrentToastMessageFunction({
							toastMessage = if FFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendRequestSent" else "Feature.Friends.Action.ConnectionRequestSent"
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
			end
		}
	}
end