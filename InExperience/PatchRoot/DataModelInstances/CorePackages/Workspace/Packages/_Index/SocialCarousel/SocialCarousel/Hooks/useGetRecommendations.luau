local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FriendsRecommendationsModule = require(Parent.DataHydration.FriendsRecommendations)
local FriendsRecommendationsStore = FriendsRecommendationsModule.FriendsRecommendationsStore
local DataSource = FriendsRecommendationsModule.Enums.DataSource
local GetResult = DataHydrationModule.Friends.FriendsStore.get()
local config = { skipFetch = true }

return function(_)
	-- upvalues: ReactModule (copy), SignalsModule (copy), FriendsRecommendationsStore (copy), DataSource (copy), config (copy), CryoModule (copy), GetResult (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), FriendsRecommendationsStore (upval), DataSource (upval), config (upval), CryoModule (upval), GetResult (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: FriendsRecommendationsStore (upval), DataSource (upval), config (upval), CryoModule (upval), GetResult (upval)
			local DataResult = FriendsRecommendationsStore.get().getFriendsRecommendations(DataSource.HomepageFriendsCarousel, config).data(p1)
			
			return CryoModule.List.map(DataResult and DataResult.data or {}, function(p2)
				-- upvalues: GetResult (upval), config (upval), p1 (copy)
				local Id = p2.id
				local FriendshipStatus = GetResult.GetFriendshipStatus(Id, config)
				local DataResult = if FriendshipStatus then FriendshipStatus.data(p1) else nil
				
				return {
					id = Id,
					mutualFriendsCount = p2.contextProps.mutualFriendsCount,
					contextType = p2.contextProps.contextType,
					rank = p2.rank,
					hasIncomingFriendRequest = p2.hasIncomingFriendRequest,
					isFriendWithUser = if DataResult then DataResult == Enum.FriendStatus.Friend else false,
					hasPendingFriendRequest = if DataResult then DataResult == Enum.FriendStatus.FriendRequestSent else false,
					canSendFriendRequest = not DataResult or DataResult == Enum.FriendStatus.NotFriend
				}
			end)
		end)
	end, {}))) or {}
end