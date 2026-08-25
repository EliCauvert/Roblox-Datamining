local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local parent = socialCarousel.Parent
local friendsCommonModule = require(parent.FriendsCommon)
local gameJoinCardModule = require(parent.GameJoinCard)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local responsiveModule = require(parent.Responsive)
local useFriendsListOrderedByPresence = friendsCommonModule.Hooks.useFriendsListOrderedByPresence
local usePrefetchInGameFriendsMedia = gameJoinCardModule.usePrefetchInGameFriendsMedia
local useGetRecommendationsModule = require(socialCarousel.Hooks.useGetRecommendations)
local getDeepValueModule = require(socialCarousel.Utils.getDeepValue)
local enumsModule = require(socialCarousel.Common.Enums)
local constantsModule = require(socialCarousel.Common.Constants)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local usePreferredInput = responsiveModule.usePreferredInput
local useIsSpatial = responsiveModule.useIsSpatial
local useGetFriendsCountByUserId = require(parent.FriendsHydrationReact).useGetFriendsCountByUserId
local fIntSocialCarouselShowRecsLimit = require(socialCarousel.Flags).FIntSocialCarouselShowRecsLimit
local fFlagSocialCarouselShowLoadingSkeletonModule = require(socialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local fFlagSocialCarouselShareQREnabled = require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled
local fIntFriendsCarouselInitialFetchSize = require(parent.SharedFlags).FIntFriendsCarouselInitialFetchSize
local fFlagEnableRecommendationsForPCGDK = require(parent.SharedFlags).FFlagEnableRecommendationsForPCGDK
local fFlagFixIsConsoleCheckForSocialCarousel = require(parent.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel
local prefetchFriendGameMedia = game:DefineFastFlag("PrefetchFriendGameMedia", false)
local fFlagFriendsCountDataHydrationMigrationEnabled = require(parent.SharedFlags).FFlagFriendsCountDataHydrationMigrationEnabled
local tile = enumsModule.Tile
local tileGroup = enumsModule.TileGroup
local list = {
	{ tileGroup = tileGroup.AddFriends },
	{ tileGroup = tileGroup.FriendsListWithRecommendations }
}
local t = { skipFetch = true }

return function(p0, p1)
	-- upvalues: list (ref), useLocalUserId (ref), useGetRecommendationsModule (ref), useFriendsListOrderedByPresence (ref), fIntFriendsCarouselInitialFetchSize (ref), prefetchFriendGameMedia (ref), usePrefetchInGameFriendsMedia (ref), fFlagFixIsConsoleCheckForSocialCarousel (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableRecommendationsForPCGDK (ref), thirdPartyUserService (ref), fFlagSocialCarouselShareQREnabled (ref), useIsSpatial (ref), useSelector (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), getDeepValueModule (ref), constantsModule (ref), useGetFriendsCountByUserId (ref), t (ref), fIntSocialCarouselShowRecsLimit (ref), reactModule (ref), tileGroup (ref), tile (ref), cryoModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref)
	local var20
	p1 = p1 or list
	local var17 = useLocalUserId()
	local var18 = useGetRecommendationsModule(var17)
	local var19 = useFriendsListOrderedByPresence({
		userId = var17,
		pageSize = fIntFriendsCarouselInitialFetchSize
	})
	
	if prefetchFriendGameMedia then
		usePrefetchInGameFriendsMedia(var19.onlineFriends)
	end
	if fFlagFixIsConsoleCheckForSocialCarousel then
		local _ = usePreferredInput() == responsiveModule.Input.Directional
	var20 = if fFlagEnableRecommendationsForPCGDK and thirdPartyUserService then thirdPartyUserService:HaveActiveUser() else usePreferredInput() == responsiveModule.Input.Directional
	local var21 = if fFlagSocialCarouselShareQREnabled then useIsSpatial() else false
	local var22 = useSelector(function(p2)
		-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), getDeepValueModule (copy), p0 (ref), constantsModule (copy), var17 (ref)
		return {
			friendCount = if fFlagFriendsCountDataHydrationMigrationEnabled then nil else getDeepValueModule(p2, string.format("%s.Friends.countsByUserId.%s", p0 or constantsModule.RODUX_KEY, var17 or "")) or 0,
			friendRequestCount = getDeepValueModule(p2, string.format("%s.Friends.requests.receivedCount", p0 or constantsModule.RODUX_KEY)) or 0
		}
	end)
	local var23 = if fFlagFriendsCountDataHydrationMigrationEnabled then useGetFriendsCountByUserId(tostring(var17 or ""), t) or 0 else var22.friendCount
	local var24 = var20 and var23 <= fIntSocialCarouselShowRecsLimit
	local var25 = var23 == 0 and not var20
	local var26 = fFlagSocialCarouselShareQREnabled and (var23 == 0 and (not var20 and not var21))
	local var27 = reactModule.useMemo(function()
		-- upvalues: tileGroup (copy), var19 (ref), tile (copy), var24 (ref), var18 (ref), var26 (ref), var25 (ref)
		return {
			[tileGroup.FriendsList] = {
				{ tiles = var19.onlineFriends, tileType = tile.Friend },
				{ tiles = var19.offlineFriends, tileType = tile.Friend }
			},
			[tileGroup.FriendsListWithRecommendations] = {
				{ tiles = var19.onlineFriends, tileType = tile.Friend },
				if var24 then { tiles = var18, tileType = tile.Recommendation } else nil,
				{ tiles = var19.offlineFriends, tileType = tile.Friend }
			},
			[tileGroup.AddFriends] = {
				{ tileType = tile.AddFriends },
				if var26 then { tileType = tile.ShareQR } else nil,
				if var25 then { tileType = tile.FriendsHint } else nil
			},
			[tileGroup.StartSquad] = { { tileType = tile.StartSquad } }
		}
	end, {
		var19.onlineFriends, var19.offlineFriends, var18, var24, var25,
		if fFlagSocialCarouselShareQREnabled then var26 else nil
	})
	
	return {
		tiles = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var27 (ref), cryoModule (copy)
			local t = {}
			
			for i, v in p1 do
				for i_1, v_1 in var27[v.tileGroup] do
					if v_1 then
						if v_1.tiles then
							for i_2, v_2 in v_1.tiles do
								table.insert(t, cryoModule.Dictionary.join(v_2, { tileType = v_1.tileType, onActivated = v.onActivated }))
							end
						else
							table.insert(t, { tileType = v_1.tileType, onActivated = v.onActivated })
						end
					end
				end
			end
			return t
		end, { var27, p1 }),
		friendCount = var23,
		friendRequestCount = var22.friendRequestCount,
		recommendationCount = #var18,
		refreshFriendsList = var19.refreshFriendsData,
		isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var19.isLoading
	}
end