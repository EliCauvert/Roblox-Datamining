local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local LlamaModule = require(Parent1.llama)
local _ = require(Parent.roduxFriendsTypes)
local FriendRequestCreatedModule = require(Parent.Actions.FriendRequestCreated)
local t = {}

return function(p1) --[[ Line: 15 ]]
	-- upvalues: RoduxModule (copy), t (copy), LlamaModule (copy), FriendRequestCreatedModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3) --[[ Line: 19 ]]
			-- upvalues: LlamaModule (upval)
			local ContactNames = {}
			
			for _, entry in pairs(p3.responseBody.data) do
				ContactNames[tostring(entry.id)] = entry.friendRequest.contactName
			end
			return LlamaModule.Dictionary.join(p2, ContactNames)
		end,
		[FriendRequestCreatedModule.name] = function(p4, p5) --[[ Line: 33 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = p5.contactName })
		end
	})
end