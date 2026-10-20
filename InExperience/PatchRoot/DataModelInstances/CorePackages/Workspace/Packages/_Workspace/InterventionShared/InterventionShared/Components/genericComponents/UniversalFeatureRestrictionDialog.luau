local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local IXPService = game:GetService("IXPService")
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local ConstantsModule = require(InterventionShared.Utils.Constants)
local DetermineAppealsStateModule = require(InterventionShared.Utils.determineAppealsState)
local DetermineUFRInterventionTypeModule = require(InterventionShared.Utils.determineUFRInterventionType)
local GenericInterventionDialogModule = require(InterventionShared.Components.genericComponents.GenericInterventionDialog)
local _ = require(InterventionShared.Utils.Types)
local UseParsedBadUtterancesModule = require(InterventionShared.Hooks.useParsedBadUtterances)
local UseRestrictionEndDateInfoModule = require(InterventionShared.Hooks.useRestrictionEndDateInfo)
local FFlagUFRAppealsAndModNoteFixModule = require(InterventionShared.Flags.FFlagUFRAppealsAndModNoteFix)
local FFlagUFRFriendsChatIXPExposureModule = require(InterventionShared.Flags.FFlagUFRFriendsChatIXPExposure)
local FFlagUFRImprovementsModule = require(InterventionShared.Flags.FFlagUFRImprovements)

return ReactModule.memo(function(p1)
	-- upvalues: FFlagUFRAppealsAndModNoteFixModule (copy), ConstantsModule (copy), DetermineUFRInterventionTypeModule (copy), UseParsedBadUtterancesModule (copy), UseRestrictionEndDateInfoModule (copy), DetermineAppealsStateModule (copy), UseEffectFunction (copy), FFlagUFRFriendsChatIXPExposureModule (copy), IXPService (copy), AppUserLayers (copy), FFlagUFRImprovementsModule (copy), UseCallbackFunction (copy), ReactModule (copy), GenericInterventionDialogModule (copy)
	local ModerationDetail = p1.moderationDetail
	local ConsequenceTransparencyMessage = ModerationDetail.consequenceTransparencyMessage
	local InterventionId = ModerationDetail.interventionId
	local Acknowledgeable = ModerationDetail.acknowledgeable
	local BadUtterances = ModerationDetail.badUtterances
	local LabelTranslationKey = ModerationDetail.labelTranslationKey
	local Violation = ModerationDetail.violation
	local MessageToUser = if FFlagUFRAppealsAndModNoteFixModule and p1.abuseVector ~= ConstantsModule.AbuseVectorType.RobloxExperienceKick then nil else ModerationDetail.messageToUser
	local DetermineUFRInterventionTypeModuleResult = DetermineUFRInterventionTypeModule(ModerationDetail.punishmentTypeDescription)
	local UseParsedBadUtterancesModuleResult = UseParsedBadUtterancesModule(BadUtterances or {}, { labelTranslationKey = LabelTranslationKey })
	local Joined = table.concat(UseParsedBadUtterancesModuleResult.textItems, "\n")
	local Joined1 = table.concat(UseParsedBadUtterancesModuleResult.abuseTypes, ", ")
	local UseRestrictionEndDateInfoModuleResult = UseRestrictionEndDateInfoModule(ModerationDetail.endDate)
	local DetermineAppealsStateModuleResult = DetermineAppealsStateModule({
		onAppeal = p1.onAppeal,
		beginDate = ModerationDetail.beginDate,
		endDate = ModerationDetail.endDate,
		acknowledgeable = Acknowledgeable
	})
	UseEffectFunction(function()
		-- upvalues: FFlagUFRFriendsChatIXPExposureModule (upval), p1 (copy), ConstantsModule (upval), IXPService (upval), AppUserLayers (upval), FFlagUFRImprovementsModule (upval)
		if FFlagUFRFriendsChatIXPExposureModule and p1.abuseVector == ConstantsModule.AbuseVectorType.PartyChat and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(AppUserLayers.FriendsChatRestrictionUserIDLayer)
		end
		if FFlagUFRImprovementsModule and p1.onShownCallback then
			p1.onShownCallback()
		end
	end, {})
	
	return ReactModule.createElement(GenericInterventionDialogModule, {
		useDetailedLayout = true,
		titleText = p1.titleOverride or (if FFlagUFRImprovementsModule then ModerationDetail.title or "" else "Chat suspended for 2 days"),
		bodyText = p1.bodyOverride or (if FFlagUFRImprovementsModule then ModerationDetail.body or "" else "You can't use chat because one or more of your messages broke the rules. If you break the rules again, you could be banned."),
		userNote = MessageToUser,
		isAppealable = DetermineAppealsStateModuleResult.isAppealable,
		evidence = Joined,
		violationReason = Joined1,
		onDismiss = UseCallbackFunction(function()
			-- upvalues: p1 (copy)
			p1.onDismiss()
			
			if p1.onDismissCallback then
				p1.onDismissCallback()
			end
		end, { p1.onDismiss, p1.onDismissCallback }),
		dsaMessage = ConsequenceTransparencyMessage,
		interventionId = InterventionId,
		acknowledgeable = Acknowledgeable,
		eventId = p1.analyticsEventId or InterventionId,
		interventionTypeForAnalytics = DetermineUFRInterventionTypeModuleResult,
		abuseVectorForAnalytics = p1.abuseVector,
		formattedEndDate = UseRestrictionEndDateInfoModuleResult.formattedEndDate,
		countdownText = UseRestrictionEndDateInfoModuleResult.countdownText,
		onAppeal = p1.onAppeal,
		onAcknowledgementSuccess = p1.onAcknowledgementSuccess,
		shouldOpenAppealsPortal = DetermineAppealsStateModuleResult.shouldOpenAppealsPortal,
		violationUid = if Violation then Violation.uid else nil
	})
end)