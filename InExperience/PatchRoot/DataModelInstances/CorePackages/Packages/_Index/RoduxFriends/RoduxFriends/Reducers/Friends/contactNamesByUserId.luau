local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local _ = require(parent.roduxFriendsTypes)
local friendRequestCreatedModule = require(parent.Actions.FriendRequestCreated)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), friendRequestCreatedModule (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p1, p2)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p2.responseBody.data) do
				t[tostring(v.id)] = v.friendRequest.contactName
			end
			return llamaModule.Dictionary.join(p1, t)
		end,
		[friendRequestCreatedModule.name] = function(p3, p4)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p3, { [tostring(p4.requesteeId)] = p4.contactName })
		end
	})
end