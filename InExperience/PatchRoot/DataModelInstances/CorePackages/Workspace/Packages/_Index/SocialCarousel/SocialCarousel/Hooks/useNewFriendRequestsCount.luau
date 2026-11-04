local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FriendsRequestsModule = require(Parent.DataHydration.FriendsRequests)
local FriendsRequestsStore = FriendsRequestsModule.FriendsRequestsStore
local UnseenRequestsStore = FriendsRequestsModule.UnseenRequestsStore
local FStringNewFriendRequestsBadgeLayer = require(Parent.SharedFlags).FStringNewFriendRequestsBadgeLayer
local FFlagAddFriendsPageHighlightUnseenTrustedRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenTrustedRequests
local FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule = require(SocialCarousel.Flags.FFlagSocialCarouselEnableNewFriendRequestsBadgeForAll)

return function()
	-- upvalues: FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule (copy), RoactAppExperimentModule (copy), FStringNewFriendRequestsBadgeLayer (copy), ReactModule (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (copy), UnseenRequestsStore (copy), FriendsRequestsStore (copy), UseSignalStateFunction (copy)
	local UseSignalStateResult = UseSignalStateFunction(ReactModule.useMemo(function()
		-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), UnseenRequestsStore (upval), FriendsRequestsStore (upval)
		return if FFlagAddFriendsPageHighlightUnseenTrustedRequests then UnseenRequestsStore.get().getUnseenRequestCount() else FriendsRequestsStore.get().getNewFriendsRequestCount()
	end, {}).data) or 0
	local Text = tostring(UseSignalStateResult)
	
	return if (if FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule then true else RoactAppExperimentModule.useUserExperiment({ FStringNewFriendRequestsBadgeLayer }, function(p1)
		-- upvalues: FStringNewFriendRequestsBadgeLayer (upval)
		return (p1[FStringNewFriendRequestsBadgeLayer] or {}).showNewFriendRequestsBadge
	end)) and UseSignalStateResult > 0 then Text else nil
end