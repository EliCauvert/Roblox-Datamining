local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local ResultModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result)
local FFlagEnableDeactivatedUserReactivation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableDeactivatedUserReactivation
local GetFFlagEnablePlatformEvidenceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnablePlatformEvidence
local ModerationDetailModule = {
	new = function()
		return {}
	end
}

if GetFFlagEnablePlatformEvidenceFunction() then
	ModerationDetailModule.validateJson = TModule.interface({
		punishedUserId = TModule.number,
		messageToUser = TModule.string,
		punishmentTypeDescription = TModule.string,
		punishmentId = TModule.number,
		beginDate = TModule.string,
		endDate = TModule.string,
		badUtterances = TModule.table,
		verificationCategory = TModule.string,
		interventionId = TModule.string,
		isForeshadowingConsequenceEnabled = TModule.optional(TModule.boolean),
		agreedCheckBoxExperimentVariant = TModule.optional(TModule.string),
		context = TModule.optional(TModule.table),
		violation = TModule.optional(TModule.table),
		showUGCAvatarGuidelinesLink = TModule.optional(TModule.boolean)
	})
else
	ModerationDetailModule.validateJson = TModule.interface({
		punishedUserId = TModule.number,
		messageToUser = TModule.string,
		punishmentTypeDescription = TModule.string,
		punishmentId = TModule.number,
		beginDate = TModule.string,
		endDate = TModule.string,
		badUtterances = TModule.table,
		verificationCategory = TModule.string,
		interventionId = TModule.string,
		isForeshadowingConsequenceEnabled = TModule.optional(TModule.boolean),
		agreedCheckBoxExperimentVariant = TModule.optional(TModule.string),
		context = TModule.optional(TModule.table),
		showUGCAvatarGuidelinesLink = TModule.optional(TModule.boolean)
	})
end
if GetFFlagEnablePlatformEvidenceFunction() then
	ModerationDetailModule.validateModel = TModule.interface({
		punishedUserId = TModule.number,
		messageToUser = TModule.string,
		punishmentTypeDescription = TModule.string,
		punishmentId = TModule.number,
		beginDate = TModule.string,
		endDate = TModule.string,
		badUtterances = TModule.table,
		verificationCategory = TModule.string,
		interventionId = TModule.string,
		showAppealsProcessLink = TModule.boolean,
		consequenceTransparencyMessage = TModule.string,
		agreedCheckBoxExperimentVariant = TModule.optional(TModule.string),
		selfServiceDeactivated = TModule.optional(TModule.boolean),
		isForeshadowingConsequenceEnabled = TModule.optional(TModule.boolean),
		nextConsequenceType = TModule.optional(TModule.string),
		nextConsequenceDuration = TModule.optional(TModule.number),
		isAltInformed = TModule.optional(TModule.boolean),
		showUGCAvatarGuidelinesLink = TModule.optional(TModule.boolean),
		violation = TModule.optional(TModule.interface({
			evidence = TModule.optional(TModule.interface({
				type = TModule.string,
				elements = TModule.optional(TModule.table),
				elementsObj = TModule.optional(TModule.map(TModule.string, TModule.any)),
				displayMeta = TModule.optional(TModule.interface({
					lowercaseKey = TModule.string,
					capitalizedKey = TModule.string,
					icon = TModule.string
				}))
			})),
			abuseTypeTranslationKeys = TModule.table,
			uid = TModule.string
		}))
	})
else
	ModerationDetailModule.validateModel = TModule.interface({
		punishedUserId = TModule.number,
		messageToUser = TModule.string,
		punishmentTypeDescription = TModule.string,
		punishmentId = TModule.number,
		beginDate = TModule.string,
		endDate = TModule.string,
		badUtterances = TModule.table,
		verificationCategory = TModule.string,
		interventionId = TModule.string,
		showAppealsProcessLink = TModule.boolean,
		consequenceTransparencyMessage = TModule.string,
		agreedCheckBoxExperimentVariant = TModule.optional(TModule.string),
		selfServiceDeactivated = TModule.optional(TModule.boolean),
		isForeshadowingConsequenceEnabled = TModule.optional(TModule.boolean),
		nextConsequenceType = TModule.optional(TModule.string),
		nextConsequenceDuration = TModule.optional(TModule.number),
		isAltInformed = TModule.optional(TModule.boolean),
		showUGCAvatarGuidelinesLink = TModule.optional(TModule.boolean)
	})
end
function ModerationDetailModule.mock(p1)
	-- upvalues: ModerationDetailModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	local NewModerationDetail = ModerationDetailModule.new()
	NewModerationDetail.punishedUserId = 1137965296
	NewModerationDetail.messageToUser = "Mock Message"
	NewModerationDetail.punishmentTypeDescription = "Warn"
	NewModerationDetail.punishmentId = 2148187493
	NewModerationDetail.beginDate = "2021-03-10T20:14:00.0000000Z"
	NewModerationDetail.endDate = "2021-03-10T20:22:00.0000000Z"
	NewModerationDetail.badUtterances = {
		{
			labelTranslationKey = "Label.AbuseType.Harassment",
			utteranceText = "fvg behavior",
			imageUrl = ""
		}
	}
	NewModerationDetail.verificationCategory = "Email"
	NewModerationDetail.interventionId = "aaaa1aa1-aaa1-111a-aa11-aa1aaaa1aa11"
	NewModerationDetail.agreedCheckBoxExperimentVariant = "control"
	NewModerationDetail.isForeshadowingConsequenceEnabled = false
	NewModerationDetail.nextConsequenceType = "BAN"
	NewModerationDetail.nextConsequenceDuration = 1
	
	return CryoModule.Dictionary.join(NewModerationDetail, P0)
end

function ModerationDetailModule.fromJsonData(p1)
	-- upvalues: ModerationDetailModule (copy), ResultModule (copy), GetFFlagEnablePlatformEvidenceFunction (copy), FFlagEnableDeactivatedUserReactivation (copy)
	if not ModerationDetailModule.validateJson(p1) then
		return ResultModule.error("ModerationDetail.fromJsonData expects a valid moderation JSON response")
	end
	local NewModerationDetail = ModerationDetailModule.new()
	NewModerationDetail.punishedUserId = p1.punishedUserId
	NewModerationDetail.messageToUser = p1.messageToUser
	NewModerationDetail.punishmentTypeDescription = p1.punishmentTypeDescription
	NewModerationDetail.punishmentId = p1.punishmentId
	NewModerationDetail.beginDate = p1.beginDate
	NewModerationDetail.endDate = p1.endDate
	NewModerationDetail.badUtterances = {}
	NewModerationDetail.verificationCategory = p1.verificationCategory
	NewModerationDetail.interventionId = p1.interventionId
	NewModerationDetail.consequenceTransparencyMessage = p1.consequenceTransparencyMessage
	NewModerationDetail.showAppealsProcessLink = p1.showAppealsProcessLink
	NewModerationDetail.agreedCheckBoxExperimentVariant = p1.agreedCheckBoxExperimentVariant
	NewModerationDetail.isForeshadowingConsequenceEnabled = p1.isForeshadowingConsequenceEnabled
	NewModerationDetail.showUGCAvatarGuidelinesLink = p1.showUGCAvatarGuidelinesLink
	
	for i, badUtterance in pairs(p1.badUtterances) do
		table.insert(NewModerationDetail.badUtterances, {
			labelTranslationKey = badUtterance.labelTranslationKey,
			utteranceText = badUtterance.utteranceText,
			imageUrl = badUtterance.imageUrl
		})
	end
	if GetFFlagEnablePlatformEvidenceFunction() and p1.violation then
		local Violation = {}
		
		if p1.violation.evidence then
			Violation.evidence = {
				type = p1.violation.evidence.type,
				elements = p1.violation.evidence.elements,
				elementsObj = p1.violation.evidence.elementsObj,
				displayMeta = p1.violation.evidence.displayMeta
			}
		end
		Violation.abuseTypeTranslationKeys = p1.violation.abuseTypeTranslationKeys
		Violation.uid = p1.violation.uid
		NewModerationDetail.violation = Violation
	end
	if p1.context then
		for i, IsAltInformed in pairs(p1.context) do
			if i == "SelfServiceDeactivated" and FFlagEnableDeactivatedUserReactivation then
				NewModerationDetail.selfServiceDeactivated = IsAltInformed
			elseif i == "NEXT_CONSEQUENCE_TYPE" then
				NewModerationDetail.nextConsequenceType = IsAltInformed
			elseif i == "NEXT_CONSEQUENCE_DURATION" then
				NewModerationDetail.nextConsequenceDuration = IsAltInformed
			elseif i == "IS_ALT_INFORMED" then
				NewModerationDetail.isAltInformed = IsAltInformed
			end
		end
	end
	return ResultModule.success(NewModerationDetail)
end

return ModerationDetailModule