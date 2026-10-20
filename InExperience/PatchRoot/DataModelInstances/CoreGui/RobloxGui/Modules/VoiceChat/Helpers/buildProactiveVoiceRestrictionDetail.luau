local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.ModerationCommon.Types)
local _ = require(CorePackages.Workspace.Packages.VoiceChat.createVoiceRestrictionController)

return function(p1)
	local Settings = p1.settings
	local FormatFunction = p1.format
	local IsoDate = ""
	local FeatureUniversalFeatureRestrictionsGenericDialogTitleV2Nudge = nil
	local FeatureUniversalFeatureRestrictionsGenericDialogBodyNudge = nil
	local PunishmentTypeDescription = nil
	
	if Settings then
		if Settings.bannedUntil then
			local Largest = math.max(1, (math.ceil((Settings.bannedUntil.Seconds - p1.now) / 60)))
			PunishmentTypeDescription = "timeout"
			FeatureUniversalFeatureRestrictionsGenericDialogBodyNudge = FormatFunction("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Suspended")
			FeatureUniversalFeatureRestrictionsGenericDialogTitleV2Nudge = FormatFunction(if Largest == 1 then "Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Suspended.Minute" else "Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Suspended.Minutes", {
				abuseVector = FormatFunction("Feature.UniversalFeatureRestrictions.AbuseVector.LabelName.Voice"),
				number = Largest
			})
			IsoDate = DateTime.fromUnixTimestamp(Settings.bannedUntil.Seconds):ToIsoDate()
		else
			PunishmentTypeDescription = "ban"
			FeatureUniversalFeatureRestrictionsGenericDialogBodyNudge = FormatFunction("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Banned")
			FeatureUniversalFeatureRestrictionsGenericDialogTitleV2Nudge = FormatFunction("Feature.UniversalFeatureRestrictions.Generic.DialogTitle.Banned", {
				abuseVector = FormatFunction("Feature.UniversalFeatureRestrictions.AbuseVector.Lowercase.LabelName.Voice")
			})
		end
	else
		PunishmentTypeDescription = "nudge"
		FeatureUniversalFeatureRestrictionsGenericDialogBodyNudge = FormatFunction("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Nudge")
		FeatureUniversalFeatureRestrictionsGenericDialogTitleV2Nudge = FormatFunction("Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Nudge", {
			abuseVector = FormatFunction("Feature.UniversalFeatureRestrictions.AbuseVector.Lowercase.LabelName.Voice")
		})
	end
	return {
		punishmentId = 0,
		interventionId = "",
		messageToUser = "",
		acknowledgeable = false,
		beginDate = "",
		verificationCategory = "",
		consequenceTransparencyMessage = "",
		showAppealsProcessLink = false,
		isForeshadowingConsequenceEnabled = false,
		showUGCAvatarGuidelinesLink = false,
		labelTranslationKey = "",
		punishedUserId = p1.userId,
		title = FeatureUniversalFeatureRestrictionsGenericDialogTitleV2Nudge,
		body = FeatureUniversalFeatureRestrictionsGenericDialogBodyNudge,
		punishmentTypeDescription = PunishmentTypeDescription,
		endDate = IsoDate,
		badUtterances = {},
		context = {}
	}
end