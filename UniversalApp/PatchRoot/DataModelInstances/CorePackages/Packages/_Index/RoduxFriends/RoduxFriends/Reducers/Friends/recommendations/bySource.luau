local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local recommendationSourceCreatedModule = require(parent.Actions.RecommendationSourceCreated)
local _ = require(parent.roduxFriendsTypes)
local t = {}

return function(_) --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), t (ref), recommendationSourceCreatedModule (ref), llamaModule (ref)
	return roduxModule.createReducer(t, {
		[recommendationSourceCreatedModule.name] = function(p0, p1) --[[ line: 16 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p0, {
				[p1.payload.source] = llamaModule.List.reduce(p1.payload.recommendationIds or {}, function(p2, p3) --[[ line: 23 ]]
					p2[tostring(p3)] = true
					
					return p2
				end, {})
			})
		end
	})
end