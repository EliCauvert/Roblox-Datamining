local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration.ExperienceGuidelines)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local privacyType = require(parent.DataHydration.UniverseConfiguration).PrivacyType
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
local t_2 = {
	[universeActivationModule.Audience.Public] = privacyType.Public,
	[universeActivationModule.Audience.Friends] = privacyType.FriendsOnly
}
local list = {
	universeActivationModule.Audience.Public,
	universeActivationModule.Audience.Friends
}

local function getAudience(p0) --[[ line: 42 ]]
	-- upvalues: t_1 (ref), list (ref), t_2 (ref), privacyType (ref)
	if p0 == nil then
		return nil
	elseif p0.audiences == nil then
		return t_1[p0.privacyType]
	end
	for i, v in list do
		if table.find(p0.audiences, v) then
			return t_2[v]
		end
	end
	return privacyType.Private
end

local function getAudienceText(p1) --[[ line: 60 ]]
	-- upvalues: getAudience (ref), t (ref), GAME_CONFIGURATION_AUDIENCE_UNKNOWN (ref)
	if p1 == nil then
		return nil
	end
	local var10 = getAudience(p1)
	
	return if var10 == nil then GAME_CONFIGURATION_AUDIENCE_UNKNOWN else t[var10]
end

local function _(p2) --[[ line: 69 | named "getDescriptorDisplayName" ]]
	local experienceDescriptorUsages = p2 and p2.experienceDescriptorUsages
	local items = experienceDescriptorUsages and experienceDescriptorUsages.items
	local var13 = items and items[1]
	local descriptorDisplayName = var13 and var13.descriptorDisplayName
	
	return if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
end

local function getContentRatingText(p3) --[[ line: 77 ]]
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
	local var20 = items and items[1]
	local descriptorDisplayName = var20 and var20.descriptorDisplayName
	local var22 = if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
	
	return if var22 == nil then displayName else `{displayName} - {var22}`
end

return {
	AudienceTextByPrivacyType = t,
	UNKNOWN_AUDIENCE_TEXT = GAME_CONFIGURATION_AUDIENCE_UNKNOWN,
	getAudience = getAudience,
	getAudienceText = getAudienceText,
	getContentRatingText = getContentRatingText,
	getContentMaturityText = function(p4, p5, p6) --[[ line: 111 ]]
		-- upvalues: getContentRatingText (ref)
		if p6 then
			local ageRecommendationDetails = p5 and p5.ageRecommendationDetails
			local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
			local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
			local displayName = ageRecommendation and ageRecommendation.displayName
			local var27 = if displayName == nil or displayName == "" then nil else displayName
			
			if var27 == nil then
				return getContentRatingText(p4)
			end
			local ageRecommendationDetails_1 = p5 and p5.ageRecommendationDetails
			local experienceDescriptorUsages = ageRecommendationDetails_1 and ageRecommendationDetails_1.experienceDescriptorUsages
			displayName = experienceDescriptorUsages and experienceDescriptorUsages[1]
			local descriptorDisplayName = displayName and displayName.descriptorDisplayName
			local var31 = if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
			
			return if var31 == nil then var27 else `{var27} - {var31}`
		end
	end,
	getProvisionalRatingText = function(p7) --[[ line: 95 ]]
		local ageRecommendationDetails = p7 and p7.ageRecommendationDetails
		local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
		local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
		local displayName = ageRecommendation and ageRecommendation.displayName
		
		return if displayName == nil or displayName == "" then nil else displayName
	end,
	getProvisionalRatingDescriptor = function(p8) --[[ line: 103 ]]
		local ageRecommendationDetails = p8 and p8.ageRecommendationDetails
		local experienceDescriptorUsages = ageRecommendationDetails and ageRecommendationDetails.experienceDescriptorUsages
		local var38 = experienceDescriptorUsages and experienceDescriptorUsages[1]
		local descriptorDisplayName = var38 and var38.descriptorDisplayName
		
		return if descriptorDisplayName == nil or descriptorDisplayName == "" then nil else descriptorDisplayName
	end
}