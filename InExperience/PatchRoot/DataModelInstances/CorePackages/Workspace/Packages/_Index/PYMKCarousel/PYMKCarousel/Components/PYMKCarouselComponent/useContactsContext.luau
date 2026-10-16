local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local Parent = PYMKCarousel.Parent
local ReactModule = require(Parent.React)
local TutilsModule = require(Parent.tutils)
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local RoduxFriends = DependenciesModule.RoduxFriends
local RecommendationContextType = RoduxFriends.Enums.RecommendationContextType
local _ = require(PYMKCarousel.Common.DirectRecommendationTypes)
local FFlagLuaAppEnableSduiHomePage = require(Parent.SharedFlags).FFlagLuaAppEnableSduiHomePage

return function(p1, p2) --[[ Line: 32 | Named "useContactsContext" ]]
	-- upvalues: FFlagLuaAppEnableSduiHomePage (copy), UseSelectorFunction (copy), RoduxFriends (copy), TutilsModule (copy), ReactModule (copy), RecommendationContextType (copy)
	local P1 = nil
	P1 = if FFlagLuaAppEnableSduiHomePage then p2 or {} else UseSelectorFunction(function(p3) --[[ Line: 40 ]]
		-- upvalues: RoduxFriends (upval)
		return RoduxFriends.Selectors.selectRecommendationsForUserId(p3)((tostring(p3.LocalUserId))) or {}
	end, TutilsModule.shallowEqual)
	
	return (ReactModule.useMemo(function() --[[ Line: 46 ]]
		-- upvalues: p1 (copy), RecommendationContextType (upval), P1 (ref)
		local Contacts = {}
		
		for _, value in p1 do
			if value.recommendationContextType == RecommendationContextType.Contacts then
				local Id = value.id
				local Entry = P1[Id]
				
				if Entry then
					Contacts[Id] = {
						isLoading = false,
						name = Entry.entityDisplayName or "",
						avatarThumbnailUrl = Entry.thumbnailEntities and Entry.thumbnailEntities.headshotImageUrl or ""
					}
				end
			end
		end
		return { contacts = Contacts }
	end, { p1, P1 }))
end