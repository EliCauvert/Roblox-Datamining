local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local TextKeysModule = require(Parent.Common.TextKeys)
local FriendshipOriginSourceType = DependenciesModule.NetworkingFriendsEnums.FriendshipOriginSourceType
local Images = DependenciesModule.UIBlox.App.ImageSet.Images
local React = DependenciesModule.React
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local NetworkingFriends = DependenciesModule.NetworkingFriends
local NetworkStatus = DependenciesModule.RoduxNetworking.Enum.NetworkStatus
local RoduxFriends = DependenciesModule.RoduxFriends
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local EventNames = require(Parent.Analytics).EventNames
local ContextualInfoTypes = require(Parent1.SocialCommon).Enums.ContextualInfoTypes
local GetFFlagPYMKDisableButtonsOnFetchModule = require(Parent.Flags.getFFlagPYMKDisableButtonsOnFetch)
local FriendRequestNicknamesIXP = require(Parent1.FriendRequestNicknames).FriendRequestNicknamesIXP
local AppPage = require(Parent1.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent1.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent1.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local FocusNavigationEventNameEnum = require(Parent1.FocusNavigationUtils).FocusNavigationEventNameEnum
local _ = require(Parent1.UserList)
local FFlagHomepagePYMKPresenceAnalytics = require(Parent1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics
local FFlagHomepagePYMKUseHorizontalUserList = require(Parent1.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList

local function _(p1, p2, p3): boolean
	-- upvalues: NetworkStatus (copy)
	return p2.getStatus(p1, p3) == NetworkStatus.Fetching
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), RoduxFriends (copy), GetDeepValueFunction (copy), FriendRequestNicknamesIXP (copy), GetFFlagPYMKDisableButtonsOnFetchModule (copy), NetworkingFriends (copy), NetworkStatus (copy), React (copy), Images (copy), FFlagHomepagePYMKUseHorizontalUserList (copy), EventNames (copy), FFlagHomepagePYMKPresenceAnalytics (copy), TextKeysModule (copy), FocusNavigationEventNameEnum (copy), HttpService (copy), ContextualInfoTypes (copy), FriendshipOriginSourceType (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local Text = tostring(p1.userId)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2): string
		return (tostring(p2.LocalUserId))
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: RoduxFriends (upval), Text (copy)
		return RoduxFriends.Selectors.selectFriendshipStatusesByUserIds(p2)({ Text })[Text] or nil
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: RoduxFriends (upval), UseSelectorResult (copy), Text (copy)
		return RoduxFriends.Selectors.selectRecommendationsForUserId(p2)(UseSelectorResult)[Text] or {}
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), Text (copy)
		return GetDeepValueFunction(p2, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", Text)) or false
	end)
	local UseFriendRequestNicknamesResult = FriendRequestNicknamesIXP.useFriendRequestNicknames()
	local UseSelectorResult4 = if GetFFlagPYMKDisableButtonsOnFetchModule() then UseSelectorFunction(function(p2)
		-- upvalues: NetworkingFriends (upval), Text (copy), NetworkStatus (upval)
		return {
			RequestFriendshipFromUserId = NetworkingFriends.RequestFriendshipFromUserId.getStatus(p2, Text) == NetworkStatus.Fetching,
			AcceptFriendRequestFromUserId = NetworkingFriends.AcceptFriendRequestFromUserId.getStatus(p2, Text) == NetworkStatus.Fetching
		}
	end) else nil
	local UseMemoResult = React.useMemo(function()
		-- upvalues: UseSelectorResult1 (copy), Images (upval), FFlagHomepagePYMKUseHorizontalUserList (upval), UseSelectorResult3 (copy), GetFFlagPYMKDisableButtonsOnFetchModule (upval), UseSelectorResult4 (copy), p1 (copy), EventNames (upval), UseSelectorResult2 (copy), Text (copy), FFlagHomepagePYMKPresenceAnalytics (upval), UseDispatchResult (copy), NetworkingFriends (upval), UseSelectorResult (copy), TextKeysModule (upval), FocusNavigationEventNameEnum (upval), HttpService (upval), ContextualInfoTypes (upval), FriendshipOriginSourceType (upval), FriendRequestNicknamesIXP (upval), UseFriendRequestNicknamesResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		return if UseSelectorResult1 == Enum.FriendStatus.FriendRequestSent then {
			{
				isSecondary = true,
				isDisabled = true,
				focusEvent = nil,
				icon = Images["icons/actions/friends/friendpending"],
				onActivated = if FFlagHomepagePYMKUseHorizontalUserList then function() end else nil,
				isLoading = not FFlagHomepagePYMKUseHorizontalUserList and nil,
				buttonType = if FFlagHomepagePYMKUseHorizontalUserList then "Pending" else nil
			}
		} elseif UseSelectorResult3 then {
			{
				isSecondary = false,
				icon = Images["icons/actions/friends/friendAdd"],
				isDisabled = if GetFFlagPYMKDisableButtonsOnFetchModule() and UseSelectorResult4 then UseSelectorResult4.AcceptFriendRequestFromUserId else false,
				onActivated = function()
					-- upvalues: p1 (upval), EventNames (upval), UseSelectorResult2 (upval), Text (upval), FFlagHomepagePYMKPresenceAnalytics (upval), UseDispatchResult (upval), NetworkingFriends (upval), UseSelectorResult (upval), TextKeysModule (upval)
					p1.fireAnalyticsEvent(EventNames.AcceptFriendship, {
						recommendationContextType = UseSelectorResult2.contextType,
						requestedId = Text,
						recommendationRank = UseSelectorResult2.rank,
						absolutePosition = p1.absolutePosition,
						presence = if FFlagHomepagePYMKPresenceAnalytics then p1.userPresenceType else nil
					})
					UseDispatchResult(NetworkingFriends.AcceptFriendRequestFromUserId.API({ currentUserId = UseSelectorResult, targetUserId = Text })):andThen(function()
						-- upvalues: p1 (upval), TextKeysModule (upval)
						p1.showToast(TextKeysModule.ConnectionAddedToast)
					end):catch(function()
						-- upvalues: p1 (upval), TextKeysModule (upval)
						p1.showToast(TextKeysModule.SomethingIsWrongToast)
					end)
				end,
				isLoading = if FFlagHomepagePYMKUseHorizontalUserList then if UseSelectorResult4 then UseSelectorResult4.AcceptFriendRequestFromUserId else false else nil,
				buttonType = if FFlagHomepagePYMKUseHorizontalUserList then "Accept" else nil,
				focusEvent = if FFlagHomepagePYMKUseHorizontalUserList then FocusNavigationEventNameEnum.HoldToAcceptFriendRequest else nil
			}
		} elseif UseSelectorResult1 and UseSelectorResult1 ~= Enum.FriendStatus.NotFriend then {} else {
			{
				isSecondary = false,
				icon = Images["icons/actions/friends/friendAdd"],
				isDisabled = if GetFFlagPYMKDisableButtonsOnFetchModule() and UseSelectorResult4 then UseSelectorResult4.RequestFriendshipFromUserId else false,
				onActivated = function()
					-- upvalues: p1 (upval), EventNames (upval), UseSelectorResult2 (upval), Text (upval), FFlagHomepagePYMKPresenceAnalytics (upval), HttpService (upval), NetworkingFriends (upval), UseSelectorResult (upval), ContextualInfoTypes (upval), FriendshipOriginSourceType (upval), FriendRequestNicknamesIXP (upval), UseFriendRequestNicknamesResult (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval), TextKeysModule (upval)
					p1.fireAnalyticsEvent(EventNames.RequestFriendship, {
						recommendationContextType = UseSelectorResult2.contextType,
						requestedId = Text,
						contactId = p1.contactId,
						recommendationRank = UseSelectorResult2.rank,
						absolutePosition = p1.absolutePosition,
						positionInRow = p1.absolutePosition,
						presence = if FFlagHomepagePYMKPresenceAnalytics then p1.userPresenceType else nil,
						interactionUuid = HttpService:GenerateGUID(false)
					})
					local APIResult = if p1.contactId then NetworkingFriends.RequestFriendshipFromContactId.API({
						currentUserId = UseSelectorResult,
						targetUserId = Text,
						contactId = p1.contactId,
						contextType = ContextualInfoTypes.Contacts,
						friendshipOriginSourceType = FriendshipOriginSourceType.FriendRecommendations.rawValue()
					}) else NetworkingFriends.RequestFriendshipFromUserId.API({
						currentUserId = UseSelectorResult,
						targetUserId = Text,
						friendshipOriginSourceType = FriendshipOriginSourceType.FriendRecommendations.rawValue()
					})
					
					if not FriendRequestNicknamesIXP.FFlagFriendRequestNicknames or not UseFriendRequestNicknamesResult or p1.contactId then
						UseDispatchResult(APIResult):andThen(function()
							-- upvalues: p1 (upval), TextKeysModule (upval)
							p1.showToast(TextKeysModule.ConnectionRequestSentToast)
						end):catch(function()
							-- upvalues: p1 (upval), TextKeysModule (upval)
							p1.showToast(TextKeysModule.SomethingIsWrongToast)
						end)
						
						return
					end
					local config = {
						name = AppPage.SetNicknameModal,
						extraProps = {
							friendRequestParams = {
								targetUserId = Text,
								source = FriendshipOriginSourceType.FriendRecommendations.rawValue()
							}
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownFunction(config))
					end
				end,
				isLoading = if FFlagHomepagePYMKUseHorizontalUserList then if UseSelectorResult4 then UseSelectorResult4.RequestFriendshipFromUserId else false else nil,
				buttonType = if FFlagHomepagePYMKUseHorizontalUserList then "Add" else nil,
				focusEvent = if FFlagHomepagePYMKUseHorizontalUserList then FocusNavigationEventNameEnum.HoldToAddFriend else nil
			}
		}
	end, {
		UseSelectorResult1, Text, UseFriendRequestNicknamesResult, UseSelectorResult3,
		UseSelectorResult2, UseSelectorResult, UseDispatchResult,
		if FFlagHomepagePYMKPresenceAnalytics then p1.userPresenceType else nil
	})
	
	return React.useCallback(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult
	end, { UseMemoResult })
end