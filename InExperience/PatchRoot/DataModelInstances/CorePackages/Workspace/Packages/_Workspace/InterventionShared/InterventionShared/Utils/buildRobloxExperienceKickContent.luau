local AbuseVectorModule = require(script:FindFirstAncestor("InterventionShared").Parent.UniversalFeatureRestrictions.AbuseVector)
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

local function parseErrorDetails(p1) --[[ Line: 37 ]]
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

local function buildModerationDetail(MessageToUser, p1) --[[ Line: 55 ]]
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
		messageToUser = MessageToUser,
		beginDate = p1.beginTimestamp,
		endDate = p1.endTimestamp,
		duration = p1.durationSeconds,
		labelTranslationKey = p1.labelTranslationKey,
		badUtterances = {},
		context = {}
	}
end

local function pickTitleAndBody(Callback, DurationSeconds: number) --[[ Line: 79 ]]
	-- upvalues: list (copy)
	if DurationSeconds == nil or DurationSeconds <= 0 then
		return {
			title = Callback("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogTitle.Banned"),
			body = Callback("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Banned")
		}
	end
	for _, value in list do
		if value.unitInSeconds <= DurationSeconds then
			local Ceiled = math.ceil(DurationSeconds / value.unitInSeconds)
			
			return {
				title = Callback(if Ceiled == 1 then value.singularKey else value.pluralKey, { number = Ceiled }),
				body = Callback("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Suspended")
			}
		end
	end
	return {
		title = Callback(list[3].singularKey, { number = 1 }),
		body = Callback("Feature.UniversalFeatureRestrictions.AbuseVector.RobloxKick.DialogBody.Suspended")
	}
end

return function(MessageToUser, p1, p2) --[[ Line: 119 | Named "buildRobloxExperienceKickContent" ]]
	-- upvalues: parseErrorDetails (copy), buildModerationDetail (copy), pickTitleAndBody (copy), AbuseVectorModule (copy)
	local ParseErrorDetailsResult = parseErrorDetails(p1)
	local ModerationDetail = buildModerationDetail(MessageToUser, ParseErrorDetailsResult)
	local PickTitleAndBodyResult = pickTitleAndBody(p2, ParseErrorDetailsResult.durationSeconds)
	
	return {
		abuseVector = AbuseVectorModule.RobloxExperienceKick,
		moderationDetail = ModerationDetail,
		options = {
			titleOverride = PickTitleAndBodyResult.title,
			bodyOverride = PickTitleAndBodyResult.body
		}
	}
end