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
local fIntSocialCarouselShowRecsLimit = require(socialCarousel.Flags).FIntSocialCarouselShowRecsLimit
local fFlagSocialCarouselShowLoadingSkeletonModule = require(socialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local fFlagSocialCarouselShareQREnabled = require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled
local fIntFriendsCarouselInitialFetchSize = require(parent.SharedFlags).FIntFriendsCarouselInitialFetchSize
local fFlagEnableRecommendationsForPCGDK = require(parent.SharedFlags).FFlagEnableRecommendationsForPCGDK
local fFlagFixIsConsoleCheckForSocialCarousel = require(parent.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel
local prefetchFriendGameMedia = game:DefineFastFlag("PrefetchFriendGameMedia", false)
local tile = enumsModule.Tile
local tileGroup = enumsModule.TileGroup
local list = {
	{ tileGroup = tileGroup.AddFriends },
	{ tileGroup = tileGroup.FriendsListWithRecommendations }
}

return function(p0, p1) --[[ line: 46 ]]
	-- upvalues: list (ref), useLocalUserId (ref), useGetRecommendationsModule (ref), useFriendsListOrderedByPresence (ref), fIntFriendsCarouselInitialFetchSize (ref), prefetchFriendGameMedia (ref), usePrefetchInGameFriendsMedia (ref), fFlagFixIsConsoleCheckForSocialCarousel (ref), usePreferredInput (ref), responsiveModule (ref), fFlagEnableRecommendationsForPCGDK (ref), thirdPartyUserService (ref), fFlagSocialCarouselShareQREnabled (ref), useIsSpatial (ref), useSelector (ref), getDeepValueModule (ref), constantsModule (ref), fIntSocialCarouselShowRecsLimit (ref), reactModule (ref), tileGroup (ref), tile (ref), cryoModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref)
	local var19
	p1 = p1 or list
	local var16 = useLocalUserId()
	local var17 = useGetRecommendationsModule(var16)
	local var18 = useFriendsListOrderedByPresence({
		userId = var16,
		pageSize = fIntFriendsCarouselInitialFetchSize
	})
	
	if prefetchFriendGameMedia then
		usePrefetchInGameFriendsMedia(var18.onlineFriends)
	end
	if fFlagFixIsConsoleCheckForSocialCarousel then
		local _ = usePreferredInput() == responsiveModule.Input.Directional
	var19 = if fFlagEnableRecommendationsForPCGDK and thirdPartyUserService then thirdPartyUserService:HaveActiveUser() else usePreferredInput() == responsiveModule.Input.Directional
	local var20 = if fFlagSocialCarouselShareQREnabled then useIsSpatial() else false
	local var21 = useSelector(function(p2) --[[ line: 65 ]]
		-- upvalues: getDeepValueModule (copy), p0 (ref), constantsModule (copy), var16 (ref)
		return {
			friendCount = getDeepValueModule(p2, string.format("%s.Friends.countsByUserId.%s", p0 or constantsModule.RODUX_KEY, var16 or "")) or 0,
			friendRequestCount = getDeepValueModule(p2, string.format("%s.Friends.requests.receivedCount", p0 or constantsModule.RODUX_KEY)) or 0
		}
	end)
	local var22 = var19 and var21.friendCount <= fIntSocialCarouselShowRecsLimit
	local var23 = var21.friendCount == 0 and not var19
	local var24 = fFlagSocialCarouselShareQREnabled and (var21.friendCount == 0 and (not var19 and not var20))
	local var25 = reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: tileGroup (copy), var18 (ref), tile (copy), var22 (ref), var17 (ref), var24 (ref), var23 (ref)
		return {
			[tileGroup.FriendsList] = {
				{ tiles = var18.onlineFriends, tileType = tile.Friend },
				{ tiles = var18.offlineFriends, tileType = tile.Friend }
			},
			[tileGroup.FriendsListWithRecommendations] = {
				{ tiles = var18.onlineFriends, tileType = tile.Friend },
				if var22 then { tiles = var17, tileType = tile.Recommendation } else nil,
				{ tiles = var18.offlineFriends, tileType = tile.Friend }
			},
			[tileGroup.AddFriends] = {
				{ tileType = tile.AddFriends },
				if var24 then { tileType = tile.ShareQR } else nil,
				if var23 then { tileType = tile.FriendsHint } else nil
			},
			[tileGroup.StartSquad] = { { tileType = tile.StartSquad } }
		}
	end, {
		var18.onlineFriends, var18.offlineFriends, var17, var22, var23,
		if fFlagSocialCarouselShareQREnabled then var24 else nil
	})
	
	return {
		tiles = reactModule.useMemo(function() --[[ line: 117 ]]
			-- upvalues: p1 (ref), var25 (ref), cryoModule (copy)
			local t = {}
			
			for i, v in p1 do
				for i_1, v_1 in var25[v.tileGroup] do
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
		end, { var25, p1 }),
		friendCount = var21.friendCount,
		friendRequestCount = var21.friendRequestCount,
		recommendationCount = #var17,
		refreshFriendsList = var18.refreshFriendsData,
		isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var18.isLoading
	}
end