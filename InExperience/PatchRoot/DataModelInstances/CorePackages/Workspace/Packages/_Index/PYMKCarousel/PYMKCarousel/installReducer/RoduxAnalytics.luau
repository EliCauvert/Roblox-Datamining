local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local dependenciesModule = require(PYMKCarousel.dependencies)
local _ = require(PYMKCarousel.Common.OmniTypes)
local transformOmniRecommendationsToActionsModule = require(script.Parent.transformOmniRecommendationsToActions)
local RECOMMENDATION_SESSION_ID_KEY = require(PYMKCarousel.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local convertActions = dependenciesModule.convertActions
local roduxAnalytics = dependenciesModule.RoduxAnalytics
local var1 = roduxAnalytics.installReducer()

local var2 = function(p1, _)
	-- upvalues: roduxAnalytics (ref), RECOMMENDATION_SESSION_ID_KEY (ref)
	local var3 = nil
	
	if p1 and p1.recommendations and (#p1.recommendations > 0 and p1.recommendations[1]) and p1.recommendations[1].contentMetadata then
		local contentMetadata = p1.recommendations[1].contentMetadata
		var3 = if contentMetadata then contentMetadata.recommendationRequestId else nil
	end
	return roduxAnalytics.Actions.SessionIdUpdated({
		sessionKey = RECOMMENDATION_SESSION_ID_KEY,
		sessionId = var3
	})
end

local _ = function(p1)
	-- upvalues: transformOmniRecommendationsToActionsModule (ref), var2 (ref)
	return {
		AddOmniRecommendations = function(p2)
			-- upvalues: transformOmniRecommendationsToActionsModule (copy), p1 (ref), var2 (copy)
			return transformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, nil, var2)
		end
	}
end

return function(p1)
	-- upvalues: convertActions (ref), var1 (ref), transformOmniRecommendationsToActionsModule (ref), var2 (ref)
	return convertActions(var1, {
		AddOmniRecommendations = function(p2)
			-- upvalues: transformOmniRecommendationsToActionsModule (copy), p1 (ref), var2 (copy)
			return transformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, nil, var2)
		end
	}, {})
end