local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local IXPService = game:GetService("IXPService")
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local constantsModule = require(interventionShared.Utils.Constants)
local determineAppealsStateModule = require(interventionShared.Utils.determineAppealsState)
local determineUFRInterventionTypeModule = require(interventionShared.Utils.determineUFRInterventionType)
local genericInterventionDialogModule = require(interventionShared.Components.genericComponents.GenericInterventionDialog)
local _ = require(interventionShared.Utils.Types)
local useParsedBadUtterancesModule = require(interventionShared.Hooks.useParsedBadUtterances)
local useRestrictionEndDateInfoModule = require(interventionShared.Hooks.useRestrictionEndDateInfo)
local fFlagUFRAppealsAndModNoteFixModule = require(interventionShared.Flags.FFlagUFRAppealsAndModNoteFix)
local fFlagUFRFriendsChatIXPExposureModule = require(interventionShared.Flags.FFlagUFRFriendsChatIXPExposure)
local fFlagUFRImprovementsModule = require(interventionShared.Flags.FFlagUFRImprovements)

return reactModule.memo(function(p1)
	-- upvalues: fFlagUFRAppealsAndModNoteFixModule (ref), constantsModule (ref), determineUFRInterventionTypeModule (ref), useParsedBadUtterancesModule (ref), useRestrictionEndDateInfoModule (ref), determineAppealsStateModule (ref), useEffect (ref), fFlagUFRFriendsChatIXPExposureModule (ref), IXPService (ref), appUserLayers (ref), fFlagUFRImprovementsModule (ref), useCallback (ref), reactModule (ref), genericInterventionDialogModule (ref)
	local moderationDetail = p1.moderationDetail
	local consequenceTransparencyMessage = moderationDetail.consequenceTransparencyMessage
	local interventionId = moderationDetail.interventionId
	local acknowledgeable = moderationDetail.acknowledgeable
	local badUtterances = moderationDetail.badUtterances
	local labelTranslationKey = moderationDetail.labelTranslationKey
	local violation = moderationDetail.violation
	local var1 = if fFlagUFRAppealsAndModNoteFixModule and p1.abuseVector ~= constantsModule.AbuseVectorType.RobloxExperienceKick then nil else moderationDetail.messageToUser
	local var2 = determineUFRInterventionTypeModule(moderationDetail.punishmentTypeDescription)
	local var3 = useParsedBadUtterancesModule(badUtterances or {}, { labelTranslationKey = labelTranslationKey })
	local joined = table.concat(var3.textItems, "\n")
	local joined_1 = table.concat(var3.abuseTypes, ", ")
	local var4 = useRestrictionEndDateInfoModule(moderationDetail.endDate)
	local var5 = determineAppealsStateModule({
		onAppeal = p1.onAppeal,
		beginDate = moderationDetail.beginDate,
		endDate = moderationDetail.endDate,
		acknowledgeable = acknowledgeable
	})
	useEffect(function()
		-- upvalues: fFlagUFRFriendsChatIXPExposureModule (copy), p1 (ref), constantsModule (copy), IXPService (copy), appUserLayers (copy), fFlagUFRImprovementsModule (copy)
		if fFlagUFRFriendsChatIXPExposureModule and p1.abuseVector == constantsModule.AbuseVectorType.PartyChat and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.FriendsChatRestrictionUserIDLayer)
		end
		if fFlagUFRImprovementsModule and p1.onShownCallback then
			p1.onShownCallback()
		end
	end, {})
	
	return reactModule.createElement(genericInterventionDialogModule, {
		useDetailedLayout = true,
		titleText = p1.titleOverride or (if fFlagUFRImprovementsModule then moderationDetail.title or "" else "Chat suspended for 2 days"),
		bodyText = p1.bodyOverride or (if fFlagUFRImprovementsModule then moderationDetail.body or "" else "You can't use chat because one or more of your messages broke the rules. If you break the rules again, you could be banned."),
		userNote = var1,
		isAppealable = var5.isAppealable,
		evidence = joined,
		violationReason = joined_1,
		onDismiss = useCallback(function()
			-- upvalues: p1 (ref)
			p1.onDismiss()
			
			if p1.onDismissCallback then
				p1.onDismissCallback()
			end
		end, { p1.onDismiss, p1.onDismissCallback }),
		dsaMessage = consequenceTransparencyMessage,
		interventionId = interventionId,
		acknowledgeable = acknowledgeable,
		eventId = p1.analyticsEventId or interventionId,
		interventionTypeForAnalytics = var2,
		abuseVectorForAnalytics = p1.abuseVector,
		formattedEndDate = var4.formattedEndDate,
		countdownText = var4.countdownText,
		onAppeal = p1.onAppeal,
		onAcknowledgementSuccess = p1.onAcknowledgementSuccess,
		shouldOpenAppealsPortal = var5.shouldOpenAppealsPortal,
		violationUid = if violation then violation.uid else nil
	})
end)