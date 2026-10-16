local Parent = script:FindFirstAncestor("ApolloFriends").Parent
local CryoModule = require(Parent.Cryo)
local Utils = require(Parent.ApolloLocalState).typePolicies.utils
local CreateFriendInCacheModule = require(script.Parent.createFriendInCache)

return function(p1, p2) --[[ Line: 16 | Named "addFriendToFriendsByUserIdCache" ]]
	-- upvalues: CreateFriendInCacheModule (copy), CryoModule (copy), Utils (copy)
	local FriendInCacheModule = CreateFriendInCacheModule(p1, {
		userId = p2.userId,
		targetUserId = p2.targetUserId,
		hasVerifiedBadge = p2.hasVerifiedBadge
	})
	p1.cache:modify({
		id = p1.cache:identify({ __typename = "AllFriendsPage" }),
		fields = {
			allFriendsByUserId = function(_, p3, _) --[[ Line: 28 ]]
				-- upvalues: p2 (copy), CryoModule (upval), Utils (upval), FriendInCacheModule (copy)
				return if p3.targetUserId == p2.targetUserId then CryoModule.Dictionary.join(p3, {
					friends = Utils.mergeListsWithoutDuplicates(p3.friends, { FriendInCacheModule }, "__ref")
				}) else p3
			end
		}
	})
end