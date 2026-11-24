local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local ProfileInsightsModule = require(Parent.DataHydration.ProfileInsights)
local FriendRequestsModule = require(Parent.FriendRequests)
local FriendsHydrationReactModule = require(Parent.FriendsHydrationReact)
local LocalizationModule = require(Parent.Localization)
local UserListModule = require(Parent.UserList)
local _ = require(FriendsChat.ConversationList.SuggestedUsers.SuggestedUserTypes)
local ShowSuggestedUserToastModule = require(FriendsChat.ConversationList.SuggestedUsers.showSuggestedUserToast)
local UseFriendChatCtaModule = require(FriendsChat.ConversationList.SuggestedUsers.useFriendChatCta)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local ClientCtaActions = UserListModule.Enums.ClientCtaActions
local ContextInfoTypes = UserListModule.Enums.ContextInfoTypes
local RowLayoutMode = UserListModule.Enums.RowLayoutMode
local RowSize = UserListModule.Enums.RowSize
local DataStatus = DataHydrationModule.DataStatus
local FriendshipOriginSourceType = DataHydrationModule.Friends.Enums.FriendshipOriginSourceType
local config = { skipFetch = true }
local config1 = { rankingStrategy = "tc_info_boost" }
local config2 = {
	inThisServer = "Feature.PrivateServers.Label.InThisServer",
	startChatting = "Feature.Chat.Label.StartChatting"
}
local Computed = SignalsModule.createComputed(function()
	return nil
end)
local config3 = {
	[Enum.FriendStatus.NotFriend] = ClientCtaActions.RequestFriendship,
	[Enum.FriendStatus.FriendRequestSent] = ClientCtaActions.PendingFriendRequest,
	[Enum.FriendStatus.FriendRequestReceived] = ClientCtaActions.AcceptFriendRequest
}

local function useInServerContextualInfo(UserId, p1, FriendStatus, InThisServer)
	-- upvalues: ReactModule (copy), ProfileInsightsModule (copy), config1 (copy), SignalsReactModule (copy), Computed (copy), DataStatus (copy), ContextInfoTypes (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ProfileInsightsModule (upval), UserId (copy), config1 (upval)
		return if p1 then ProfileInsightsModule.ProfileInsightsStore.get().GetProfileInsight(UserId, config1) else nil
	end, { UserId, p1 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseMemoResult then UseMemoResult.data else Computed)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseMemoResult then UseMemoResult.status else Computed)
	local CountMutualFriends: number = if UseSignalStateResult then #UseSignalStateResult.mutualFriends else 0
	local IsFriendStatusMatch = FriendStatus == Enum.FriendStatus.FriendRequestReceived
	local IsFriendStatusMatch1: boolean = FriendStatus == Enum.FriendStatus.NotFriend or FriendStatus == Enum.FriendStatus.FriendRequestSent
	local IsUseSignalStateResultMatch = UseSignalStateResult1 == DataStatus.NotReady
	local InThisServer1 = if IsFriendStatusMatch1 and CountMutualFriends == 0 and not IsUseSignalStateResultMatch then InThisServer else nil
	
	return ReactModule.useMemo(function()
		-- upvalues: CountMutualFriends (copy), ContextInfoTypes (upval), IsUseSignalStateResultMatch (copy), IsFriendStatusMatch (copy)
		return if CountMutualFriends > 0 then {
			type = ContextInfoTypes.MutualFriends,
			mutualFriendsCount = CountMutualFriends
		} elseif IsUseSignalStateResultMatch then { type = ContextInfoTypes.Loading } elseif IsFriendStatusMatch then { type = ContextInfoTypes.OffNetworkFriendRequest } else nil
	end, {
		CountMutualFriends,
		IsUseSignalStateResultMatch,
		IsFriendStatusMatch
	}), (ReactModule.useMemo(function()
		-- upvalues: InThisServer1 (copy)
		return if InThisServer1 then { text = InThisServer1 } else nil
	end, { InThisServer1 }))
end

return function(p1)
	-- upvalues: FriendsHydrationReactModule (copy), config (copy), config3 (copy), UseLocalizationFunction (copy), config2 (copy), useInServerContextualInfo (copy), ReactModule (copy), UseFriendChatCtaModule (copy), ClientCtaActions (copy), DataHydrationModule (copy), FriendRequestsModule (copy), RowLayoutMode (copy), RowSize (copy), ShowSuggestedUserToastModule (copy), FriendshipOriginSourceType (copy)
	local UserId = p1.userId
	local UseGetFriendshipStatusResult = FriendsHydrationReactModule.useGetFriendshipStatus(UserId, config)
	local IsUseGetFriendshipStatusResultMatch = UseGetFriendshipStatusResult == Enum.FriendStatus.Friend
	local Entry = if UseGetFriendshipStatusResult then config3[UseGetFriendshipStatusResult] else nil
	local UseLocalizationResult = UseLocalizationFunction(config2)
	local UseInServerContextualInfoResult, UseInServerContextualInfoResult2 = useInServerContextualInfo(UserId, Entry ~= nil, UseGetFriendshipStatusResult, UseLocalizationResult.inThisServer)
	local StartChatting = UseLocalizationResult.startChatting
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: StartChatting (copy)
		return { text = StartChatting }
	end, { StartChatting })
	local UseFriendChatCtaModuleResult, UseFriendChatCtaModuleResult2 = UseFriendChatCtaModule(UserId, IsUseGetFriendshipStatusResultMatch, p1.onConversationActivated)
	local UseResult = ReactModule.useCallback(function(AcceptFriendRequest)
		-- upvalues: ClientCtaActions (upval), DataHydrationModule (upval), UserId (copy), config (upval), FriendRequestsModule (upval)
		if AcceptFriendRequest == ClientCtaActions.RequestFriendship then
			local GetResult = DataHydrationModule.Friends.FriendsStore.get()
			local DataResult = GetResult.GetFriendshipStatus(UserId, config).data(false)
			
			if DataResult == nil or DataResult == Enum.FriendStatus.NotFriend then
				GetResult.UpdateFriendshipStatus(UserId, Enum.FriendStatus.FriendRequestSent)
				
				return
			end
		elseif AcceptFriendRequest == ClientCtaActions.AcceptFriendRequest then
			FriendRequestsModule.removeAcceptedFriendRequest(UserId)
		end
	end, { UserId })
	
	return if IsUseGetFriendshipStatusResultMatch or Entry ~= nil then {
		entityId = UserId,
		layoutMode = RowLayoutMode.Wide,
		rowSize = RowSize.Small,
		primaryClientAction = Entry,
		primaryCta = if IsUseGetFriendshipStatusResultMatch then UseFriendChatCtaModuleResult else nil,
		onActivated = if IsUseGetFriendshipStatusResultMatch then UseFriendChatCtaModuleResult2 else nil,
		onClientActionSuccess = UseResult,
		contextualInfoSource = if IsUseGetFriendshipStatusResultMatch then nil else UseInServerContextualInfoResult,
		contextualInfo = if IsUseGetFriendshipStatusResultMatch then UseMemoResult else UseInServerContextualInfoResult2,
		showToast = ShowSuggestedUserToastModule,
		friendshipOriginSourceType = FriendshipOriginSourceType.InGame
	} else nil
end