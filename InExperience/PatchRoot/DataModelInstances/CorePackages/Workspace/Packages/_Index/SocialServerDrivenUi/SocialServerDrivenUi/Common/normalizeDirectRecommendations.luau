local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local _ = require(Parent.PYMKCarousel)
local ContextType = require(Parent.DataHydration.FriendsRecommendations).Enums.ContextType
local FFlagShowClassmatesOnPYMKModule = require(Parent.SharedFlags.FFlagShowClassmatesOnPYMK)
local RecommendationType = require(Parent.RecommendationsStore).FriendRecommendations.RecommendationType

return function(List, p1)
	-- upvalues: RecommendationType (copy), ContextType (copy), FFlagShowClassmatesOnPYMKModule (copy)
	local List1 = {}
	
	for _, value in List do
		local v1 = p1[value.id]
		
		if v1 ~= nil then
			if v1.recommendationType == RecommendationType.User then
				local MutualFriendsCount = v1.mutualFriendsCount or 0
				table.insert(List1, {
					id = value.id,
					rank = value.rank,
					contextType = if v1.contextType == ContextType.MutualFriends and MutualFriendsCount > 0 then ContextType.MutualFriends elseif v1.contextType == ContextType.Frequents then ContextType.Frequents elseif FFlagShowClassmatesOnPYMKModule and v1.contextType == ContextType.Classmates then ContextType.Classmates else ContextType.None,
					mutualFriendsCount = MutualFriendsCount,
					hasIncomingFriendRequest = value.hasPendingFriendRequest
				})
			elseif v1.recommendationType == RecommendationType.Contact then
				table.insert(List1, {
					mutualFriendsCount = 0,
					id = value.id,
					rank = value.rank,
					contextType = ContextType.Contacts,
					hasIncomingFriendRequest = value.hasPendingFriendRequest,
					entityDisplayName = v1.contactName,
					thumbnailEntities = {
						avatarImageUrl = v1.avatarThumbnailUrl,
						headshotImageUrl = v1.headshotThumbnailUrl
					}
				})
			end
		end
	end
	return List1
end