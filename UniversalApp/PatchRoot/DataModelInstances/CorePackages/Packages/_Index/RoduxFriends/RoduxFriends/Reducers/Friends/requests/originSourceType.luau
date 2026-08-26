local parent = script:FindFirstAncestor("RoduxFriends").Parent
local roduxModule = require(parent.Rodux)
local getDeepValueModule = require(script.Parent.Parent.Parent.Parent.getDeepValue)
local llamaModule = require(parent.llama)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), getDeepValueModule (ref)
	return roduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p2)
			-- upvalues: llamaModule (copy), getDeepValueModule (copy)
			return llamaModule.Dictionary.map(p2.responseBody.data, function(p3)
				-- upvalues: getDeepValueModule (copy)
				return getDeepValueModule(p3, "friendRequest.originSourceType"), tostring(p3.id)
			end)
		end
	})
end