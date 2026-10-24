local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local GetDeepValueModule = require(SocialCarousel.Utils.getDeepValue)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FriendsRequestsModule = require(Parent.DataHydration.FriendsRequests)
local FriendsRequestsStore = FriendsRequestsModule.FriendsRequestsStore
local UnseenRequestsStore = FriendsRequestsModule.UnseenRequestsStore
local FStringNewFriendRequestsBadgeLayer = require(Parent.SharedFlags).FStringNewFriendRequestsBadgeLayer
local FFlagAddFriendsPageUseSections = require(Parent.SharedFlags).FFlagAddFriendsPageUseSections
local FFlagAddFriendsPageHighlightUnseenTrustedRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenTrustedRequests
local FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule = require(SocialCarousel.Flags.FFlagSocialCarouselEnableNewFriendRequestsBadgeForAll)

return function()
	-- upvalues: FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule (copy), RoactAppExperimentModule (copy), FStringNewFriendRequestsBadgeLayer (copy), FFlagAddFriendsPageUseSections (copy), ReactModule (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (copy), UnseenRequestsStore (copy), FriendsRequestsStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), GetDeepValueModule (copy)
	local UseMemoResult = if FFlagAddFriendsPageUseSections then ReactModule.useMemo(function()
		-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), UnseenRequestsStore (upval), FriendsRequestsStore (upval)
		return if FFlagAddFriendsPageHighlightUnseenTrustedRequests then UnseenRequestsStore.get().getUnseenRequestCount() else FriendsRequestsStore.get().getNewFriendsRequestCount()
	end, {}) else nil
	local UseSignalStateResult = if FFlagAddFriendsPageUseSections then UseSignalStateFunction(UseMemoResult.data) or 0 else UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p1, "FriendsCarousel.Friends.requests.newFriendRequestsCount") or 0
	end)
	local Text = tostring(UseSignalStateResult)
	
	return if (if FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule then true else RoactAppExperimentModule.useUserExperiment({ FStringNewFriendRequestsBadgeLayer }, function(p1)
		-- upvalues: FStringNewFriendRequestsBadgeLayer (upval)
		return (p1[FStringNewFriendRequestsBadgeLayer] or {}).showNewFriendRequestsBadge
	end)) and UseSignalStateResult > 0 then Text else nil
end