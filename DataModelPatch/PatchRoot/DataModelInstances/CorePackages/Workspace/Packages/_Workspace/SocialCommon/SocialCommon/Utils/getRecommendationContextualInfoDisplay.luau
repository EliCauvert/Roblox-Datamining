local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local GetMutualFriendsTextModule = require(SocialCommon.Utils.getMutualFriendsText)
local RecommendationContextTypeModule = require(SocialCommon.Enums.RecommendationContextType)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local FFlagHomepagePYMKUseHorizontalUserList = require(Parent.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList

return function(p1)
	-- upvalues: FFlagHomepagePYMKUseHorizontalUserList (copy), RecommendationContextTypeModule (copy), GetMutualFriendsTextModule (copy), Images (copy)
	local ConnectionRequests = nil
	local IconsStatusPlayerFriend = nil
	local RawValueResult = p1.recommendation.contextType and p1.recommendation.contextType.rawValue()
	local MutualFriendsCount = p1.recommendation.mutualFriendsCount or 0
	
	if FFlagHomepagePYMKUseHorizontalUserList and p1.recommendation.hasIncomingFriendRequest then
		ConnectionRequests = p1.localized.connectionRequests
		IconsStatusPlayerFriend = nil
	end
	if RawValueResult == RecommendationContextTypeModule.Contacts.rawValue() then
		ConnectionRequests = p1.localized.contacts
	elseif RawValueResult == RecommendationContextTypeModule.MutualFriends.rawValue() and MutualFriendsCount > 0 then
		ConnectionRequests = GetMutualFriendsTextModule({
			mutualFriendsCount = MutualFriendsCount,
			localized = {
				mutualConnections = p1.localized.mutualConnections,
				singularMutualConnection = p1.localized.singularMutualConnection
			}
		})
		IconsStatusPlayerFriend = Images["icons/status/player/friend"]
	elseif RawValueResult == RecommendationContextTypeModule.Frequents.rawValue() then
		ConnectionRequests = p1.localized.frequents
	end
	if not FFlagHomepagePYMKUseHorizontalUserList and p1.recommendation.hasIncomingFriendRequest then
		ConnectionRequests = p1.localized.connectionRequests
		IconsStatusPlayerFriend = nil
	end
	return {
		text = ConnectionRequests,
		icon = IconsStatusPlayerFriend
	}
end