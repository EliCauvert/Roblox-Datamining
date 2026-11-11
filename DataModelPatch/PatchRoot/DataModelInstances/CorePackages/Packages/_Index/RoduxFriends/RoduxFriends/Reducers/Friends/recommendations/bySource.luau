local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local LlamaModule = require(Parent1.llama)
local RecommendationSourceCreatedModule = require(Parent.Actions.RecommendationSourceCreated)
local _ = require(Parent.roduxFriendsTypes)
local t = {}

return function(_)
	-- upvalues: RoduxModule (copy), t (copy), RecommendationSourceCreatedModule (copy), LlamaModule (copy)
	return RoduxModule.createReducer(t, {
		[RecommendationSourceCreatedModule.name] = function(p1, p2)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p1, {
				[p2.payload.source] = LlamaModule.List.reduce(p2.payload.recommendationIds or {}, function(p3, p4)
					p3[tostring(p4)] = true
					
					return p3
				end, {})
			})
		end
	})
end