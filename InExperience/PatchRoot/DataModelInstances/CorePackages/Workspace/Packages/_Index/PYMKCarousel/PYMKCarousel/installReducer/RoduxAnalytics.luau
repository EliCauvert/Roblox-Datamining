local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local _ = require(PYMKCarousel.Common.OmniTypes)
local TransformOmniRecommendationsToActionsModule = require(script.Parent.transformOmniRecommendationsToActions)
local RECOMMENDATIONSESSIONIDKEY = require(PYMKCarousel.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local ConvertActionsFunction = DependenciesModule.convertActions
local RoduxAnalytics = DependenciesModule.RoduxAnalytics
local InstallReducerResult = RoduxAnalytics.installReducer()

local function v7(p1, _) --[[ Line: 12 ]]
	-- upvalues: RoduxAnalytics (copy), RECOMMENDATIONSESSIONIDKEY (copy)
	local RecommendationRequestId = nil
	
	if p1 and p1.recommendations and #p1.recommendations > 0 and p1.recommendations[1] and p1.recommendations[1].contentMetadata then
		local ContentMetadata = p1.recommendations[1].contentMetadata
		RecommendationRequestId = if ContentMetadata then ContentMetadata.recommendationRequestId else nil
	end
	return RoduxAnalytics.Actions.SessionIdUpdated({
		sessionKey = RECOMMENDATIONSESSIONIDKEY,
		sessionId = RecommendationRequestId
	})
end

local function _(p1) --[[ Line: 34 ]]
	-- upvalues: TransformOmniRecommendationsToActionsModule (copy), v7 (copy)
	return {
		AddOmniRecommendations = function(p2) --[[ Line: 36 ]]
			-- upvalues: TransformOmniRecommendationsToActionsModule (upval), p1 (copy), v7 (upval)
			return TransformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, nil, v7)
		end
	}
end

return function(p1) --[[ Line: 42 ]]
	-- upvalues: ConvertActionsFunction (copy), InstallReducerResult (copy), TransformOmniRecommendationsToActionsModule (copy), v7 (copy)
	return ConvertActionsFunction(InstallReducerResult, {
		AddOmniRecommendations = function(p2) --[[ Line: 36 ]]
			-- upvalues: TransformOmniRecommendationsToActionsModule (upval), p1 (copy), v7 (upval)
			return TransformOmniRecommendationsToActionsModule(p2.recommendations or {}, p1, nil, v7)
		end
	}, {})
end