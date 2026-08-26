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

local function parseErrorDetails(p1)
	return if p1 == nil then {
		beginTimestamp = "",
		endTimestamp = "",
		labelTranslationKey = "",
		durationSeconds = nil
	} else {
		beginTimestamp = p1.beginTimestamp or "",
		endTimestamp = p1.endTimestamp or "",
		labelTranslationKey = p1.labelTranslationKey or "",
		durationSeconds = tonumber(p1.durationSeconds)
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

local function pickTitleAndBody(p1, p2)
	-- upvalues: list (ref)
	if p2 == nil or p2 <= 0 then
		return {
			title = p1("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Banned"),
			body = p1("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Banned")
		}
	end
	for i, v in list do
		if v.unitInSeconds <= p2 then
			local ceiled = math.ceil(p2 / v.unitInSeconds)
			
			return {
				title = p1(if ceiled == 1 then v.singularKey else v.pluralKey, { number = ceiled }),
				body = p1("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Suspended")
			}
		end
	end
	return {
		title = p1(list[3].singularKey, { number = 1 }),
		body = p1("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Suspended")
	}
end

return function(p3, p4, p5)
	-- upvalues: parseErrorDetails (ref), buildModerationDetail (ref), pickTitleAndBody (ref), abuseVectorModule (ref)
	local var1 = parseErrorDetails(p4)
	local var2 = pickTitleAndBody(p5, var1.durationSeconds)
	
	return {
		abuseVector = abuseVectorModule.RobloxExperienceKick,
		moderationDetail = buildModerationDetail(p3, var1),
		options = { titleOverride = var2.title, bodyOverride = var2.body }
	}
end