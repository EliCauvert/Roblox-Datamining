local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local Parent = PYMKCarousel.Parent
local ReactModule = require(Parent.React)
local TutilsModule = require(Parent.tutils)
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local RoduxFriends = DependenciesModule.RoduxFriends
local RecommendationContextType = RoduxFriends.Enums.RecommendationContextType

return function(p1)
	-- upvalues: UseSelectorFunction (copy), RoduxFriends (copy), TutilsModule (copy), ReactModule (copy), RecommendationContextType (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: RoduxFriends (upval)
		return RoduxFriends.Selectors.selectRecommendationsForUserId(p2)((tostring(p2.LocalUserId))) or {}
	end, TutilsModule.shallowEqual)
	
	return (ReactModule.useMemo(function()
		-- upvalues: p1 (copy), RecommendationContextType (upval), UseSelectorResult (copy)
		local Contacts = {}
		
		for _, value in p1 do
			if value.recommendationContextType == RecommendationContextType.Contacts then
				local Id = value.id
				local UseSelectorResultEntry = UseSelectorResult[Id]
				
				if UseSelectorResultEntry then
					Contacts[Id] = {
						isLoading = false,
						name = UseSelectorResultEntry.entityDisplayName or "",
						avatarThumbnailUrl = UseSelectorResultEntry.thumbnailEntities and UseSelectorResultEntry.thumbnailEntities.headshotImageUrl or ""
					}
				end
			end
		end
		return { contacts = Contacts }
	end, { p1, UseSelectorResult }))
end