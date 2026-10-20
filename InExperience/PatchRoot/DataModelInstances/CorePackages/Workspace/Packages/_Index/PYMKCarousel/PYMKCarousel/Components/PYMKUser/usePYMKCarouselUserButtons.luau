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
local _ = RoduxFriends.Enums.RecommendationContextType
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local EventNames = require(Parent.Analytics).EventNames
local ContextualInfoTypes = require(Parent1.SocialCommon).Enums.ContextualInfoTypes
local _ = require(Parent.Common.DirectRecommendationTypes)
local GetFFlagPYMKDisableButtonsOnFetchModule = require(Parent.Flags.getFFlagPYMKDisableButtonsOnFetch)
local FFlagMigrateFriendshipStatusesPYMKModule = require(Parent.Flags.FFlagMigrateFriendshipStatusesPYMK)
local FFlagLuaAppEnableSduiHomePage = require(Parent1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local UseGetFriendshipStatusFunction = require(Parent1.FriendsHydrationReact).useGetFriendshipStatus
local FriendsStoreChallengeNetworkModule = require(Parent.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent1.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local GetResult = require(Parent1.DataHydration).Friends.FriendsStore.get()
local FocusNavigationEventNameEnum = require(Parent1.FocusNavigationUtils).FocusNavigationEventNameEnum
local _ = require(Parent1.UserList)
local config = { skipFetch = true }
local config1 = { isContact = true }

local function _(p1, p2, p3): boolean
	-- upvalues: NetworkStatus (copy)
	return p2.getStatus(p1, p3) == NetworkStatus.Fetching
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), FFlagMigrateFriendshipStatusesPYMKModule (copy), UseGetFriendshipStatusFunction (copy), config (copy), RoduxFriends (copy), FFlagLuaAppEnableSduiHomePage (copy), GetDeepValueFunction (copy), GetFFlagPYMKDisableButtonsOnFetchModule (copy), NetworkingFriends (copy), NetworkStatus (copy), React (copy), Images (copy), EventNames (copy), GetResult (copy), TextKeysModule (copy), FocusNavigationEventNameEnum (copy), HttpService (copy), ContextualInfoTypes (copy), FriendshipOriginSourceType (copy), config1 (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy)
	local Text = tostring(p1.userId)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2): string
		return (tostring(p2.LocalUserId))
	end)
	local UseGetFriendshipStatusResult = nil
	UseGetFriendshipStatusResult = if FFlagMigrateFriendshipStatusesPYMKModule then UseGetFriendshipStatusFunction(Text, config) else UseSelectorFunction(function(p2)
		-- upvalues: RoduxFriends (upval), Text (copy)
		return RoduxFriends.Selectors.selectFriendshipStatusesByUserIds(p2)({ Text })[Text] or nil
	end)
	local Recommendation = nil
	local IsHasIncomingFriendRequest = nil
	
	if FFlagLuaAppEnableSduiHomePage then
		Recommendation = p1.recommendation or {}
		IsHasIncomingFriendRequest = p1.recommendation and p1.recommendation.hasIncomingFriendRequest == true
	else
		Recommendation = UseSelectorFunction(function(p2)
			-- upvalues: RoduxFriends (upval), UseSelectorResult (copy), Text (copy)
			return RoduxFriends.Selectors.selectRecommendationsForUserId(p2)(UseSelectorResult)[Text] or {}
		end)
		IsHasIncomingFriendRequest = UseSelectorFunction(function(p2)
			-- upvalues: GetDeepValueFunction (upval), Text (copy)
			return GetDeepValueFunction(p2, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", Text)) or false
		end)
	end
	local UseSelectorResult1 = if GetFFlagPYMKDisableButtonsOnFetchModule() then UseSelectorFunction(function(p2)
		-- upvalues: NetworkingFriends (upval), Text (copy), NetworkStatus (upval)
		return {
			RequestFriendshipFromUserId = NetworkingFriends.RequestFriendshipFromUserId.getStatus(p2, Text) == NetworkStatus.Fetching,
			AcceptFriendRequestFromUserId = NetworkingFriends.AcceptFriendRequestFromUserId.getStatus(p2, Text) == NetworkStatus.Fetching
		}
	end) else nil
	local UseMemoResult = React.useMemo(function()
		-- upvalues: UseGetFriendshipStatusResult (ref), Images (upval), IsHasIncomingFriendRequest (ref), FFlagMigrateFriendshipStatusesPYMKModule (upval), GetFFlagPYMKDisableButtonsOnFetchModule (upval), UseSelectorResult1 (copy), p1 (copy), EventNames (upval), Recommendation (ref), Text (copy), GetResult (upval), UseDispatchResult (copy), NetworkingFriends (upval), UseSelectorResult (copy), TextKeysModule (upval), FocusNavigationEventNameEnum (upval), HttpService (upval), ContextualInfoTypes (upval), FriendshipOriginSourceType (upval), config1 (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval)
		return if UseGetFriendshipStatusResult == Enum.FriendStatus.FriendRequestSent then {
			{
				isSecondary = true,
				isDisabled = true,
				isLoading = false,
				buttonType = "Pending",
				focusEvent = nil,
				icon = Images["icons/actions/friends/friendpending"],
				onActivated = function() end
			}
		} elseif IsHasIncomingFriendRequest or FFlagMigrateFriendshipStatusesPYMKModule and UseGetFriendshipStatusResult == Enum.FriendStatus.FriendRequestReceived then {
			{
				isSecondary = false,
				buttonType = "Accept",
				icon = Images["icons/actions/friends/friendAdd"],
				isDisabled = if GetFFlagPYMKDisableButtonsOnFetchModule() and UseSelectorResult1 then UseSelectorResult1.AcceptFriendRequestFromUserId else false,
				onActivated = function()
					-- upvalues: p1 (upval), EventNames (upval), Recommendation (upval), Text (upval), FFlagMigrateFriendshipStatusesPYMKModule (upval), GetResult (upval), UseDispatchResult (upval), NetworkingFriends (upval), UseSelectorResult (upval), TextKeysModule (upval)
					p1.fireAnalyticsEvent(EventNames.AcceptFriendship, {
						recommendationContextType = Recommendation.contextType,
						requestedId = Text,
						recommendationRank = Recommendation.rank,
						absolutePosition = p1.absolutePosition,
						presence = p1.userPresenceType
					});
					(if FFlagMigrateFriendshipStatusesPYMKModule then GetResult.AcceptFriendRequest(Text) else UseDispatchResult(NetworkingFriends.AcceptFriendRequestFromUserId.API({ currentUserId = UseSelectorResult, targetUserId = Text }))):andThen(function()
						-- upvalues: p1 (upval), TextKeysModule (upval)
						p1.showToast(TextKeysModule.ConnectionAddedToast)
					end):catch(function()
						-- upvalues: p1 (upval), TextKeysModule (upval)
						p1.showToast(TextKeysModule.SomethingIsWrongToast)
					end)
				end,
				isLoading = if UseSelectorResult1 then UseSelectorResult1.AcceptFriendRequestFromUserId else false,
				focusEvent = FocusNavigationEventNameEnum.HoldToAcceptFriendRequest
			}
		} elseif UseGetFriendshipStatusResult and UseGetFriendshipStatusResult ~= Enum.FriendStatus.NotFriend then {} else {
			{
				isSecondary = false,
				buttonType = "Add",
				icon = Images["icons/actions/friends/friendAdd"],
				isDisabled = if GetFFlagPYMKDisableButtonsOnFetchModule() and UseSelectorResult1 then UseSelectorResult1.RequestFriendshipFromUserId else false,
				onActivated = function()
					-- upvalues: p1 (upval), EventNames (upval), Recommendation (upval), Text (upval), HttpService (upval), FFlagMigrateFriendshipStatusesPYMKModule (upval), NetworkingFriends (upval), UseSelectorResult (upval), ContextualInfoTypes (upval), FriendshipOriginSourceType (upval), UseDispatchResult (upval), GetResult (upval), config1 (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), TextKeysModule (upval)
					p1.fireAnalyticsEvent(EventNames.RequestFriendship, {
						recommendationContextType = Recommendation.contextType,
						requestedId = Text,
						contactId = p1.contactId,
						recommendationRank = Recommendation.rank,
						absolutePosition = p1.absolutePosition,
						positionInRow = p1.absolutePosition,
						presence = p1.userPresenceType,
						interactionUuid = HttpService:GenerateGUID(false)
					})
					local APIResult = if FFlagMigrateFriendshipStatusesPYMKModule then nil elseif p1.contactId then NetworkingFriends.RequestFriendshipFromContactId.API({
						currentUserId = UseSelectorResult,
						targetUserId = Text,
						contactId = p1.contactId,
						contextType = ContextualInfoTypes.Contacts,
						friendshipOriginSourceType = FriendshipOriginSourceType.FriendRecommendations.rawValue()
					}) else NetworkingFriends.RequestFriendshipFromUserId.API({
						currentUserId = UseSelectorResult,
						targetUserId = Text,
						friendshipOriginSourceType = FriendshipOriginSourceType.FriendRecommendations.rawValue()
					});
					(if FFlagMigrateFriendshipStatusesPYMKModule then if p1.contactId then GetResult.RequestFriendship(p1.contactId, FriendshipOriginSourceType.FriendRecommendations.rawValue(), config1, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil) else GetResult.RequestFriendship(Text, FriendshipOriginSourceType.FriendRecommendations.rawValue(), nil, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil) else UseDispatchResult(APIResult)):andThen(function()
						-- upvalues: p1 (upval), TextKeysModule (upval)
						p1.showToast(TextKeysModule.ConnectionRequestSentToast)
					end):catch(function()
						-- upvalues: p1 (upval), TextKeysModule (upval)
						p1.showToast(TextKeysModule.SomethingIsWrongToast)
					end)
				end,
				isLoading = if UseSelectorResult1 then UseSelectorResult1.RequestFriendshipFromUserId else false,
				focusEvent = FocusNavigationEventNameEnum.HoldToAddFriend
			}
		}
	end, {
		UseGetFriendshipStatusResult, Text, IsHasIncomingFriendRequest, Recommendation,
		UseSelectorResult, UseDispatchResult, p1.userPresenceType
	})
	
	return React.useCallback(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult
	end, { UseMemoResult })
end