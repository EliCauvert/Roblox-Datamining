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

return function(p1, p2)
	-- upvalues: list (ref), useLocalUserId (ref), useGetRecommendationsModule (ref), useFriendsListOrderedByPresence (ref), fIntFriendsCarouselInitialFetchSize (ref), prefetchFriendGameMedia (ref), usePrefetchInGameFriendsMedia (ref), fFlagFixIsConsoleCheckForSocialCarousel (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableRecommendationsForPCGDK (ref), thirdPartyUserService (ref), fFlagSocialCarouselShareQREnabled (ref), useIsSpatial (ref), useSelector (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), getDeepValueModule (ref), constantsModule (ref), useGetFriendsCountByUserId (ref), t (ref), fIntSocialCarouselShowRecsLimit (ref), reactModule (ref), tileGroup (ref), tile (ref), cryoModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref)
	local var1
	p2 = p2 or list
	local var2 = useLocalUserId()
	local var3 = useGetRecommendationsModule(var2)
	local var4 = useFriendsListOrderedByPresence({
		userId = var2,
		pageSize = fIntFriendsCarouselInitialFetchSize
	})
	
	if prefetchFriendGameMedia then
		usePrefetchInGameFriendsMedia(var4.onlineFriends)
	end
	if fFlagFixIsConsoleCheckForSocialCarousel then
		local _ = usePreferredInput() == responsiveModule.Input.Directional
	var1 = if fFlagEnableRecommendationsForPCGDK and thirdPartyUserService then thirdPartyUserService:HaveActiveUser() else usePreferredInput() == responsiveModule.Input.Directional
	local var5 = if fFlagSocialCarouselShareQREnabled then useIsSpatial() else false
	local var6 = useSelector(function(p3)
		-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), getDeepValueModule (copy), p1 (ref), constantsModule (copy), var2 (ref)
		return {
			friendCount = if fFlagFriendsCountDataHydrationMigrationEnabled then nil else getDeepValueModule(p3, string.format("%s.Friends.countsByUserId.%s", p1 or constantsModule.RODUX_KEY, var2 or "")) or 0,
			friendRequestCount = getDeepValueModule(p3, string.format("%s.Friends.requests.receivedCount", p1 or constantsModule.RODUX_KEY)) or 0
		}
	end)
	local var7 = if fFlagFriendsCountDataHydrationMigrationEnabled then useGetFriendsCountByUserId(tostring(var2 or ""), t) or 0 else var6.friendCount
	local var8 = var1 and var7 <= fIntSocialCarouselShowRecsLimit
	local var9 = var7 == 0 and not var1
	local var10 = fFlagSocialCarouselShareQREnabled and (var7 == 0 and (not var1 and not var5))
	local var11 = reactModule.useMemo(function()
		-- upvalues: tileGroup (copy), var4 (ref), tile (copy), var8 (ref), var3 (ref), var10 (ref), var9 (ref)
		return {
			[tileGroup.FriendsList] = {
				{ tiles = var4.onlineFriends, tileType = tile.Friend },
				{ tiles = var4.offlineFriends, tileType = tile.Friend }
			},
			[tileGroup.FriendsListWithRecommendations] = {
				{ tiles = var4.onlineFriends, tileType = tile.Friend },
				if var8 then { tiles = var3, tileType = tile.Recommendation } else nil,
				{ tiles = var4.offlineFriends, tileType = tile.Friend }
			},
			[tileGroup.AddFriends] = {
				{ tileType = tile.AddFriends },
				if var10 then { tileType = tile.ShareQR } else nil,
				if var9 then { tileType = tile.FriendsHint } else nil
			},
			[tileGroup.StartSquad] = { { tileType = tile.StartSquad } }
		}
	end, {
		var4.onlineFriends, var4.offlineFriends, var3, var8, var9,
		if fFlagSocialCarouselShareQREnabled then var10 else nil
	})
	
	return {
		tiles = reactModule.useMemo(function()
			-- upvalues: p2 (ref), var11 (ref), cryoModule (copy)
			local t = {}
			
			for i, v in p2 do
				for i_1, v_1 in var11[v.tileGroup] do
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
		end, { var11, p2 }),
		friendCount = var7,
		friendRequestCount = var6.friendRequestCount,
		recommendationCount = #var3,
		refreshFriendsList = var4.refreshFriendsData,
		isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var4.isLoading
	}
end