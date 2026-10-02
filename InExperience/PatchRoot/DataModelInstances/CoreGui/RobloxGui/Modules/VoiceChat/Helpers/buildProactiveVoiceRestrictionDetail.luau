local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Workspace.Packages.ModerationCommon.Types)
local _ = require(corePackagesService.Workspace.Packages.VoiceChat.createVoiceRestrictionController)

return function(p1)
	local var1, var2, var3
	local settings = p1.settings
	local format = p1.format
	local _ = nil
	local _ = nil
	local var4 = ""
	local _ = ""
	
	if not settings then
		var1 = "nudge"
		var2 = format("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Nudge")
		var3 = format("Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Nudge", {
			abuseVector = format("Feature.UniversalFeatureRestrictions.AbuseVector.Lowercase.LabelName.Voice")
		})
	elseif settings.bannedUntil then
		local maxValue = math.max(1, math.ceil((settings.bannedUntil.Seconds - p1.now) / 60))
		var1 = "timeout"
		var2 = format("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Suspended")
		var3 = format(if maxValue == 1 then "Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Suspended.Minute" else "Feature.UniversalFeatureRestrictions.Generic.DialogTitleV2.Suspended.Minutes", {
			abuseVector = format("Feature.UniversalFeatureRestrictions.AbuseVector.LabelName.Voice"),
			number = maxValue
		})
		var4 = DateTime.fromUnixTimestamp(settings.bannedUntil.Seconds):ToIsoDate()
	else
		var1 = "ban"
		var2 = format("Feature.UniversalFeatureRestrictions.Generic.DialogBody.Banned")
		var3 = format("Feature.UniversalFeatureRestrictions.Generic.DialogTitle.Banned", {
			abuseVector = format("Feature.UniversalFeatureRestrictions.AbuseVector.Lowercase.LabelName.Voice")
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
		title = var3,
		body = var2,
		punishmentTypeDescription = var1,
		endDate = var4,
		badUtterances = {},
		context = {}
	}
end