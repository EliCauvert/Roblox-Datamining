local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local GetMutualFriendsTextModule = require(SocialCommon.Utils.getMutualFriendsText)
local RecommendationContextTypeModule = require(SocialCommon.Enums.RecommendationContextType)
local FFlagShowClassmatesOnPYMKModule = require(Parent.SharedFlags.FFlagShowClassmatesOnPYMK)
local Images = require(Parent.UIBlox).App.ImageSet.Images

return function(p1)
	-- upvalues: RecommendationContextTypeModule (copy), GetMutualFriendsTextModule (copy), Images (copy), FFlagShowClassmatesOnPYMKModule (copy)
	local Classmates = nil
	local IconsStatusPlayerFriend = nil
	local RawValueResult = p1.recommendation.contextType and p1.recommendation.contextType.rawValue()
	local MutualFriendsCount = p1.recommendation.mutualFriendsCount or 0
	
	if p1.recommendation.hasIncomingFriendRequest then
		Classmates = p1.localized.connectionRequests
		IconsStatusPlayerFriend = nil
	end
	if RawValueResult == RecommendationContextTypeModule.Contacts.rawValue() then
		Classmates = p1.localized.contacts
	elseif RawValueResult == RecommendationContextTypeModule.MutualFriends.rawValue() and MutualFriendsCount > 0 then
		Classmates = GetMutualFriendsTextModule({
			mutualFriendsCount = MutualFriendsCount,
			localized = {
				mutualConnections = p1.localized.mutualConnections,
				singularMutualConnection = p1.localized.singularMutualConnection
			}
		})
		IconsStatusPlayerFriend = Images["icons/status/player/friend"]
	elseif RawValueResult == RecommendationContextTypeModule.Frequents.rawValue() then
		Classmates = p1.localized.frequents
	elseif FFlagShowClassmatesOnPYMKModule and RawValueResult == RecommendationContextTypeModule.Classmates.rawValue() then
		Classmates = p1.localized.classmates
	end
	return { text = Classmates, icon = IconsStatusPlayerFriend }
end