local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local _ = require(parent.roduxFriendsTypes)
local t = {}

return function(p0) --[[ line: 12 ]]
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p1, p2) --[[ line: 16 ]]
			-- upvalues: llamaModule (copy)
			return if p2.queryArgs and p2.queryArgs.userSort then llamaModule.Dictionary.join(p1, {
				[tostring(p2.namedIds.users)] = llamaModule.Dictionary.map(p2.responseBody.data or {}, function(p3, p4) --[[ line: 24 ]]
					return p4, tostring(p3.id)
				end)
			}) else p1
		end
	})
end