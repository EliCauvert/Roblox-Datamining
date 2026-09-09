local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local textKeysModule = require(parent.Common.TextKeys)
local friendshipOriginSourceType = dependenciesModule.NetworkingFriendsEnums.FriendshipOriginSourceType
local socialCommonModule = require(parent_1.SocialCommon)
local images = dependenciesModule.UIBlox.App.ImageSet.Images
local react = dependenciesModule.React
local useDispatch = dependenciesModule.Hooks.useDispatch
local useSelector = dependenciesModule.Hooks.useSelector
local networkingFriends = dependenciesModule.NetworkingFriends
local networkStatus = dependenciesModule.RoduxNetworking.Enum.NetworkStatus
local roduxFriends = dependenciesModule.RoduxFriends
local _ = roduxFriends.Enums.RecommendationContextType
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local eventNames = require(parent.Analytics).EventNames
local contextualInfoTypes = socialCommonModule.Enums.ContextualInfoTypes
local _ = require(parent.Common.DirectRecommendationTypes)
local getFFlagPYMKDisableButtonsOnFetchModule = require(parent.Flags.getFFlagPYMKDisableButtonsOnFetch)
local fFlagMigrateFriendshipStatusesPYMKModule = require(parent.Flags.FFlagMigrateFriendshipStatusesPYMK)
local fFlagLuaAppEnableSduiHomePage = require(parent_1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local useGetFriendshipStatus = require(parent_1.FriendsHydrationReact).useGetFriendshipStatus
local var1 = require(parent_1.DataHydration).Friends.FriendsStore.get()
local focusNavigationEventNameEnum = require(parent_1.FocusNavigationUtils).FocusNavigationEventNameEnum
local _ = require(parent_1.UserList)
local t = { skipFetch = true }
local t_1 = { isContact = true }

local _ = function(p1, p2, p3)
	-- upvalues: networkStatus (ref)
	return p2.getStatus(p1, p3) == networkStatus.Fetching
end

return function(p1)
	-- upvalues: useDispatch (ref), useSelector (ref), fFlagMigrateFriendshipStatusesPYMKModule (ref), useGetFriendshipStatus (ref), t (ref), roduxFriends (ref), fFlagLuaAppEnableSduiHomePage (ref), getDeepValue (ref), getFFlagPYMKDisableButtonsOnFetchModule (ref), networkingFriends (ref), networkStatus (ref), react (ref), images (ref), eventNames (ref), var1 (ref), textKeysModule (ref), focusNavigationEventNameEnum (ref), httpService (ref), contextualInfoTypes (ref), friendshipOriginSourceType (ref), t_1 (ref)
	local var2, var3
	local var4 = tostring(p1.userId)
	local var5 = useDispatch()
	local var6 = useSelector(function(p2)
		return tostring(p2.LocalUserId)
	end)
	local var7 = if fFlagMigrateFriendshipStatusesPYMKModule then useGetFriendshipStatus(var4, t) else useSelector(function(p2)
		-- upvalues: roduxFriends (copy), var4 (ref)
		return roduxFriends.Selectors.selectFriendshipStatusesByUserIds(p2)({ var4 })[var4] or nil
	end)
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppEnableSduiHomePage then
		var2 = p1.recommendation or {}
		var3 = p1.recommendation and p1.recommendation.hasIncomingFriendRequest == true
	else
		var2 = useSelector(function(p2)
			-- upvalues: roduxFriends (copy), var6 (ref), var4 (ref)
			return roduxFriends.Selectors.selectRecommendationsForUserId(p2)(var6)[var4] or {}
		end)
		var3 = useSelector(function(p2)
			-- upvalues: getDeepValue (copy), var4 (ref)
			return getDeepValue(p2, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", var4)) or false
		end)
	end
	local var8 = if getFFlagPYMKDisableButtonsOnFetchModule() then useSelector(function(p2)
		-- upvalues: networkingFriends (copy), var4 (ref), networkStatus (copy)
		return {
			RequestFriendshipFromUserId = networkingFriends.RequestFriendshipFromUserId.getStatus(p2, var4) == networkStatus.Fetching,
			AcceptFriendRequestFromUserId = networkingFriends.AcceptFriendRequestFromUserId.getStatus(p2, var4) == networkStatus.Fetching
		}
	end) else nil
	local var9 = react.useMemo(function()
		-- upvalues: var7 (write), images (copy), var3 (write), fFlagMigrateFriendshipStatusesPYMKModule (copy), getFFlagPYMKDisableButtonsOnFetchModule (copy), var8 (ref), p1 (ref), eventNames (copy), var2 (write), var4 (ref), var1 (copy), var5 (ref), networkingFriends (copy), var6 (ref), textKeysModule (copy), focusNavigationEventNameEnum (copy), httpService (copy), contextualInfoTypes (copy), friendshipOriginSourceType (copy), t_1 (copy)
		return if var7 == Enum.FriendStatus.FriendRequestSent then {
			{
				isSecondary = true,
				isDisabled = true,
				isLoading = false,
				buttonType = "Pending",
				focusEvent = nil,
				icon = images["icons/actions/friends/friendpending"],
				onActivated = function() end
			}
		} elseif var3 or fFlagMigrateFriendshipStatusesPYMKModule and var7 == Enum.FriendStatus.FriendRequestReceived then {
			{
				isSecondary = false,
				buttonType = "Accept",
				icon = images["icons/actions/friends/friendAdd"],
				isDisabled = if getFFlagPYMKDisableButtonsOnFetchModule() then if var8 then var8.AcceptFriendRequestFromUserId else false else false,
				onActivated = function()
					-- upvalues: p1 (copy), eventNames (copy), var2 (copy), var4 (copy), fFlagMigrateFriendshipStatusesPYMKModule (copy), var1 (copy), var5 (copy), networkingFriends (copy), var6 (copy), textKeysModule (copy)
					p1.fireAnalyticsEvent(eventNames.AcceptFriendship, {
						recommendationContextType = var2.contextType,
						requestedId = var4,
						recommendationRank = var2.rank,
						absolutePosition = p1.absolutePosition,
						presence = p1.userPresenceType
					});
					(if fFlagMigrateFriendshipStatusesPYMKModule then var1.AcceptFriendRequest(var4) else var5(networkingFriends.AcceptFriendRequestFromUserId.API({ currentUserId = var6, targetUserId = var4 }))):andThen(function()
						-- upvalues: p1 (copy), textKeysModule (copy)
						p1.showToast(textKeysModule.ConnectionAddedToast)
					end):catch(function()
						-- upvalues: p1 (copy), textKeysModule (copy)
						p1.showToast(textKeysModule.SomethingIsWrongToast)
					end)
				end,
				isLoading = if var8 then var8.AcceptFriendRequestFromUserId else false,
				focusEvent = focusNavigationEventNameEnum.HoldToAcceptFriendRequest
			}
		} elseif var7 and var7 ~= Enum.FriendStatus.NotFriend then {} else {
			{
				isSecondary = false,
				buttonType = "Add",
				icon = images["icons/actions/friends/friendAdd"],
				isDisabled = if getFFlagPYMKDisableButtonsOnFetchModule() then if var8 then var8.RequestFriendshipFromUserId else false else false,
				onActivated = function()
					-- upvalues: p1 (copy), eventNames (copy), var2 (copy), var4 (copy), httpService (copy), fFlagMigrateFriendshipStatusesPYMKModule (copy), networkingFriends (copy), var6 (copy), contextualInfoTypes (copy), friendshipOriginSourceType (copy), var5 (copy), var1 (copy), t_1 (copy), textKeysModule (copy)
					p1.fireAnalyticsEvent(eventNames.RequestFriendship, {
						recommendationContextType = var2.contextType,
						requestedId = var4,
						contactId = p1.contactId,
						recommendationRank = var2.rank,
						absolutePosition = p1.absolutePosition,
						positionInRow = p1.absolutePosition,
						presence = p1.userPresenceType,
						interactionUuid = httpService:GenerateGUID(false)
					});
					(if not fFlagMigrateFriendshipStatusesPYMKModule then var5(if fFlagMigrateFriendshipStatusesPYMKModule then nil elseif p1.contactId then networkingFriends.RequestFriendshipFromContactId.API({
						currentUserId = var6,
						targetUserId = var4,
						contactId = p1.contactId,
						contextType = contextualInfoTypes.Contacts,
						friendshipOriginSourceType = friendshipOriginSourceType.FriendRecommendations.rawValue()
					}) else networkingFriends.RequestFriendshipFromUserId.API({
						currentUserId = var6,
						targetUserId = var4,
						friendshipOriginSourceType = friendshipOriginSourceType.FriendRecommendations.rawValue()
					})) elseif p1.contactId then var1.RequestFriendship(p1.contactId, friendshipOriginSourceType.FriendRecommendations.rawValue(), t_1) else var1.RequestFriendship(var4, friendshipOriginSourceType.FriendRecommendations.rawValue())):andThen(function()
						-- upvalues: p1 (copy), textKeysModule (copy)
						p1.showToast(textKeysModule.ConnectionRequestSentToast)
					end):catch(function()
						-- upvalues: p1 (copy), textKeysModule (copy)
						p1.showToast(textKeysModule.SomethingIsWrongToast)
					end)
				end,
				isLoading = if var8 then var8.RequestFriendshipFromUserId else false,
				focusEvent = focusNavigationEventNameEnum.HoldToAddFriend
			}
		}
	end, {
		var7, var4, var3, var2, var6, var5, p1.userPresenceType
	})
	
	return react.useCallback(function()
		-- upvalues: var9 (ref)
		return var9
	end, { var9 })
end