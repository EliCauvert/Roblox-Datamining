local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local LlamaModule = require(Parent1.llama)
local _ = require(Parent.roduxFriendsTypes)
local t = {}

return function(p1) --[[ Line: 10 ]]
	-- upvalues: RoduxModule (copy), t (copy), LlamaModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 14 ]]
			-- upvalues: LlamaModule (upval)
			return if p3.queryArgs and p3.queryArgs.userSort then LlamaModule.Dictionary.join(p2, {
				[tostring(p3.namedIds.users)] = LlamaModule.Dictionary.map(p3.responseBody.data or {}, function(p4, p5) --[[ Line: 25 ]]
					return p5, (tostring(p4.id))
				end)
			}) else p2
		end
	})
end