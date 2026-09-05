local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local getDeepValueModule = require(socialCarousel.Utils.getDeepValue)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local friendsRequestsStore = require(parent.DataHydration.FriendsRequests).FriendsRequestsStore
local fStringNewFriendRequestsBadgeLayer = require(parent.SharedFlags).FStringNewFriendRequestsBadgeLayer
local fFlagAddFriendsPageUseSections = require(parent.SharedFlags).FFlagAddFriendsPageUseSections
local fFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableNewFriendRequestsBadgeForAll)

return function()
	-- upvalues: fFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule (ref), roactAppExperimentModule (ref), fStringNewFriendRequestsBadgeLayer (ref), fFlagAddFriendsPageUseSections (ref), reactModule (ref), friendsRequestsStore (ref), useSignalState (ref), useSelector (ref), getDeepValueModule (ref)
	local var1 = if fFlagAddFriendsPageUseSections then useSignalState((if fFlagAddFriendsPageUseSections then reactModule.useMemo(function()
		-- upvalues: friendsRequestsStore (copy)
		return friendsRequestsStore.get().getNewFriendsRequestCount()
	end, {}) else nil).data) or 0 else useSelector(function(p1)
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p1, "FriendsCarousel.Friends.requests.newFriendRequestsCount") or 0
	end)
	
	return if (if fFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule then true else roactAppExperimentModule.useUserExperiment({ fStringNewFriendRequestsBadgeLayer }, function(p1)
		-- upvalues: fStringNewFriendRequestsBadgeLayer (copy)
		return (p1[fStringNewFriendRequestsBadgeLayer] or {}).showNewFriendRequestsBadge
	end)) and var1 > 0 then tostring(var1) else nil
end