local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local _ = require(parent.roduxFriendsTypes)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref)
	return roduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			return if p3.queryArgs and p3.queryArgs.userSort then llamaModule.Dictionary.join(p2, {
				[tostring(p3.namedIds.users)] = llamaModule.Dictionary.map(p3.responseBody.data or {}, function(p4, p5)
					return p5, tostring(p4.id)
				end)
			}) else p2
		end
	})
end