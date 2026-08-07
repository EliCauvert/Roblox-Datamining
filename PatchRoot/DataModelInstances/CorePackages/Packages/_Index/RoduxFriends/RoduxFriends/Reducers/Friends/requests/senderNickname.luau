-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local actions = parent.Actions
local friendRequestCreatedModule = require(actions.FriendRequestCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local _ = require(parent.roduxFriendsTypes)
local removeIdsFromRequestsStoreModule = require(parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
local llamaModule = require(parent_1.llama)
local t = {}

return function(p0) --[[ line: 18 ]]
	-- upvalues: roduxModule (ref), t (ref), removeIdsFromRequestsStoreModule (ref), llamaModule (ref), friendRequestCreatedModule (ref), friendRequestDeclinedModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p1, p2) --[[ line: 22 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p1, p2.ids)
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p3, p4) --[[ line: 27 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p3, p4.ids)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p5, p6) --[[ line: 35 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p6.responseBody.data) do
				t[tostring(v.id)] = v.friendRequest.senderNickname
			end
			return llamaModule.Dictionary.join(p5, t)
		end,
		[friendRequestCreatedModule.name] = function(p7, p8) --[[ line: 50 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p7, { [tostring(p8.requesteeId)] = p8.senderNickname })
		end,
		[friendRequestDeclinedModule.name] = function(p9, p10) --[[ line: 58 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p9, p10.ids)
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function() --[[ line: 63 ]]
			return {}
		end
	})
end