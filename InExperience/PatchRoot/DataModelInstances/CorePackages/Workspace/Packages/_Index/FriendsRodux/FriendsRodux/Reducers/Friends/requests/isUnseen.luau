local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local FriendRequestCreatedModule = require(Parent.Actions.FriendRequestCreated)
local _ = require(Parent.roduxFriendsTypes)
local LlamaModule = require(Parent1.llama)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), LlamaModule (copy), FriendRequestCreatedModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3)
			-- upvalues: LlamaModule (upval)
			local t = {}
			
			for _, entry in pairs(p3.responseBody.data) do
				t[tostring(entry.id)] = entry.isUnseen
			end
			return (LlamaModule.Dictionary.join(p2, t))
		end,
		[FriendRequestCreatedModule.name] = function(p4, p5)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = true })
		end,
		[FriendsNetworking.ClearNewFriendRequests.Succeeded.name] = function(_, _)
			-- upvalues: t (upval)
			return t
		end
	})
end