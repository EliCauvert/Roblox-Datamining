local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local RoduxUsers = DependenciesModule.RoduxUsers
local TransformOmniRecommendationsToActionsModule = require(script.Parent.transformOmniRecommendationsToActions)
local _ = require(PYMKCarousel.Common.OmniTypes)
local ContextualInfoTypes = DependenciesModule.SocialCommon.Enums.ContextualInfoTypes

local function v6(p1) --[[ Line: 10 ]]
	-- upvalues: ContextualInfoTypes (copy), RoduxUsers (copy)
	return RoduxUsers.Actions.UserUpdated(if p1.contextType == ContextualInfoTypes.Contacts then {
		id = p1.ContactId or tostring(p1.userId),
		username = p1.ContactName or "",
		displayName = p1.ContactName or ""
	} else {
		id = tostring(p1.userId),
		username = p1.userName,
		displayName = p1.displayName
	})
end

return function(p1) --[[ Line: 25 ]]
	-- upvalues: TransformOmniRecommendationsToActionsModule (copy), v6 (copy)
	return {
		AddContentMetadata = function(p2) --[[ Line: 27 ]]
			return { p2 }
		end,
		AddOmniRecommendations = function(p2) --[[ Line: 32 ]]
			-- upvalues: TransformOmniRecommendationsToActionsModule (upval), p1 (copy), v6 (upval)
			return TransformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, v6)
		end
	}
end