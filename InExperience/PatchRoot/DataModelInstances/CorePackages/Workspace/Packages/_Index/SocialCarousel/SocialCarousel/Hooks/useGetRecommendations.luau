local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetDeepValueModule = require(SocialCarousel.Utils.getDeepValue)
local ConstantsModule = require(SocialCarousel.Common.Constants)
local RecommendationSourceEnum = require(Parent.SocialCommon).Enums.RecommendationSourceEnum
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FriendsRecommendationsModule = require(Parent.DataHydration.FriendsRecommendations)
local FriendsRecommendationsStore = FriendsRecommendationsModule.FriendsRecommendationsStore
local DataSource = FriendsRecommendationsModule.Enums.DataSource
local FFlagMigrateFriendshipStatusesSocialCarouselModule = require(SocialCarousel.Flags.FFlagMigrateFriendshipStatusesSocialCarousel)
local FFlagSocialCarouselMigrateRecommendations = require(Parent.SharedFlags).FFlagSocialCarouselMigrateRecommendations
local GetResult = if FFlagMigrateFriendshipStatusesSocialCarouselModule then DataHydrationModule.Friends.FriendsStore.get() else nil
local config = { skipFetch = true }

local function v17(p1, p2): boolean
	return p1.rank < p2.rank
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), FFlagSocialCarouselMigrateRecommendations (copy), GetDeepValueModule (copy), ConstantsModule (copy), FFlagMigrateFriendshipStatusesSocialCarouselModule (copy), RecommendationSourceEnum (copy), ReactModule (copy), CryoModule (copy), SignalsModule (copy), GetResult (copy), config (copy), SignalsReactModule (copy), FriendsRecommendationsStore (copy), DataSource (copy), v17 (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: FFlagSocialCarouselMigrateRecommendations (upval), GetDeepValueModule (upval), ConstantsModule (upval), p1 (copy), FFlagMigrateFriendshipStatusesSocialCarouselModule (upval), RecommendationSourceEnum (upval)
		return {
			recommendationsDict = if FFlagSocialCarouselMigrateRecommendations then nil else GetDeepValueModule(p2, string.format("%s.Friends.recommendations.byUserId.%s", ConstantsModule.RODUX_KEY, p1 or "")) or {},
			friendshipStatus = if FFlagMigrateFriendshipStatusesSocialCarouselModule then nil else GetDeepValueModule(p2, string.format("%s.Friends.friendshipStatus", ConstantsModule.RODUX_KEY)) or {},
			friendsCarouselRecommendationIds = if FFlagSocialCarouselMigrateRecommendations then nil else GetDeepValueModule(p2, string.format("%s.Friends.recommendations.bySource.%s", ConstantsModule.RODUX_KEY, RecommendationSourceEnum.HomepageFriendsCarousel)) or {},
			hasIncomingFriendRequest = if FFlagSocialCarouselMigrateRecommendations then nil else GetDeepValueModule(p2, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", ConstantsModule.RODUX_KEY))
		}
	end)
	local UseMemoResult = if FFlagSocialCarouselMigrateRecommendations then nil else ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseSelectorResult (copy)
		return CryoModule.List.filter(CryoModule.Dictionary.keys(UseSelectorResult.recommendationsDict), function(p2)
			-- upvalues: UseSelectorResult (upval)
			return UseSelectorResult.friendsCarouselRecommendationIds[p2]
		end)
	end, {
		UseSelectorResult.recommendationsDict,
		UseSelectorResult.friendsCarouselRecommendationIds
	})
	local UseMemoResult1 = if FFlagMigrateFriendshipStatusesSocialCarouselModule and not FFlagSocialCarouselMigrateRecommendations then ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), GetResult (upval), config (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval), GetResult (upval), config (upval)
			local DataResults = {}
			
			for _, value in UseMemoResult do
				local FriendshipStatus = GetResult.GetFriendshipStatus(value, config)
				DataResults[value] = if FriendshipStatus then FriendshipStatus.data(p2) else nil
			end
			return DataResults
		end)
	end, { table.concat(UseMemoResult, ",") }) else nil
	local UseSignalStateResult = if FFlagMigrateFriendshipStatusesSocialCarouselModule and not FFlagSocialCarouselMigrateRecommendations then SignalsReactModule.useSignalState(UseMemoResult1) else nil
	local UseResult = if FFlagSocialCarouselMigrateRecommendations then nil else ReactModule.useCallback(function(p2)
		-- upvalues: UseSelectorResult (copy), FFlagMigrateFriendshipStatusesSocialCarouselModule (upval), UseSignalStateResult (ref), CryoModule (upval)
		local UseSignalStateResultEntry = if FFlagMigrateFriendshipStatusesSocialCarouselModule then UseSignalStateResult and UseSignalStateResult[p2] else UseSelectorResult.friendshipStatus[p2]
		
		return CryoModule.Dictionary.join({}, UseSelectorResult.recommendationsDict[p2], {
			isFriendWithUser = if UseSignalStateResultEntry then UseSignalStateResultEntry == Enum.FriendStatus.Friend else false,
			hasPendingFriendRequest = if UseSignalStateResultEntry then UseSignalStateResultEntry == Enum.FriendStatus.FriendRequestSent else false,
			canSendFriendRequest = not UseSignalStateResultEntry or UseSignalStateResultEntry == Enum.FriendStatus.NotFriend,
			hasIncomingFriendRequest = UseSelectorResult.hasIncomingFriendRequest[p2]
		})
	end, {
		UseSelectorResult.recommendationsDict,
		if FFlagMigrateFriendshipStatusesSocialCarouselModule then UseSignalStateResult else UseSelectorResult.friendshipStatus,
		UseSelectorResult.hasIncomingFriendRequest
	})
	local UseSignalStateResult1 = if FFlagSocialCarouselMigrateRecommendations then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), FriendsRecommendationsStore (upval), DataSource (upval), config (upval), CryoModule (upval), FFlagMigrateFriendshipStatusesSocialCarouselModule (upval), GetResult (upval), UseSelectorResult (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: FriendsRecommendationsStore (upval), DataSource (upval), config (upval), CryoModule (upval), FFlagMigrateFriendshipStatusesSocialCarouselModule (upval), GetResult (upval), UseSelectorResult (upval)
			local DataResult = FriendsRecommendationsStore.get().getFriendsRecommendations(DataSource.HomepageFriendsCarousel, config).data(p2)
			
			return CryoModule.List.map(DataResult and DataResult.data or {}, function(p3)
				-- upvalues: FFlagMigrateFriendshipStatusesSocialCarouselModule (upval), GetResult (upval), config (upval), p2 (copy), UseSelectorResult (upval)
				local Id = p3.id
				local DataResult = nil
				
				if FFlagMigrateFriendshipStatusesSocialCarouselModule then
					local FriendshipStatus = GetResult.GetFriendshipStatus(Id, config)
					DataResult = if FriendshipStatus then FriendshipStatus.data(p2) else nil
				else
					DataResult = UseSelectorResult.friendshipStatus[Id]
				end
				return {
					id = Id,
					mutualFriendsCount = p3.contextProps.mutualFriendsCount,
					contextType = p3.contextProps.contextType,
					rank = p3.rank,
					hasIncomingFriendRequest = p3.hasIncomingFriendRequest,
					isFriendWithUser = if DataResult then DataResult == Enum.FriendStatus.Friend else false,
					hasPendingFriendRequest = if DataResult then DataResult == Enum.FriendStatus.FriendRequestSent else false,
					canSendFriendRequest = not DataResult or DataResult == Enum.FriendStatus.NotFriend
				}
			end)
		end)
	end, if FFlagMigrateFriendshipStatusesSocialCarouselModule then {} else { UseSelectorResult.friendshipStatus }))) else nil
	local UseMemoResult2 = if FFlagSocialCarouselMigrateRecommendations then nil else ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseMemoResult (copy), UseResult (copy), v17 (upval)
		return CryoModule.List.sort(CryoModule.List.map(UseMemoResult, UseResult), v17)
	end, { UseMemoResult, UseResult })
	
	return if FFlagSocialCarouselMigrateRecommendations then UseSignalStateResult1 else UseMemoResult2
end