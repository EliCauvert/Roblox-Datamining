local Parent = script:FindFirstAncestor("RoduxFriends").Parent
local RoduxModule = require(Parent.Rodux)
local GetDeepValueModule = require(script.Parent.Parent.Parent.Parent.getDeepValue)
local LlamaModule = require(Parent.llama)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), LlamaModule (copy), GetDeepValueModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p2)
			-- upvalues: LlamaModule (upval), GetDeepValueModule (upval)
			return (LlamaModule.Dictionary.map(p2.responseBody.data, function(p3)
				-- upvalues: GetDeepValueModule (upval)
				return GetDeepValueModule(p3, "friendRequest.originSourceType"), (tostring(p3.id))
			end))
		end
	})
end