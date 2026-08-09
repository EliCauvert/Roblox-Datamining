local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.DataHydration.ExperienceGuidelines)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local _ = require(parent.DataHydration.UniverseConfiguration)
local t = {
	Public = "Public",
	FriendsOnly = "Friends only",
	Private = "Private"
}
local t_1 = {
	[universeActivationModule.Audience.Public] = "Public",
	[universeActivationModule.Audience.Friends] = "Friends only"
}
local list = {
	universeActivationModule.Audience.Public,
	universeActivationModule.Audience.Friends
}

local function getAudienceTextFromAudiences(p0) --[[ line: 32 ]]
	-- upvalues: list (ref), t_1 (ref)
	for i, v in list do
		if table.find(p0, v) then
			return t_1[v]
		end
	end
	return "Private"
end

return {
	UNKNOWN_AUDIENCE_TEXT = "Unknown",
	AudienceTextByPrivacyType = t,
	getAudienceText = function(p1) --[[ line: 42 ]]
		-- upvalues: getAudienceTextFromAudiences (ref), t (ref)
		return if p1 == nil then nil elseif p1.audiences == nil then t[p1.privacyType] or "Unknown" else getAudienceTextFromAudiences(p1.audiences)
	end,
	getContentRatingText = function(p2) --[[ line: 54 ]]
		local ageRecommendationDetails = p2 and p2.ageRecommendationDetails
		local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
		local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
		
		return ageRecommendation and ageRecommendation.contentMaturity
	end
}