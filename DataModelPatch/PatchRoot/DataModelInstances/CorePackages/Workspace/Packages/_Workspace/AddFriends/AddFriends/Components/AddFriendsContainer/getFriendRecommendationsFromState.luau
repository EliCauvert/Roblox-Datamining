local Parent = script:FindFirstAncestor("AddFriends").Parent
local LlamaModule = require(Parent.llama)
local RecommendationSourceEnum = require(Parent.SocialCommon).Enums.RecommendationSourceEnum
local AddFriendsStateModule = require(Parent.AddFriendsState)
local AddFriendsSelectorFunction = AddFriendsStateModule.AddFriendsSelector
local RoduxFriends = AddFriendsStateModule.RoduxFriends
local RecommendationContextType = RoduxFriends.Enums.RecommendationContextType
local EntityType = require(Parent.UserList).Enums.EntityType
local FFlagAddFriendsRenderTileRefactor = require(Parent.SharedFlags).FFlagAddFriendsRenderTileRefactor

return function(p1)
	-- upvalues: RoduxFriends (copy), RecommendationSourceEnum (copy), LlamaModule (copy), AddFriendsSelectorFunction (copy), FFlagAddFriendsRenderTileRefactor (copy), RecommendationContextType (copy), EntityType (copy)
	local LocalUserId = p1.LocalUserId
	
	return (LlamaModule.List.map(RoduxFriends.Selectors.getSortedByRankRecommendationIds(p1)(LocalUserId, (RoduxFriends.Selectors.getRecommendationIdsBySource(p1)(RecommendationSourceEnum.AddFriendsPage))), function(EntityId)
		-- upvalues: LlamaModule (upval), AddFriendsSelectorFunction (upval), p1 (copy), LocalUserId (copy), FFlagAddFriendsRenderTileRefactor (upval), RecommendationContextType (upval), EntityType (upval)
		local JoinResult = LlamaModule.Dictionary.join(AddFriendsSelectorFunction(p1, "Users.byUserId.%s", EntityId), AddFriendsSelectorFunction(p1, "Friends.recommendations.byUserId.%s.%s", LocalUserId, EntityId), { isRecommendation = true })
		
		if FFlagAddFriendsRenderTileRefactor then
			local FriendsRecommendationsByUserIdSS = AddFriendsSelectorFunction(p1, "Friends.recommendations.byUserId.%s.%s", LocalUserId, EntityId)
			local IsContextTypeMatch = FriendsRecommendationsByUserIdSS.contextType == RecommendationContextType.Contacts
			
			return LlamaModule.Dictionary.join({ id = EntityId }, if IsContextTypeMatch then {
				type = EntityType.Contact,
				entityId = EntityId,
				entityDisplayName = FriendsRecommendationsByUserIdSS.entityDisplayName,
				thumbnailEntities = FriendsRecommendationsByUserIdSS.thumbnailEntities
			} else {})
		else
			return JoinResult
		end
	end))
end