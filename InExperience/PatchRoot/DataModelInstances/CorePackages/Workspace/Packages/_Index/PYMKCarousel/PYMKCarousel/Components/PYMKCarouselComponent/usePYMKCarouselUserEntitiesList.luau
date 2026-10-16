local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local EntityType = require(Parent1.UserList).Enums.EntityType
local RecommendationContextType = require(Parent.dependencies).RoduxFriends.Enums.RecommendationContextType
local _ = require(Parent.Common.DirectRecommendationTypes)

return function(p1) --[[ Line: 15 | Named "usePYMKCarouselUserEntitiesList" ]]
	-- upvalues: ReactModule (copy), DashModule (copy), RecommendationContextType (copy), EntityType (copy)
	return ReactModule.useMemo(function() --[[ Line: 16 ]]
		-- upvalues: DashModule (upval), p1 (copy), RecommendationContextType (upval), EntityType (upval)
		return DashModule.map(DashModule.filter(p1, function(p2): boolean --[[ Line: 18 ]]
			return not p2.isButtonTile and not p2.isTooltip
		end), function(p2) --[[ Line: 22 ]]
			-- upvalues: RecommendationContextType (upval), EntityType (upval)
			return {
				id = p2.id,
				type = if p2.recommendationContextType == RecommendationContextType.Contacts then EntityType.Contact else EntityType.User
			}
		end)
	end, { p1 })
end