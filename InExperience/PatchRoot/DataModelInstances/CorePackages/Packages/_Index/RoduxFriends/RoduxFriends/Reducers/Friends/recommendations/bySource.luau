local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local recommendationSourceCreatedModule = require(parent.Actions.RecommendationSourceCreated)
local _ = require(parent.roduxFriendsTypes)
local t = {}

return function(_)
	-- upvalues: roduxModule (ref), t (ref), recommendationSourceCreatedModule (ref), llamaModule (ref)
	return roduxModule.createReducer(t, {
		[recommendationSourceCreatedModule.name] = function(p1, p2)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p1, {
				[p2.payload.source] = llamaModule.List.reduce(p2.payload.recommendationIds or {}, function(p3, p4)
					p3[tostring(p4)] = true
					
					return p3
				end, {})
			})
		end
	})
end