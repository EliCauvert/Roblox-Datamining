local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local Parent = SocialCarousel.Parent
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local TutilsModule = require(Parent.tutils)
local UseFriendsListOrderedByPresenceFunction = require(Parent.FriendsCommon).Hooks.useFriendsListOrderedByPresence
local UsePrefetchInGameFriendsMediaFunction = require(Parent.GameJoinCard).usePrefetchInGameFriendsMedia
local UseGetFriendRequestsModule = require(SocialCarousel.Hooks.useGetFriendRequests)
local UseGetRecommendationsModule = require(SocialCarousel.Hooks.useGetRecommendations)
local GetDeepValueModule = require(SocialCarousel.Utils.getDeepValue)
local EnumsModule = require(SocialCarousel.Common.Enums)
local ConstantsModule = require(SocialCarousel.Common.Constants)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UseGetFriendsCountByUserIdFunction = require(Parent.FriendsHydrationReact).useGetFriendsCountByUserId
local FIntSocialCarouselShowRecsLimit = require(SocialCarousel.Flags).FIntSocialCarouselShowRecsLimit
local FFlagSocialCarouselShowLoadingSkeletonModule = require(SocialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagShowRequestsInCarouselForAllUsers = SharedFlagsModule.FFlagShowRequestsInCarouselForAllUsers
local FFlagSocialCarouselShareQREnabled = SharedFlagsModule.FFlagSocialCarouselShareQREnabled
local FIntFriendsCarouselInitialFetchSize = SharedFlagsModule.FIntFriendsCarouselInitialFetchSize
local FFlagEnableRecommendationsForPCGDK = require(Parent.SharedFlags).FFlagEnableRecommendationsForPCGDK
local FFlagFixIsConsoleCheckForSocialCarousel = require(Parent.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel
local PrefetchFriendGameMedia = game:DefineFastFlag("PrefetchFriendGameMedia", false)
local FFlagSocialCarouselStableSelectorsModule = require(SocialCarousel.Flags.FFlagSocialCarouselStableSelectors)
local Tile = EnumsModule.Tile
local TileGroup = EnumsModule.TileGroup
local List = {
	{ tileGroup = TileGroup.AddFriends },
	{ tileGroup = TileGroup.FriendsListWithRecommendations }
}

if FFlagShowRequestsInCarouselForAllUsers then
	table.insert(List, { tileGroup = TileGroup.FriendRequests })
end
local config = { skipFetch = true }

return function(p1, p2)
	-- upvalues: List (copy), UseLocalUserIdFunction (copy), UseGetRecommendationsModule (copy), UseFriendsListOrderedByPresenceFunction (copy), FIntFriendsCarouselInitialFetchSize (copy), PrefetchFriendGameMedia (copy), UsePrefetchInGameFriendsMediaFunction (copy), FFlagFixIsConsoleCheckForSocialCarousel (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagEnableRecommendationsForPCGDK (copy), ThirdPartyUserService (copy), FFlagSocialCarouselShareQREnabled (copy), UseIsSpatialFunction (copy), UseSelectorFunction (copy), GetDeepValueModule (copy), ConstantsModule (copy), FFlagSocialCarouselStableSelectorsModule (copy), TutilsModule (copy), UseGetFriendsCountByUserIdFunction (copy), config (copy), FFlagShowRequestsInCarouselForAllUsers (copy), ReactModule (copy), TileGroup (copy), UseGetFriendRequestsModule (copy), FIntSocialCarouselShowRecsLimit (copy), Tile (copy), CryoModule (copy), FFlagSocialCarouselShowLoadingSkeletonModule (copy)
	local P1 = p2 or List
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseGetRecommendationsModuleResult = UseGetRecommendationsModule(UseLocalUserIdResult)
	local UseFriendsListOrderedByPresenceResult = UseFriendsListOrderedByPresenceFunction({
		userId = UseLocalUserIdResult,
		pageSize = FIntFriendsCarouselInitialFetchSize
	})
	
	if PrefetchFriendGameMedia then
		UsePrefetchInGameFriendsMediaFunction(UseFriendsListOrderedByPresenceResult.onlineFriends)
	end
	local IsUsePreferredInputResultMatch = if FFlagFixIsConsoleCheckForSocialCarousel then UsePreferredInputFunction() == ResponsiveModule.Input.Directional elseif FFlagEnableRecommendationsForPCGDK and ThirdPartyUserService then ThirdPartyUserService:HaveActiveUser() else UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseIsSpatialResult = if FFlagSocialCarouselShareQREnabled then UseIsSpatialFunction() else false
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: GetDeepValueModule (upval), p1 (copy), ConstantsModule (upval)
		return {
			friendRequestCount = GetDeepValueModule(p3, string.format("%s.Friends.requests.receivedCount", p1 or ConstantsModule.RODUX_KEY)) or 0
		}
	end, if FFlagSocialCarouselStableSelectorsModule then TutilsModule.shallowEqual else nil)
	local UseGetFriendsCountByUserIdResult = UseGetFriendsCountByUserIdFunction(tostring(UseLocalUserIdResult or ""), config) or 0
	local UseMemoResult = if FFlagShowRequestsInCarouselForAllUsers then ReactModule.useMemo(function(): boolean
		-- upvalues: P1 (copy), TileGroup (upval)
		for _, value in P1 do
			if value.tileGroup == TileGroup.FriendRequests then
				return true
			end
		end
		return false
	end, { P1 }) else false
	local UseGetFriendRequestsModuleResult = if FFlagShowRequestsInCarouselForAllUsers then UseGetFriendRequestsModule(UseMemoResult and UseGetFriendsCountByUserIdResult < FIntFriendsCarouselInitialFetchSize) else nil
	local IsUseGetFriendsCountByUserIdResultBelow: boolean = IsUsePreferredInputResultMatch and UseGetFriendsCountByUserIdResult <= FIntSocialCarouselShowRecsLimit
	local UseMemoResult1 = if FFlagShowRequestsInCarouselForAllUsers then ReactModule.useMemo(function()
		-- upvalues: UseGetFriendRequestsModuleResult (copy), UseFriendsListOrderedByPresenceResult (copy), IsUseGetFriendsCountByUserIdResultBelow (copy), UseGetRecommendationsModuleResult (copy)
		if #UseGetFriendRequestsModuleResult == 0 then
			return UseGetFriendRequestsModuleResult
		end
		local t = {}
		
		for _, onlineFriend in UseFriendsListOrderedByPresenceResult.onlineFriends do
			t[tostring(onlineFriend.id)] = true
		end
		for _, offlineFriend in UseFriendsListOrderedByPresenceResult.offlineFriends do
			t[tostring(offlineFriend.id)] = true
		end
		if IsUseGetFriendsCountByUserIdResultBelow then
			for _, value in UseGetRecommendationsModuleResult do
				t[tostring(value.id)] = true
			end
		end
		local List = {}
		
		for _, value1 in UseGetFriendRequestsModuleResult do
			if not t[tostring(value1.id)] then
				table.insert(List, value1)
			end
		end
		return List
	end, {
		UseFriendsListOrderedByPresenceResult.onlineFriends,
		UseFriendsListOrderedByPresenceResult.offlineFriends,
		UseGetRecommendationsModuleResult,
		UseGetFriendRequestsModuleResult,
		IsUseGetFriendsCountByUserIdResultBelow
	}) else UseGetFriendRequestsModuleResult
	local NoIsUsePreferredInputResultMatch: boolean = UseGetFriendsCountByUserIdResult == 0 and not IsUsePreferredInputResultMatch
	local NoUseIsSpatialResult: boolean = FFlagSocialCarouselShareQREnabled and (UseGetFriendsCountByUserIdResult == 0 and (not IsUsePreferredInputResultMatch and not UseIsSpatialResult))
	local v1 = false
	
	if FFlagShowRequestsInCarouselForAllUsers then
		v1 = UseGetFriendsCountByUserIdResult < FIntFriendsCarouselInitialFetchSize and #UseMemoResult1 > 0
		NoIsUsePreferredInputResultMatch = NoIsUsePreferredInputResultMatch and not v1
		NoUseIsSpatialResult = NoUseIsSpatialResult and not v1
	end
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: TileGroup (upval), UseFriendsListOrderedByPresenceResult (copy), Tile (upval), IsUseGetFriendsCountByUserIdResultBelow (copy), UseGetRecommendationsModuleResult (copy), NoUseIsSpatialResult (ref), NoIsUsePreferredInputResultMatch (ref), FFlagShowRequestsInCarouselForAllUsers (upval), v1 (ref), UseMemoResult1 (ref)
		local config = {
			[TileGroup.FriendsList] = {
				{
					tiles = UseFriendsListOrderedByPresenceResult.onlineFriends,
					tileType = Tile.Friend
				},
				{
					tiles = UseFriendsListOrderedByPresenceResult.offlineFriends,
					tileType = Tile.Friend
				}
			},
			[TileGroup.FriendsListWithRecommendations] = {
				{
					tiles = UseFriendsListOrderedByPresenceResult.onlineFriends,
					tileType = Tile.Friend
				},
				if IsUseGetFriendsCountByUserIdResultBelow then {
					tiles = UseGetRecommendationsModuleResult,
					tileType = Tile.Recommendation
				} else nil,
				{
					tiles = UseFriendsListOrderedByPresenceResult.offlineFriends,
					tileType = Tile.Friend
				}
			},
			[TileGroup.AddFriends] = {
				{ tileType = Tile.AddFriends },
				if NoUseIsSpatialResult then { tileType = Tile.ShareQR } else nil,
				if NoIsUsePreferredInputResultMatch then { tileType = Tile.FriendsHint } else nil
			},
			[TileGroup.StartSquad] = { { tileType = Tile.StartSquad } }
		}
		
		if FFlagShowRequestsInCarouselForAllUsers then
			config[TileGroup.FriendRequests] = {
				if v1 then { tiles = UseMemoResult1, tileType = Tile.FriendRequest } else nil
			}
		end
		return config
	end, {
		UseFriendsListOrderedByPresenceResult.onlineFriends,
		UseFriendsListOrderedByPresenceResult.offlineFriends,
		UseGetRecommendationsModuleResult,
		if FFlagShowRequestsInCarouselForAllUsers then UseMemoResult1 else nil,
		if FFlagShowRequestsInCarouselForAllUsers then v1 else nil,
		IsUseGetFriendsCountByUserIdResultBelow, NoIsUsePreferredInputResultMatch,
		if FFlagSocialCarouselShareQREnabled then NoUseIsSpatialResult else nil
	})
	
	return {
		tiles = ReactModule.useMemo(function()
			-- upvalues: P1 (copy), UseMemoResult11 (copy), CryoModule (upval)
			local List = {}
			
			for _, value in P1 do
				for _, value1 in UseMemoResult11[value.tileGroup] do
					if value1 then
						if not value1.tiles then
							table.insert(List, {
								tileType = value1.tileType,
								onActivated = value.onActivated
							})
							continue
						end
						for _, tile in value1.tiles do
							table.insert(List, CryoModule.Dictionary.join(tile, {
								tileType = value1.tileType,
								onActivated = value.onActivated
							}))
						end
					end
				end
			end
			return List
		end, { UseMemoResult11, P1 }),
		friendCount = UseGetFriendsCountByUserIdResult,
		friendRequestCount = UseSelectorResult.friendRequestCount,
		recommendationCount = #UseGetRecommendationsModuleResult,
		refreshFriendsList = UseFriendsListOrderedByPresenceResult.refreshFriendsData,
		isLoading = FFlagSocialCarouselShowLoadingSkeletonModule and UseFriendsListOrderedByPresenceResult.isLoading
	}
end