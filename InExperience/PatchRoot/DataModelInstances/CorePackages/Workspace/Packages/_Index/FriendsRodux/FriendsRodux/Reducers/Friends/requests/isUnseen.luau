local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local friendRequestCreatedModule = require(parent.Actions.FriendRequestCreated)
local _ = require(parent.roduxFriendsTypes)
local llamaModule = require(parent_1.llama)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), friendRequestCreatedModule (ref)
	local friendsNetworking = p1.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p3.responseBody.data) do
				t[tostring(v.id)] = v.isUnseen
			end
			return llamaModule.Dictionary.join(p2, t)
		end,
		[friendRequestCreatedModule.name] = function(p4, p5)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = true })
		end,
		[friendsNetworking.ClearNewFriendRequests.Succeeded.name] = function(_, _)
			-- upvalues: t (copy)
			return t
		end
	})
end