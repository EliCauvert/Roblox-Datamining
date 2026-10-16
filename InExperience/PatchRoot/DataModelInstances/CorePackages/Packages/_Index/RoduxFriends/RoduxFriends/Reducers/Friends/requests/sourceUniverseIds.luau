local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local Actions = Parent.Actions
local FriendRequestCreatedModule = require(Actions.FriendRequestCreated)
local FriendRequestDeclinedModule = require(Actions.FriendRequestDeclined)
local _ = require(Parent.roduxFriendsTypes)
local RemoveIdsFromRequestsStoreModule = require(Parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
local LlamaModule = require(Parent1.llama)
local t = {}

return function(p1) --[[ Line: 18 ]]
	-- upvalues: RoduxModule (copy), t (copy), RemoveIdsFromRequestsStoreModule (copy), LlamaModule (copy), FriendRequestCreatedModule (copy), FriendRequestDeclinedModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[FriendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 22 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[FriendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 27 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3) --[[ Line: 32 ]]
			-- upvalues: LlamaModule (upval)
			local SourceUniverseIds = {}
			
			for _, entry in pairs(p3.responseBody.data) do
				SourceUniverseIds[tostring(entry.id)] = entry.friendRequest.sourceUniverseId
			end
			return (LlamaModule.Dictionary.join(p2, SourceUniverseIds))
		end,
		[FriendRequestCreatedModule.name] = function(p4, p5) --[[ Line: 44 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = p5.sourceUniverseId })
		end,
		[FriendRequestDeclinedModule.name] = function(p4, p5) --[[ Line: 52 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p4, p5.ids)
		end,
		[FriendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 57 ]]
			return {}
		end
	})
end