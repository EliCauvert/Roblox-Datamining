local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.DataHydration.ExperienceGuidelines)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local _ = require(Parent.DataHydration.UniverseConfiguration)
local AudienceTextByPrivacyType = {
	Public = "Public",
	FriendsOnly = "Friends only",
	Private = "Private"
}
local config = {
	[UniverseActivationModule.Audience.Public] = "Public",
	[UniverseActivationModule.Audience.Friends] = "Friends only"
}
local list = {
	UniverseActivationModule.Audience.Public,
	UniverseActivationModule.Audience.Friends
}

local function getAudienceTextFromAudiences(List)
	-- upvalues: list (copy), config (copy)
	for _, value in list do
		if table.find(List, value) then
			return config[value]
		end
	end
	return "Private"
end

return {
	UNKNOWN_AUDIENCE_TEXT = "Unknown",
	AudienceTextByPrivacyType = AudienceTextByPrivacyType,
	getAudienceText = function(p1)
		-- upvalues: getAudienceTextFromAudiences (copy), AudienceTextByPrivacyType (copy)
		return if p1 == nil then nil elseif p1.audiences == nil then AudienceTextByPrivacyType[p1.privacyType] or "Unknown" else getAudienceTextFromAudiences(p1.audiences)
	end,
	getContentRatingText = function(p1)
		local AgeRecommendationDetails = p1 and p1.ageRecommendationDetails
		local AgeRecommendationSummary = AgeRecommendationDetails and AgeRecommendationDetails.ageRecommendationSummary
		local AgeRecommendation = AgeRecommendationSummary and AgeRecommendationSummary.ageRecommendation
		
		return AgeRecommendation and AgeRecommendation.contentMaturity
	end,
	isPrivateAudience = function(p1): boolean
		-- upvalues: getAudienceTextFromAudiences (copy), AudienceTextByPrivacyType (copy)
		return (if p1 == nil then nil elseif p1.audiences == nil then AudienceTextByPrivacyType[p1.privacyType] or "Unknown" else getAudienceTextFromAudiences(p1.audiences)) == "Private"
	end
}