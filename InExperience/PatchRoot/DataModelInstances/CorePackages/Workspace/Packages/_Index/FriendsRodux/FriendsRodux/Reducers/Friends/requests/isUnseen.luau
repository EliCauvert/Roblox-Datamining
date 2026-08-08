local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local friendRequestCreatedModule = require(parent.Actions.FriendRequestCreated)
local _ = require(parent.roduxFriendsTypes)
local llamaModule = require(parent_1.llama)
local t = {}

return function(p0) --[[ line: 15 ]]
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), friendRequestCreatedModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p1, p2) --[[ line: 19 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p2.responseBody.data) do
				t[tostring(v.id)] = v.isUnseen
			end
			return llamaModule.Dictionary.join(p1, t)
		end,
		[friendRequestCreatedModule.name] = function(p3, p4) --[[ line: 34 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p3, { [tostring(p4.requesteeId)] = true })
		end,
		[friendsNetworking.ClearNewFriendRequests.Succeeded.name] = function(_, _) --[[ line: 41 ]]
			-- upvalues: t (copy)
			return t
		end
	})
end