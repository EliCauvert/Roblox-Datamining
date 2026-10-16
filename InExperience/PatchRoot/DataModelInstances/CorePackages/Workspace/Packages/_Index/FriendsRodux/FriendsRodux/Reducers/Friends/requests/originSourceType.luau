local Parent = script:FindFirstAncestor("FriendsRodux").Parent
local RoduxModule = require(Parent.Rodux)
local GetDeepValueModule = require(script.Parent.Parent.Parent.Parent.getDeepValue)
local LlamaModule = require(Parent.llama)
local t = {}

return function(p1) --[[ Line: 11 ]]
	-- upvalues: RoduxModule (copy), t (copy), LlamaModule (copy), GetDeepValueModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p2) --[[ Line: 15 ]]
			-- upvalues: LlamaModule (upval), GetDeepValueModule (upval)
			return (LlamaModule.Dictionary.map(p2.responseBody.data, function(p3) --[[ Line: 17 ]]
				-- upvalues: GetDeepValueModule (upval)
				return GetDeepValueModule(p3, "friendRequest.originSourceType"), (tostring(p3.id))
			end))
		end
	})
end