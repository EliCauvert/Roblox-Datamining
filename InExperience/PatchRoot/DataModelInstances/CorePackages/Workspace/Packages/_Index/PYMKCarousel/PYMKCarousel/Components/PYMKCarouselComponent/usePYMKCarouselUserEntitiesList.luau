local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local EntityType = require(Parent1.UserList).Enums.EntityType
local RecommendationContextType = require(Parent.dependencies).RoduxFriends.Enums.RecommendationContextType
local _ = require(Parent.Common.DirectRecommendationTypes)

return function(p1)
	-- upvalues: ReactModule (copy), DashModule (copy), RecommendationContextType (copy), EntityType (copy)
	return ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), p1 (copy), RecommendationContextType (upval), EntityType (upval)
		return DashModule.map(DashModule.filter(p1, function(p2): boolean
			return not p2.isButtonTile and not p2.isTooltip
		end), function(p2)
			-- upvalues: RecommendationContextType (upval), EntityType (upval)
			return {
				id = p2.id,
				type = if p2.recommendationContextType == RecommendationContextType.Contacts then EntityType.Contact else EntityType.User
			}
		end)
	end, { p1 })
end