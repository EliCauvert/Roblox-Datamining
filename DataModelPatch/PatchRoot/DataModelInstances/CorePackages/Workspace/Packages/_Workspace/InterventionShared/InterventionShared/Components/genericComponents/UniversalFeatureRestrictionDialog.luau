local InterventionShared = script:FindFirstAncestor("InterventionShared")
local ReactModule = require(InterventionShared.Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local DetermineAppealsStateModule = require(InterventionShared.Utils.determineAppealsState)
local DetermineUFRInterventionTypeModule = require(InterventionShared.Utils.determineUFRInterventionType)
local GenericInterventionDialogModule = require(InterventionShared.Components.genericComponents.GenericInterventionDialog)
local _ = require(InterventionShared.Utils.Types)
local UseParsedBadUtterancesModule = require(InterventionShared.Hooks.useParsedBadUtterances)
local UseRestrictionEndDateInfoModule = require(InterventionShared.Hooks.useRestrictionEndDateInfo)

return ReactModule.memo(function(p1)
	-- upvalues: DetermineUFRInterventionTypeModule (copy), UseParsedBadUtterancesModule (copy), UseRestrictionEndDateInfoModule (copy), DetermineAppealsStateModule (copy), UseCallbackFunction (copy), ReactModule (copy), GenericInterventionDialogModule (copy)
	local ModerationDetail = p1.moderationDetail
	local ConsequenceTransparencyMessage = ModerationDetail.consequenceTransparencyMessage
	local InterventionId = ModerationDetail.interventionId
	local Acknowledgeable = ModerationDetail.acknowledgeable
	local BadUtterances = ModerationDetail.badUtterances
	local LabelTranslationKey = ModerationDetail.labelTranslationKey
	local MessageToUser = ModerationDetail.messageToUser
	local DetermineUFRInterventionTypeModuleResult = DetermineUFRInterventionTypeModule(ModerationDetail.punishmentTypeDescription)
	local UseParsedBadUtterancesModuleResult = UseParsedBadUtterancesModule(BadUtterances or {}, LabelTranslationKey)
	local Joined = table.concat(UseParsedBadUtterancesModuleResult.textItems, "\n")
	local Joined1 = table.concat(UseParsedBadUtterancesModuleResult.abuseTypes, ", ")
	local UseRestrictionEndDateInfoModuleResult = UseRestrictionEndDateInfoModule(ModerationDetail.endDate)
	local DetermineAppealsStateModuleResult = DetermineAppealsStateModule({
		onAppeal = p1.onAppeal,
		beginDate = ModerationDetail.beginDate,
		endDate = ModerationDetail.endDate,
		acknowledgeable = Acknowledgeable
	})
	
	return ReactModule.createElement(GenericInterventionDialogModule, {
		useDetailedLayout = true,
		titleText = p1.titleOverride or "Chat suspended for 2 days",
		bodyText = p1.bodyOverride or "You can't use chat because one or more of your messages broke the rules. If you break the rules again, you could be banned.",
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
		eventId = InterventionId,
		interventionTypeForAnalytics = DetermineUFRInterventionTypeModuleResult,
		abuseVectorForAnalytics = p1.abuseVector,
		formattedEndDate = UseRestrictionEndDateInfoModuleResult.formattedEndDate,
		countdownText = UseRestrictionEndDateInfoModuleResult.countdownText,
		onAppeal = p1.onAppeal,
		shouldOpenAppealsPortal = DetermineAppealsStateModuleResult.shouldOpenAppealsPortal
	})
end)