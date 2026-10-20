local Parent = script.Parent.Parent.Parent
local React = require(Parent.dependencies).React
local BtnValues = require(Parent.Analytics).BtnValues
local GetFIntPYMKSeeAllTileLimitModule = require(Parent.Flags.getFIntPYMKSeeAllTileLimit)
local _ = require(Parent.Common.DirectRecommendationTypes)

return function(p1)
	-- upvalues: React (copy), BtnValues (copy), GetFIntPYMKSeeAllTileLimitModule (copy)
	return React.useMemo(function()
		-- upvalues: p1 (copy), BtnValues (upval), GetFIntPYMKSeeAllTileLimitModule (upval)
		if not p1.findFriendsTileEnabled and not p1.seeAllTileEnabled then
			return p1.recommendationIds
		end
		local Copy = table.clone(p1.recommendationIds)
		
		if p1.findFriendsTileEnabled then
			table.insert(Copy, 1, {
				isButtonTile = true,
				id = BtnValues.FindFriends.rawValue()
			})
			
			if p1.recommendationCount == 0 then
				table.insert(Copy, { id = "_findFriendsTooltip", isTooltip = true })
			end
		end
		if p1.seeAllTileEnabled and GetFIntPYMKSeeAllTileLimitModule() < p1.recommendationCount then
			table.insert(Copy, { isButtonTile = true, id = BtnValues.SeeAll.rawValue() })
		end
		return Copy
	end, { p1.recommendationIds, p1.findFriendsTileEnabled })
end