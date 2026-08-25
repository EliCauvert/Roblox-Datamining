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

local _ = function(p0, p1)
	-- upvalues: llamaModule (ref)
	local baseUserId = p1[p0.baseUserId]
	
	return if baseUserId then llamaModule.Dictionary.removeKey(baseUserId, p0.recommendedUserId) else nil
end

local var7 = function(p2, p3)
	-- upvalues: llamaModule (ref)
	local join = llamaModule.Dictionary.join
	local t = {}
	local userId1 = p2.userId1
	local t_1 = { baseUserId = p2.userId1, recommendedUserId = p2.userId2 }
	local baseUserId = p3[t_1.baseUserId]
	t[userId1] = if baseUserId then llamaModule.Dictionary.removeKey(baseUserId, t_1.recommendedUserId) else nil
	local userId2 = p2.userId2
	local t_2 = { baseUserId = p2.userId2, recommendedUserId = p2.userId1 }
	local baseUserId_1 = p3[t_2.baseUserId]
	t[userId2] = if baseUserId_1 then llamaModule.Dictionary.removeKey(baseUserId_1, t_2.recommendedUserId) else nil
	
	return join(p3, t)
end

local _ = function(p4, p5)
	-- upvalues: llamaModule (ref), var7 (ref)
	local var11 = p5
	llamaModule.Dictionary.map(p4.users, function(p6)
		-- upvalues: var11 (write), var7 (copy), p4 (ref)
		var11 = var7({ userId1 = p4.baseFriendId, userId2 = tostring(p6.id) }, var11)
	end)
	
	return var11
end

return function(p7)
	-- upvalues: roduxModule (ref), t (ref), recommendationCreatedModule (ref), llamaModule (ref), recommendationModule (ref), recommendationDestroyedModule (ref), friendshipCreatedModule (ref), var7 (ref)
	local friendsNetworking = p7.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[recommendationCreatedModule.name] = function(p8, p9)
			-- upvalues: llamaModule (copy), recommendationModule (copy)
			local var12 = tostring(p9.payload.baseUserId)
			
			return llamaModule.Dictionary.join(p8, {
				[var12] = llamaModule.Dictionary.join(p8[var12] or {}, {
					[tostring(p9.payload.recommendedUser.id)] = recommendationModule.format(p9.payload.recommendedUser)
				})
			})
		end,
		[recommendationDestroyedModule.name] = function(p10, p11)
			-- upvalues: llamaModule (copy)
			local join = llamaModule.Dictionary.join
			local t = {}
			local baseUserId = p11.payload.baseUserId
			local payload = p11.payload
			local baseUserId_1 = p10[payload.baseUserId]
			t[baseUserId] = if baseUserId_1 then llamaModule.Dictionary.removeKey(baseUserId_1, payload.recommendedUserId) else nil
			
			return join(p10, t)
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p12, p13)
			-- upvalues: llamaModule (copy), recommendationModule (copy)
			local var14 = tostring(p13.namedIds.users)
			
			return llamaModule.Dictionary.join(p12, {
				[var14] = llamaModule.Dictionary.join(p12[var14] or {}, llamaModule.Dictionary.map(p13.responseBody.data, function(p14, _)
					-- upvalues: recommendationModule (copy)
					local var15 = if p14.contextType == "Contacts" then p14.contactId else tostring(p14.id)
					
					return recommendationModule.format({
						id = var15,
						contactId = p14.contactId,
						mutualFriendsList = p14.mutualFriendsList,
						rank = p14.rank,
						contextType = p14.contextType,
						thumbnailEntities = p14.thumbnailEntities,
						displayName = p14.displayName
					}), var15
				end))
			})
		end,
		[friendshipCreatedModule.name] = function(p15, p16)
			-- upvalues: var7 (copy)
			return var7(p16.payload, p15)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p17, p18)
			-- upvalues: llamaModule (copy), var7 (copy)
			local t = {
				baseFriendId = tostring(p18.namedIds.users),
				users = p18.responseBody.data
			}
			local var17 = p17
			llamaModule.Dictionary.map(t.users, function(p19)
				-- upvalues: var17 (write), var7 (copy), t (ref)
				var17 = var7({ userId1 = t.baseFriendId, userId2 = tostring(p19.id) }, var17)
			end)
			
			return var17
		end,
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p20, p21)
			-- upvalues: var7 (copy)
			return var7({
				userId1 = tostring(p21.additionalData.currentUserId),
				userId2 = tostring(p21.ids[1])
			}, p20)
		end,
		[p7.networkingBlocking.BlockUserById.Succeeded.name] = function(p22, p23)
			-- upvalues: var7 (copy)
			return var7({
				userId1 = tostring(p23.additionalData.currentUserId),
				userId2 = tostring(p23.namedIds.users)
			}, p22)
		end
	})
end