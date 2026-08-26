local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local recommendationModule = require(parent.Models.Recommendation)
local actions = parent.Actions
local recommendationCreatedModule = require(actions.RecommendationCreated)
local friendshipCreatedModule = require(actions.FriendshipCreated)
local recommendationDestroyedModule = require(actions.RecommendationDestroyed)
local _ = require(parent.roduxFriendsTypes)
local t = {}

local _ = function(p1, p2)
	-- upvalues: llamaModule (ref)
	local baseUserId = p2[p1.baseUserId]
	
	return if baseUserId then llamaModule.Dictionary.removeKey(baseUserId, p1.recommendedUserId) else nil
end

local var1 = function(p1, p2)
	-- upvalues: llamaModule (ref)
	local join = llamaModule.Dictionary.join
	local t = {}
	local userId1 = p1.userId1
	local t_1 = { baseUserId = p1.userId1, recommendedUserId = p1.userId2 }
	local baseUserId = p2[t_1.baseUserId]
	t[userId1] = if baseUserId then llamaModule.Dictionary.removeKey(baseUserId, t_1.recommendedUserId) else nil
	local userId2 = p1.userId2
	local t_2 = { baseUserId = p1.userId2, recommendedUserId = p1.userId1 }
	local baseUserId_1 = p2[t_2.baseUserId]
	t[userId2] = if baseUserId_1 then llamaModule.Dictionary.removeKey(baseUserId_1, t_2.recommendedUserId) else nil
	
	return join(p2, t)
end

local _ = function(p1, p2)
	-- upvalues: llamaModule (ref), var1 (ref)
	local var2 = p2
	llamaModule.Dictionary.map(p1.users, function(p3)
		-- upvalues: var2 (write), var1 (copy), p1 (ref)
		var2 = var1({ userId1 = p1.baseFriendId, userId2 = tostring(p3.id) }, var2)
	end)
	
	return var2
end

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), recommendationCreatedModule (ref), llamaModule (ref), recommendationModule (ref), recommendationDestroyedModule (ref), friendshipCreatedModule (ref), var1 (ref)
	local friendsNetworking = p1.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[recommendationCreatedModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy), recommendationModule (copy)
			local var2 = tostring(p3.payload.baseUserId)
			
			return llamaModule.Dictionary.join(p2, {
				[var2] = llamaModule.Dictionary.join(p2[var2] or {}, {
					[tostring(p3.payload.recommendedUser.id)] = recommendationModule.format(p3.payload.recommendedUser)
				})
			})
		end,
		[recommendationDestroyedModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			local join = llamaModule.Dictionary.join
			local t = {}
			local baseUserId = p3.payload.baseUserId
			local payload = p3.payload
			local baseUserId_1 = p2[payload.baseUserId]
			t[baseUserId] = if baseUserId_1 then llamaModule.Dictionary.removeKey(baseUserId_1, payload.recommendedUserId) else nil
			
			return join(p2, t)
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy), recommendationModule (copy)
			local var2 = tostring(p3.namedIds.users)
			
			return llamaModule.Dictionary.join(p2, {
				[var2] = llamaModule.Dictionary.join(p2[var2] or {}, llamaModule.Dictionary.map(p3.responseBody.data, function(p4, _)
					-- upvalues: recommendationModule (copy)
					local var3 = if p4.contextType == "Contacts" then p4.contactId else tostring(p4.id)
					
					return recommendationModule.format({
						id = var3,
						contactId = p4.contactId,
						mutualFriendsList = p4.mutualFriendsList,
						rank = p4.rank,
						contextType = p4.contextType,
						thumbnailEntities = p4.thumbnailEntities,
						displayName = p4.displayName
					}), var3
				end))
			})
		end,
		[friendshipCreatedModule.name] = function(p2, p3)
			-- upvalues: var1 (copy)
			return var1(p3.payload, p2)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy), var1 (copy)
			local t = {
				baseFriendId = tostring(p3.namedIds.users),
				users = p3.responseBody.data
			}
			local var2 = p2
			llamaModule.Dictionary.map(t.users, function(p4)
				-- upvalues: var2 (write), var1 (copy), t (ref)
				var2 = var1({ userId1 = t.baseFriendId, userId2 = tostring(p4.id) }, var2)
			end)
			
			return var2
		end,
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (copy)
			return var1({
				userId1 = tostring(p3.additionalData.currentUserId),
				userId2 = tostring(p3.ids[1])
			}, p2)
		end,
		[p1.networkingBlocking.BlockUserById.Succeeded.name] = function(p2, p3)
			-- upvalues: var1 (copy)
			return var1({
				userId1 = tostring(p3.additionalData.currentUserId),
				userId2 = tostring(p3.namedIds.users)
			}, p2)
		end
	})
end