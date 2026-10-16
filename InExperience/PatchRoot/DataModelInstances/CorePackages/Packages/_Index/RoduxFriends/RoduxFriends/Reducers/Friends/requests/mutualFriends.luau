local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local Actions = Parent.Actions
local FriendRequestCreatedModule = require(Actions.FriendRequestCreated)
local FriendRequestDeclinedModule = require(Actions.FriendRequestDeclined)
local RemoveIdsFromRequestsStoreModule = require(Parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
local _ = require(Parent.roduxFriendsTypes)
local LlamaModule = require(Parent1.llama)
local t = {}

return function(p1) --[[ Line: 19 ]]
	-- upvalues: RoduxModule (copy), t (copy), RemoveIdsFromRequestsStoreModule (copy), LlamaModule (copy), FriendRequestCreatedModule (copy), FriendRequestDeclinedModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[FriendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 23 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[FriendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 28 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3) --[[ Line: 33 ]]
			-- upvalues: LlamaModule (upval)
			local MapResults = {}
			
			for _, entry in pairs(p3.responseBody.data) do
				if entry.mutualFriendsList then
					MapResults[tostring(entry.id)] = LlamaModule.List.map(entry.mutualFriendsList, function(p4): string --[[ Line: 40 ]]
						return (tostring(p4))
					end)
				end
			end
			return (LlamaModule.Dictionary.join(p2, MapResults))
		end,
		[FriendRequestCreatedModule.name] = function(p4, p5) --[[ Line: 49 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p4, {
				[tostring(p5.requesteeId)] = LlamaModule.List.map(p5.mutualFriends, function(p6): string --[[ Line: 54 ]]
					return (tostring(p6))
				end)
			})
		end,
		[FriendRequestDeclinedModule.name] = function(p4, p5) --[[ Line: 59 ]]
			-- upvalues: RemoveIdsFromRequestsStoreModule (upval)
			return RemoveIdsFromRequestsStoreModule(p4, p5.ids)
		end,
		[FriendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 64 ]]
			return {}
		end
	})
end