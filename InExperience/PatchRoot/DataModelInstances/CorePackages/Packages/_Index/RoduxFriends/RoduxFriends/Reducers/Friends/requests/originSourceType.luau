local parent = script:FindFirstAncestor("RoduxFriends").Parent
local roduxModule = require(parent.Rodux)
local getDeepValueModule = require(script.Parent.Parent.Parent.Parent.getDeepValue)
local llamaModule = require(parent.llama)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), getDeepValueModule (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p1)
			-- upvalues: llamaModule (copy), getDeepValueModule (copy)
			return llamaModule.Dictionary.map(p1.responseBody.data, function(p2)
				-- upvalues: getDeepValueModule (copy)
				return getDeepValueModule(p2, "friendRequest.originSourceType"), tostring(p2.id)
			end)
		end
	})
end