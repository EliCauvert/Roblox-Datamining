local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration.ExperienceGuidelines)
local _ = require(parent.DataHydration.UniverseActivation)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local privacyType = universeConfigurationModule.PrivacyType
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

local function getAudience(p0) --[[ line: 36 ]]
	-- upvalues: t_1 (ref), universeConfigurationModule (ref)
	if p0 == nil then
		return nil
	elseif p0.audiences ~= nil then
		return universeConfigurationModule.getPrivacyTypeForAudiences(p0.audiences)
	end
	local privacyType = p0.privacyType
	
	return if privacyType == nil then nil else t_1[privacyType]
end

local function getAudienceText(p1) --[[ line: 51 ]]
	-- upvalues: t_1 (ref), universeConfigurationModule (ref), t (ref), GAME_CONFIGURATION_AUDIENCE_UNKNOWN (ref)
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
	return if privacyTypeForAudiences == nil then GAME_CONFIGURATION_AUDIENCE_UNKNOWN else t[privacyTypeForAudiences]
end

local function _(p2) --[[ line: 60 | named "getDescriptorDisplayName" ]]
	local experienceDescriptorUsages = p2 and p2.experienceDescriptorUsages
	local items = experienceDescriptorUsages and experienceDescriptorUsages.items
	local var11 = items and items[1]
	local descriptorDisplayName = var11 and var11.descriptorDisplayName
	
	return if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
end

local function getContentRatingText(p3) --[[ line: 68 ]]
	local ageRecommendationDetails = p3 and p3.ageRecommendationDetails
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
	local var18 = items and items[1]
	local descriptorDisplayName = var18 and var18.descriptorDisplayName
	local var20 = if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
	
	return if var20 == nil then displayName else `{displayName} - {var20}`
end

return {
	AudienceTextByPrivacyType = t,
	UNKNOWN_AUDIENCE_TEXT = GAME_CONFIGURATION_AUDIENCE_UNKNOWN,
	getAudience = getAudience,
	getAudienceText = getAudienceText,
	getContentRatingText = getContentRatingText,
	getContentMaturityText = function(p4, p5, p6) --[[ line: 102 ]]
		-- upvalues: getContentRatingText (ref)
		if p6 then
			local ageRecommendationDetails = p5 and p5.ageRecommendationDetails
			local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
			local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
			local displayName = ageRecommendation and ageRecommendation.displayName
			local var25 = if displayName == nil or displayName == "" then nil else displayName
			
			if var25 == nil then
				return getContentRatingText(p4)
			end
			local ageRecommendationDetails_1 = p5 and p5.ageRecommendationDetails
			local experienceDescriptorUsages = ageRecommendationDetails_1 and ageRecommendationDetails_1.experienceDescriptorUsages
			displayName = experienceDescriptorUsages and experienceDescriptorUsages[1]
			local descriptorDisplayName = displayName and displayName.descriptorDisplayName
			local var29 = if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
			
			return if var29 == nil then var25 else `{var25} - {var29}`
		end
	end,
	getProvisionalRatingText = function(p7) --[[ line: 86 ]]
		local ageRecommendationDetails = p7 and p7.ageRecommendationDetails
		local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
		local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
		local displayName = ageRecommendation and ageRecommendation.displayName
		
		return if displayName == nil or displayName == "" then nil else displayName
	end,
	getProvisionalRatingDescriptor = function(p8) --[[ line: 94 ]]
		local ageRecommendationDetails = p8 and p8.ageRecommendationDetails
		local experienceDescriptorUsages = ageRecommendationDetails and ageRecommendationDetails.experienceDescriptorUsages
		local var36 = experienceDescriptorUsages and experienceDescriptorUsages[1]
		local descriptorDisplayName = var36 and var36.descriptorDisplayName
		
		return if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
	end
}