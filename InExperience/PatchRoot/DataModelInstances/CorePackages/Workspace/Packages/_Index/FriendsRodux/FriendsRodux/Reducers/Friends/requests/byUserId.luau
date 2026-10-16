local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local Actions = Parent.Actions
local FriendRequestCreatedModule = require(Actions.FriendRequestCreated)
local FriendRequestDeclinedModule = require(Actions.FriendRequestDeclined)
local FriendshipCreatedModule = require(Actions.FriendshipCreated)
local RemoveIdsFromRequestsStoreModule = require(Parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
local _ = require(Parent.roduxFriendsTypes)
local LlamaModule = require(Parent1.llama)
local t = {}

return function(p1) --[[ Line: 19 ]]
	-- upvalues: RoduxModule (copy), t (copy), RemoveIdsFromRequestsStoreModule (copy), LlamaModule (copy), FriendRequestCreatedModule (copy), FriendRequestDeclinedModule (copy), FriendshipCreatedModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[FriendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 24 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[FriendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 29 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3) --[[ Line: 34 ]]
			-- upvalues: LlamaModule (upval)
			local t = {}
			
			for _, entry in pairs(p3.responseBody.data) do
				t[tostring(entry.id)] = true
			end
			return (LlamaModule.Dictionary.join(p2, t))
		end,
		[FriendRequestCreatedModule.name] = function(p4, p5) --[[ Line: 49 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = true })
		end,
		[FriendRequestDeclinedModule.name] = function(p4, p5) --[[ Line: 56 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p4, p5.ids)
		end,
		[FriendshipCreatedModule.name] = function(p4, p5) --[[ Line: 61 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			assert(type(p5.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p5.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return RemoveIdsFromRequestsStoreModule(p4, { p5.payload.userId1, p5.payload.userId2 })
		end,
		[FriendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 67 ]]
			return {}
		end,
		[p1.networkingBlocking.BlockUserById.Succeeded.name] = function(p4, p5) --[[ Line: 71 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p4, { (tostring(p5.namedIds.users)) })
		end
	})
end