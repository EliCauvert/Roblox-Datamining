local parent = script.Parent.Parent.Parent
local react = require(parent.dependencies).React
local btnValues = require(parent.Analytics).BtnValues
local getFIntPYMKSeeAllTileLimitModule = require(parent.Flags.getFIntPYMKSeeAllTileLimit)
local _ = require(parent.Common.DirectRecommendationTypes)

return function(p1)
	-- upvalues: react (ref), btnValues (ref), getFIntPYMKSeeAllTileLimitModule (ref)
	return react.useMemo(function()
		-- upvalues: p1 (ref), btnValues (copy), getFIntPYMKSeeAllTileLimitModule (copy)
		if not p1.findFriendsTileEnabled and not p1.seeAllTileEnabled then
			return p1.recommendationIds
		end
		local cloned = table.clone(p1.recommendationIds)
		
		if p1.findFriendsTileEnabled then
			table.insert(cloned, 1, {
				isButtonTile = true,
				id = btnValues.FindFriends.rawValue()
			})
			
			if p1.recommendationCount == 0 then
				table.insert(cloned, { id = "_findFriendsTooltip", isTooltip = true })
			end
		end
		if p1.seeAllTileEnabled and getFIntPYMKSeeAllTileLimitModule() < p1.recommendationCount then
			table.insert(cloned, { isButtonTile = true, id = btnValues.SeeAll.rawValue() })
		end
		return cloned
	end, { p1.recommendationIds, p1.findFriendsTileEnabled })
end