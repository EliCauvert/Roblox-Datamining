local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local Parent = SocialCarousel.Parent
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseFriendsListOrderedByPresenceFunction = require(Parent.FriendsCommon).Hooks.useFriendsListOrderedByPresence
local UsePrefetchInGameFriendsMediaFunction = require(Parent.GameJoinCard).usePrefetchInGameFriendsMedia
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
local FFlagSocialCarouselShareQREnabled = require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled
local FIntFriendsCarouselInitialFetchSize = require(Parent.SharedFlags).FIntFriendsCarouselInitialFetchSize
local FFlagEnableRecommendationsForPCGDK = require(Parent.SharedFlags).FFlagEnableRecommendationsForPCGDK
local FFlagFixIsConsoleCheckForSocialCarousel = require(Parent.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel
local PrefetchFriendGameMedia = game:DefineFastFlag("PrefetchFriendGameMedia", false)
local FFlagFriendsCountDataHydrationMigrationEnabled = require(Parent.SharedFlags).FFlagFriendsCountDataHydrationMigrationEnabled
local Tile = EnumsModule.Tile
local TileGroup = EnumsModule.TileGroup
local list = {
	{ tileGroup = TileGroup.AddFriends },
	{ tileGroup = TileGroup.FriendsListWithRecommendations }
}
local config = { skipFetch = true }

return function(p1, p2)
	-- upvalues: list (copy), UseLocalUserIdFunction (copy), UseGetRecommendationsModule (copy), UseFriendsListOrderedByPresenceFunction (copy), FIntFriendsCarouselInitialFetchSize (copy), PrefetchFriendGameMedia (copy), UsePrefetchInGameFriendsMediaFunction (copy), FFlagFixIsConsoleCheckForSocialCarousel (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagEnableRecommendationsForPCGDK (copy), ThirdPartyUserService (copy), FFlagSocialCarouselShareQREnabled (copy), UseIsSpatialFunction (copy), UseSelectorFunction (copy), FFlagFriendsCountDataHydrationMigrationEnabled (copy), GetDeepValueModule (copy), ConstantsModule (copy), UseGetFriendsCountByUserIdFunction (copy), config (copy), FIntSocialCarouselShowRecsLimit (copy), ReactModule (copy), TileGroup (copy), Tile (copy), CryoModule (copy), FFlagSocialCarouselShowLoadingSkeletonModule (copy)
	local P1 = p2 or list
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
		-- upvalues: FFlagFriendsCountDataHydrationMigrationEnabled (upval), GetDeepValueModule (upval), p1 (copy), ConstantsModule (upval), UseLocalUserIdResult (copy)
		return {
			friendCount = if FFlagFriendsCountDataHydrationMigrationEnabled then nil else GetDeepValueModule(p3, string.format("%s.Friends.countsByUserId.%s", p1 or ConstantsModule.RODUX_KEY, UseLocalUserIdResult or "")) or 0,
			friendRequestCount = GetDeepValueModule(p3, string.format("%s.Friends.requests.receivedCount", p1 or ConstantsModule.RODUX_KEY)) or 0
		}
	end)
	local UseGetFriendsCountByUserIdResult = if FFlagFriendsCountDataHydrationMigrationEnabled then UseGetFriendsCountByUserIdFunction(tostring(UseLocalUserIdResult or ""), config) or 0 else UseSelectorResult.friendCount
	local IsUseGetFriendsCountByUserIdResultBelow: boolean = IsUsePreferredInputResultMatch and UseGetFriendsCountByUserIdResult <= FIntSocialCarouselShowRecsLimit
	local NoIsUsePreferredInputResultMatch: boolean = UseGetFriendsCountByUserIdResult == 0 and not IsUsePreferredInputResultMatch
	local NoUseIsSpatialResult: boolean = FFlagSocialCarouselShareQREnabled and (UseGetFriendsCountByUserIdResult == 0 and (not IsUsePreferredInputResultMatch and not UseIsSpatialResult))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: TileGroup (upval), UseFriendsListOrderedByPresenceResult (copy), Tile (upval), IsUseGetFriendsCountByUserIdResultBelow (copy), UseGetRecommendationsModuleResult (copy), NoUseIsSpatialResult (copy), NoIsUsePreferredInputResultMatch (copy)
		return {
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
	end, {
		UseFriendsListOrderedByPresenceResult.onlineFriends,
		UseFriendsListOrderedByPresenceResult.offlineFriends,
		UseGetRecommendationsModuleResult, IsUseGetFriendsCountByUserIdResultBelow,
		NoIsUsePreferredInputResultMatch,
		if FFlagSocialCarouselShareQREnabled then NoUseIsSpatialResult else nil
	})
	
	return {
		tiles = ReactModule.useMemo(function()
			-- upvalues: P1 (copy), UseMemoResult (copy), CryoModule (upval)
			local List = {}
			
			for _, value in P1 do
				for _, value1 in UseMemoResult[value.tileGroup] do
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
		end, { UseMemoResult, P1 }),
		friendCount = UseGetFriendsCountByUserIdResult,
		friendRequestCount = UseSelectorResult.friendRequestCount,
		recommendationCount = #UseGetRecommendationsModuleResult,
		refreshFriendsList = UseFriendsListOrderedByPresenceResult.refreshFriendsData,
		isLoading = FFlagSocialCarouselShowLoadingSkeletonModule and UseFriendsListOrderedByPresenceResult.isLoading
	}
end