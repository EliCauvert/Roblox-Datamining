local parent = script:FindFirstAncestor("ApolloFriends").Parent
local cryoModule = require(parent.Cryo)
local utils = require(parent.ApolloLocalState).typePolicies.utils
local createFriendInCacheModule = require(script.Parent.createFriendInCache)

return function(p1, p2)
	-- upvalues: createFriendInCacheModule (ref), cryoModule (ref), utils (ref)
	local var1 = createFriendInCacheModule(p1, {
		userId = p2.userId,
		targetUserId = p2.targetUserId,
		hasVerifiedBadge = p2.hasVerifiedBadge
	})
	p1.cache:modify({
		id = p1.cache:identify({ __typename = "AllFriendsPage" }),
		fields = {
			allFriendsByUserId = function(_, p3, _)
				-- upvalues: p2 (ref), cryoModule (copy), utils (copy), var1 (ref)
				return if p3.targetUserId == p2.targetUserId then cryoModule.Dictionary.join(p3, {
					friends = utils.mergeListsWithoutDuplicates(p3.friends, { var1 }, "__ref")
				}) else p3
			end
		}
	})
end