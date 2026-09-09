local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local entityType = require(parent_1.UserList).Enums.EntityType
local recommendationContextType = dependenciesModule.RoduxFriends.Enums.RecommendationContextType
local _ = require(parent.Common.DirectRecommendationTypes)

return function(p1)
	-- upvalues: reactModule (ref), dashModule (ref), recommendationContextType (ref), entityType (ref)
	return reactModule.useMemo(function()
		-- upvalues: dashModule (copy), p1 (ref), recommendationContextType (copy), entityType (copy)
		return dashModule.map(dashModule.filter(p1, function(p2)
			return not p2.isButtonTile and not p2.isTooltip
		end), function(p2)
			-- upvalues: recommendationContextType (copy), entityType (copy)
			return {
				id = p2.id,
				type = if p2.recommendationContextType == recommendationContextType.Contacts then entityType.Contact else entityType.User
			}
		end)
	end, { p1 })
end