local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local _ = require(parent.roduxFriendsTypes)
local friendRequestCreatedModule = require(parent.Actions.FriendRequestCreated)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), friendRequestCreatedModule (ref)
	return roduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p3.responseBody.data) do
				t[tostring(v.id)] = v.friendRequest.contactName
			end
			return llamaModule.Dictionary.join(p2, t)
		end,
		[friendRequestCreatedModule.name] = function(p4, p5)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = p5.contactName })
		end
	})
end