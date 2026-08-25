local parent = script:FindFirstAncestor("ApolloFriends").Parent
local cryoModule = require(parent.Cryo)
local utils = require(parent.ApolloLocalState).typePolicies.utils
local createFriendInCacheModule = require(script.Parent.createFriendInCache)

return function(p0, p1)
	-- upvalues: createFriendInCacheModule (ref), cryoModule (ref), utils (ref)
	local var2 = createFriendInCacheModule(p0, {
		userId = p1.userId,
		targetUserId = p1.targetUserId,
		hasVerifiedBadge = p1.hasVerifiedBadge
	})
	p0.cache:modify({
		id = p0.cache:identify({ __typename = "AllFriendsPage" }),
		fields = {
			allFriendsByUserId = function(_, p2, _)
				-- upvalues: p1 (ref), cryoModule (copy), utils (copy), var2 (ref)
				return if p2.targetUserId == p1.targetUserId then cryoModule.Dictionary.join(p2, {
					friends = utils.mergeListsWithoutDuplicates(p2.friends, { var2 }, "__ref")
				}) else p2
			end
		}
	})
end