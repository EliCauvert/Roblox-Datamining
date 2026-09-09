local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local _ = require(parent.PYMKCarousel)
local contextType = require(parent.DataHydration.FriendsRecommendations).Enums.ContextType
local recommendationType = require(parent.HomeStore).FriendRecommendations.RecommendationType

return function(p1, p2)
	-- upvalues: recommendationType (ref), contextType (ref)
	local t = {}
	
	for i, v in p1 do
		local id = p2[v.id]
		
		if id ~= nil then
			if id.recommendationType == recommendationType.User then
				local mutualFriendsCount = id.mutualFriendsCount or 0
				table.insert(t, {
					id = v.id,
					rank = v.rank,
					contextType = if id.contextType == contextType.MutualFriends and mutualFriendsCount > 0 then contextType.MutualFriends elseif id.contextType == contextType.Frequents then contextType.Frequents else contextType.None,
					mutualFriendsCount = mutualFriendsCount,
					hasIncomingFriendRequest = v.hasPendingFriendRequest
				})
			elseif id.recommendationType == recommendationType.Contact then
				table.insert(t, {
					mutualFriendsCount = 0,
					id = v.id,
					rank = v.rank,
					contextType = contextType.Contacts,
					hasIncomingFriendRequest = v.hasPendingFriendRequest,
					entityDisplayName = id.contactName,
					thumbnailEntities = {
						avatarImageUrl = id.avatarThumbnailUrl,
						headshotImageUrl = id.headshotThumbnailUrl
					}
				})
			end
		end
	end
	return t
end