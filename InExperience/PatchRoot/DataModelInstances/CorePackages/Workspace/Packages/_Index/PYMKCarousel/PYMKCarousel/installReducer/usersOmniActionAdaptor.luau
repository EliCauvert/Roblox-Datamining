local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local dependenciesModule = require(PYMKCarousel.dependencies)
local socialCommon = dependenciesModule.SocialCommon
local roduxUsers = dependenciesModule.RoduxUsers
local transformOmniRecommendationsToActionsModule = require(script.Parent.transformOmniRecommendationsToActions)
local _ = require(PYMKCarousel.Common.OmniTypes)
local contextualInfoTypes = socialCommon.Enums.ContextualInfoTypes

local var1 = function(p1)
	-- upvalues: contextualInfoTypes (ref), roduxUsers (ref)
	return roduxUsers.Actions.UserUpdated(if p1.contextType == contextualInfoTypes.Contacts then {
		id = p1.ContactId or tostring(p1.userId),
		username = p1.ContactName or "",
		displayName = p1.ContactName or ""
	} else {
		id = tostring(p1.userId),
		username = p1.userName,
		displayName = p1.displayName
	})
end

return function(p1)
	-- upvalues: transformOmniRecommendationsToActionsModule (ref), var1 (ref)
	return {
		AddContentMetadata = function(p2)
			return { p2 }
		end,
		AddOmniRecommendations = function(p2)
			-- upvalues: transformOmniRecommendationsToActionsModule (copy), p1 (ref), var1 (copy)
			return transformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, var1)
		end
	}
end