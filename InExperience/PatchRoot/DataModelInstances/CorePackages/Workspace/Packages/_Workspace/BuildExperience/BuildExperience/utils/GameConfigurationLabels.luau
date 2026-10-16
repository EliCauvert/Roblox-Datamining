local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration.ExperienceGuidelines)
local _ = require(Parent.DataHydration.UniverseActivation)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local PrivacyType = UniverseConfigurationModule.PrivacyType
local AudienceTextByPrivacyType = {
	[PrivacyType.Public] = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC,
	[PrivacyType.FriendsOnly] = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY,
	[PrivacyType.Private] = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
}
local config = {
	[PrivacyType.Public] = PrivacyType.Public,
	[PrivacyType.FriendsOnly] = PrivacyType.FriendsOnly,
	[PrivacyType.Private] = PrivacyType.Private
}

local function _(p1) --[[ Line: 60 | Named "getDescriptorDisplayName" ]]
	local ExperienceDescriptorUsages = p1 and p1.experienceDescriptorUsages
	local Items = ExperienceDescriptorUsages and ExperienceDescriptorUsages.items
	local Item = Items and Items[1]
	local DescriptorDisplayName = Item and Item.descriptorDisplayName
	
	return if DescriptorDisplayName == nil or DescriptorDisplayName == "" then nil else DescriptorDisplayName
end

local function getContentRatingText(p1) --[[ Line: 68 ]]
	local AgeRecommendationDetails = p1 and p1.ageRecommendationDetails
	local AgeRecommendationSummary = AgeRecommendationDetails and AgeRecommendationDetails.ageRecommendationSummary
	local AgeRecommendation = AgeRecommendationSummary and AgeRecommendationSummary.ageRecommendation
	
	if AgeRecommendation == nil then
		return nil
	end
	local DisplayName = AgeRecommendation.displayName
	
	if DisplayName == nil or DisplayName == "" then
		DisplayName = AgeRecommendation.contentMaturity
	end
	if DisplayName == nil or DisplayName == "" then
		return DisplayName
	else
		local ExperienceDescriptorUsages = AgeRecommendationDetails and AgeRecommendationDetails.experienceDescriptorUsages
		local Items = ExperienceDescriptorUsages and ExperienceDescriptorUsages.items
		local Item = Items and Items[1]
		local DescriptorDisplayName = Item and Item.descriptorDisplayName
		local DescriptorDisplayName1 = if DescriptorDisplayName == nil or DescriptorDisplayName == "" then nil else DescriptorDisplayName
		
		return if DescriptorDisplayName1 == nil then DisplayName else `{DisplayName} - {DescriptorDisplayName1}`
	end
end

return {
	AudienceTextByPrivacyType = AudienceTextByPrivacyType,
	UNKNOWN_AUDIENCE_TEXT = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_UNKNOWN,
	getAudience = function(p1) --[[ Line: 36 ]]
		-- upvalues: config (copy), UniverseConfigurationModule (copy)
		if p1 == nil then
			return nil
		elseif p1.audiences == nil then
			local PrivacyType = p1.privacyType
			
			return if PrivacyType == nil then nil else config[PrivacyType]
		else
			return UniverseConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
		end
	end,
	getAudienceText = function(p1) --[[ Line: 51 ]]
		-- upvalues: config (copy), UniverseConfigurationModule (copy), AudienceTextByPrivacyType (copy)
		if p1 == nil then
			return nil
		end
		local PrivacyTypeForAudiences = nil
		if p1 == nil then
			PrivacyTypeForAudiences = nil
		elseif p1.audiences == nil then
			local PrivacyType = p1.privacyType
			PrivacyTypeForAudiences = if PrivacyType == nil then nil else config[PrivacyType]
		else
			PrivacyTypeForAudiences = UniverseConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
		end
		return if PrivacyTypeForAudiences == nil then nil else AudienceTextByPrivacyType[PrivacyTypeForAudiences]
	end,
	getContentRatingText = getContentRatingText,
	getContentMaturityText = function(p1, p2, p3) --[[ Line: 102 ]]
		-- upvalues: getContentRatingText (copy)
		if p3 then
			local AgeRecommendationDetails = p2 and p2.ageRecommendationDetails
			local AgeRecommendationSummary = AgeRecommendationDetails and AgeRecommendationDetails.ageRecommendationSummary
			local AgeRecommendation = AgeRecommendationSummary and AgeRecommendationSummary.ageRecommendation
			local DisplayName = AgeRecommendation and AgeRecommendation.displayName
			local DisplayName1 = if DisplayName == nil or DisplayName == "" then nil else DisplayName
			
			if DisplayName1 ~= nil then
				local AgeRecommendationDetails1 = p2 and p2.ageRecommendationDetails
				local ExperienceDescriptorUsages = AgeRecommendationDetails1 and AgeRecommendationDetails1.experienceDescriptorUsages
				local ExperienceDescriptorUsage = ExperienceDescriptorUsages and ExperienceDescriptorUsages[1]
				local DescriptorDisplayName = ExperienceDescriptorUsage and ExperienceDescriptorUsage.descriptorDisplayName
				local DescriptorDisplayName1 = if DescriptorDisplayName == nil or DescriptorDisplayName == "" then nil else DescriptorDisplayName
				
				return if DescriptorDisplayName1 == nil then DisplayName1 else `{DisplayName1} - {DescriptorDisplayName1}`
			end
		end
		return (getContentRatingText(p1))
	end,
	getProvisionalRatingText = function(p1) --[[ Line: 86 ]]
		local AgeRecommendationDetails = p1 and p1.ageRecommendationDetails
		local AgeRecommendationSummary = AgeRecommendationDetails and AgeRecommendationDetails.ageRecommendationSummary
		local AgeRecommendation = AgeRecommendationSummary and AgeRecommendationSummary.ageRecommendation
		local DisplayName = AgeRecommendation and AgeRecommendation.displayName
		
		return if DisplayName == nil or DisplayName == "" then nil else DisplayName
	end,
	getProvisionalRatingDescriptor = function(p1) --[[ Line: 94 ]]
		local AgeRecommendationDetails = p1 and p1.ageRecommendationDetails
		local ExperienceDescriptorUsages = AgeRecommendationDetails and AgeRecommendationDetails.experienceDescriptorUsages
		local ExperienceDescriptorUsage = ExperienceDescriptorUsages and ExperienceDescriptorUsages[1]
		local DescriptorDisplayName = ExperienceDescriptorUsage and ExperienceDescriptorUsage.descriptorDisplayName
		
		return if DescriptorDisplayName == nil or DescriptorDisplayName == "" then nil else DescriptorDisplayName
	end
}