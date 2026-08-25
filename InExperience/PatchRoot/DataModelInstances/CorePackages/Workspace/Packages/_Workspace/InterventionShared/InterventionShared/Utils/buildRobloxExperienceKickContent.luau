local abuseVectorModule = require(script:FindFirstAncestor("InterventionShared").Parent.UniversalFeatureRestrictions.AbuseVector)
local list = {
	{
		unitInSeconds = 86400,
		singularKey = "Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Suspended.Day",
		pluralKey = "Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Suspended.Days"
	},
	{
		unitInSeconds = 3600,
		singularKey = "Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Suspended.Hour",
		pluralKey = "Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Suspended.Hours"
	},
	{
		unitInSeconds = 60,
		singularKey = "Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Suspended.Minute",
		pluralKey = "Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Suspended.Minutes"
	}
}

local function parseErrorDetails(p0)
	return if p0 == nil then {
		beginTimestamp = "",
		endTimestamp = "",
		labelTranslationKey = "",
		durationSeconds = nil
	} else {
		beginTimestamp = p0.beginTimestamp or "",
		endTimestamp = p0.endTimestamp or "",
		labelTranslationKey = p0.labelTranslationKey or "",
		durationSeconds = tonumber(p0.durationSeconds)
	}
end

local function buildModerationDetail(p1, p2)
	return {
		interventionId = "",
		punishedUserId = 0,
		punishmentId = 0,
		punishmentTypeDescription = "",
		verificationCategory = "",
		consequenceTransparencyMessage = "",
		showAppealsProcessLink = false,
		isForeshadowingConsequenceEnabled = false,
		violation = nil,
		acknowledgeable = false,
		showUGCAvatarGuidelinesLink = false,
		messageToUser = p1,
		beginDate = p2.beginTimestamp,
		endDate = p2.endTimestamp,
		duration = p2.durationSeconds,
		labelTranslationKey = p2.labelTranslationKey,
		badUtterances = {},
		context = {}
	}
end

local function pickTitleAndBody(p3, p4)
	-- upvalues: list (ref)
	if p4 == nil or p4 <= 0 then
		return {
			title = p3("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Banned"),
			body = p3("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Banned")
		}
	end
	for i, v in list do
		if v.unitInSeconds <= p4 then
			local ceiled = math.ceil(p4 / v.unitInSeconds)
			
			return {
				title = p3(if ceiled == 1 then v.singularKey else v.pluralKey, { number = ceiled }),
				body = p3("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Suspended")
			}
		end
	end
	return {
		title = p3(list[3].singularKey, { number = 1 }),
		body = p3("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Suspended")
	}
end

return function(p5, p6, p7)
	-- upvalues: parseErrorDetails (ref), buildModerationDetail (ref), pickTitleAndBody (ref), abuseVectorModule (ref)
	local var6 = parseErrorDetails(p6)
	local var7 = pickTitleAndBody(p7, var6.durationSeconds)
	
	return {
		abuseVector = abuseVectorModule.RobloxExperienceKick,
		moderationDetail = buildModerationDetail(p5, var6),
		options = { titleOverride = var7.title, bodyOverride = var7.body }
	}
end