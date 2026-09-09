local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local dependenciesModule = require(PYMKCarousel.dependencies)
local parent = PYMKCarousel.Parent
local reactModule = require(parent.React)
local tutilsModule = require(parent.tutils)
local useSelector = dependenciesModule.Hooks.useSelector
local roduxFriends = dependenciesModule.RoduxFriends
local recommendationContextType = roduxFriends.Enums.RecommendationContextType
local _ = require(PYMKCarousel.Common.DirectRecommendationTypes)
local fFlagLuaAppEnableSduiHomePage = require(parent.SharedFlags).FFlagLuaAppEnableSduiHomePage

return function(p1, p2)
	-- upvalues: fFlagLuaAppEnableSduiHomePage (ref), useSelector (ref), roduxFriends (ref), tutilsModule (ref), reactModule (ref), recommendationContextType (ref)
	local _ = nil
	local var1 = if fFlagLuaAppEnableSduiHomePage then p2 or {} else useSelector(function(p3)
		-- upvalues: roduxFriends (copy)
		return roduxFriends.Selectors.selectRecommendationsForUserId(p3)(tostring(p3.LocalUserId)) or {}
	end, tutilsModule.shallowEqual)
	
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), recommendationContextType (copy), var1 (write)
		local t = {}
		
		for i, v in p1 do
			if v.recommendationContextType == recommendationContextType.Contacts then
				local id = v.id
				local var2 = var1[id]
				
				if var2 then
					t[id] = {
						isLoading = false,
						name = var2.entityDisplayName or "",
						avatarThumbnailUrl = if var2.thumbnailEntities then var2.thumbnailEntities.headshotImageUrl or "" else ""
					}
				end
			end
		end
		return { contacts = t }
	end, { p1, var1 })
end