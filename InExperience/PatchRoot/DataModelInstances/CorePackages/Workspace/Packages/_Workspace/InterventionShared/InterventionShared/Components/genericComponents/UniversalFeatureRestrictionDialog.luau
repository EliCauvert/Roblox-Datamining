local interventionShared = script:FindFirstAncestor("InterventionShared")
local reactModule = require(interventionShared.Parent.React)
local useCallback = reactModule.useCallback
local determineAppealsStateModule = require(interventionShared.Utils.determineAppealsState)
local determineUFRInterventionTypeModule = require(interventionShared.Utils.determineUFRInterventionType)
local genericInterventionDialogModule = require(interventionShared.Components.genericComponents.GenericInterventionDialog)
local _ = require(interventionShared.Utils.Types)
local useParsedBadUtterancesModule = require(interventionShared.Hooks.useParsedBadUtterances)
local useRestrictionEndDateInfoModule = require(interventionShared.Hooks.useRestrictionEndDateInfo)
local fFlagUFRImprovementsModule = require(interventionShared.Flags.FFlagUFRImprovements)

return reactModule.memo(function(p0) --[[ line: 47 | named "UniversalFeatureRestrictionDialog" ]]
	-- upvalues: determineUFRInterventionTypeModule (ref), useParsedBadUtterancesModule (ref), useRestrictionEndDateInfoModule (ref), determineAppealsStateModule (ref), useCallback (ref), fFlagUFRImprovementsModule (ref), reactModule (ref), genericInterventionDialogModule (ref)
	local moderationDetail = p0.moderationDetail
	local consequenceTransparencyMessage = moderationDetail.consequenceTransparencyMessage
	local interventionId = moderationDetail.interventionId
	local acknowledgeable = moderationDetail.acknowledgeable
	local badUtterances = moderationDetail.badUtterances
	local labelTranslationKey = moderationDetail.labelTranslationKey
	local messageToUser = moderationDetail.messageToUser
	local var8 = determineUFRInterventionTypeModule(moderationDetail.punishmentTypeDescription)
	local var9 = useParsedBadUtterancesModule(badUtterances or {}, labelTranslationKey)
	local joined = table.concat(var9.textItems, "\n")
	local joined_1 = table.concat(var9.abuseTypes, ", ")
	local var12 = useRestrictionEndDateInfoModule(moderationDetail.endDate)
	local var13 = determineAppealsStateModule({
		onAppeal = p0.onAppeal,
		beginDate = moderationDetail.beginDate,
		endDate = moderationDetail.endDate,
		acknowledgeable = acknowledgeable
	})
	
	return reactModule.createElement(genericInterventionDialogModule, {
		useDetailedLayout = true,
		titleText = p0.titleOverride or (if fFlagUFRImprovementsModule then moderationDetail.header or "" else "Chat suspended for 2 days"),
		bodyText = p0.bodyOverride or (if fFlagUFRImprovementsModule then moderationDetail.body or "" else "You can't use chat because one or more of your messages broke the rules. If you break the rules again, you could be banned."),
		userNote = messageToUser,
		isAppealable = var13.isAppealable,
		evidence = joined,
		violationReason = joined_1,
		onDismiss = useCallback(function() --[[ line: 71 ]]
			-- upvalues: p0 (ref)
			p0.onDismiss()
			
			if p0.onDismissCallback then
				p0.onDismissCallback()
			end
		end, { p0.onDismiss, p0.onDismissCallback }),
		dsaMessage = consequenceTransparencyMessage,
		interventionId = interventionId,
		acknowledgeable = acknowledgeable,
		eventId = interventionId,
		interventionTypeForAnalytics = var8,
		abuseVectorForAnalytics = p0.abuseVector,
		formattedEndDate = var12.formattedEndDate,
		countdownText = var12.countdownText,
		onAppeal = p0.onAppeal,
		shouldOpenAppealsPortal = var13.shouldOpenAppealsPortal
	})
end)