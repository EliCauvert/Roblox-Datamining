local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration.ExperienceGuidelines)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.DataHydration.UniverseActivation)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local privacyType = universeConfigurationModule.PrivacyType
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local GAME_CONFIGURATION_AUDIENCE_UNKNOWN = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_UNKNOWN
local t = {
	[privacyType.Public] = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC,
	[privacyType.FriendsOnly] = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY,
	[privacyType.Private] = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
}
local t_1 = {
	[privacyType.Public] = privacyType.Public,
	[privacyType.FriendsOnly] = privacyType.FriendsOnly,
	[privacyType.Private] = privacyType.Private
}

local function getAudience(p1)
	-- upvalues: t_1 (ref), universeConfigurationModule (ref)
	if p1 == nil then
		return nil
	elseif p1.audiences ~= nil then
		return universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
	end
	local privacyType = p1.privacyType
	
	return if privacyType == nil then nil else t_1[privacyType]
end

local function getAudienceText(p1)
	-- upvalues: t_1 (ref), universeConfigurationModule (ref), fFlagBuildLocalization (ref), t (ref), GAME_CONFIGURATION_AUDIENCE_UNKNOWN (ref)
	local privacyTypeForAudiences
	if p1 == nil then
		return nil
	elseif p1 == nil then
		privacyTypeForAudiences = nil
	elseif p1.audiences == nil then
		local privacyType = p1.privacyType
		privacyTypeForAudiences = if privacyType ~= nil then nil else t_1[privacyType]
	else
		privacyTypeForAudiences = universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
	end
	return if fFlagBuildLocalization then if privacyTypeForAudiences == nil then nil else t[privacyTypeForAudiences] elseif privacyTypeForAudiences == nil then GAME_CONFIGURATION_AUDIENCE_UNKNOWN else t[privacyTypeForAudiences]
end

local function _(p1)
	local experienceDescriptorUsages = p1 and p1.experienceDescriptorUsages
	local items = experienceDescriptorUsages and experienceDescriptorUsages.items
	local var1 = items and items[1]
	local descriptorDisplayName = var1 and var1.descriptorDisplayName
	
	return if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
end

local function getContentRatingText(p1)
	local ageRecommendationDetails = p1 and p1.ageRecommendationDetails
	local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
	local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
	
	if ageRecommendation == nil then
		return nil
	end
	local displayName = ageRecommendation.displayName
	
	if displayName == nil or displayName == "" then
		displayName = ageRecommendation.contentMaturity
	end
	if displayName == nil or displayName == "" then
		return displayName
	end
	local experienceDescriptorUsages = ageRecommendationDetails and ageRecommendationDetails.experienceDescriptorUsages
	local items = experienceDescriptorUsages and experienceDescriptorUsages.items
	local var1 = items and items[1]
	local descriptorDisplayName = var1 and var1.descriptorDisplayName
	local var2 = if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
	
	return if var2 == nil then displayName else `{displayName} - {var2}`
end

return {
	AudienceTextByPrivacyType = t,
	UNKNOWN_AUDIENCE_TEXT = GAME_CONFIGURATION_AUDIENCE_UNKNOWN,
	getAudience = getAudience,
	getAudienceText = getAudienceText,
	getContentRatingText = getContentRatingText,
	getContentMaturityText = function(p1, p2, p3)
		-- upvalues: getContentRatingText (ref)
		if p3 then
			local ageRecommendationDetails = p2 and p2.ageRecommendationDetails
			local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
			local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
			local displayName = ageRecommendation and ageRecommendation.displayName
			local var1 = if displayName == nil or displayName == "" then nil else displayName
			
			if var1 == nil then
				return getContentRatingText(p1)
			end
			local ageRecommendationDetails_1 = p2 and p2.ageRecommendationDetails
			local experienceDescriptorUsages = ageRecommendationDetails_1 and ageRecommendationDetails_1.experienceDescriptorUsages
			displayName = experienceDescriptorUsages and experienceDescriptorUsages[1]
			local descriptorDisplayName = displayName and displayName.descriptorDisplayName
			local var2 = if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
			
			return if var2 == nil then var1 else `{var1} - {var2}`
		end
	end,
	getProvisionalRatingText = function(p1)
		local ageRecommendationDetails = p1 and p1.ageRecommendationDetails
		local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
		local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
		local displayName = ageRecommendation and ageRecommendation.displayName
		
		return if displayName == nil or displayName == "" then nil else displayName
	end,
	getProvisionalRatingDescriptor = function(p1)
		local ageRecommendationDetails = p1 and p1.ageRecommendationDetails
		local experienceDescriptorUsages = ageRecommendationDetails and ageRecommendationDetails.experienceDescriptorUsages
		local var1 = experienceDescriptorUsages and experienceDescriptorUsages[1]
		local descriptorDisplayName = var1 and var1.descriptorDisplayName
		
		return if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
	end
}