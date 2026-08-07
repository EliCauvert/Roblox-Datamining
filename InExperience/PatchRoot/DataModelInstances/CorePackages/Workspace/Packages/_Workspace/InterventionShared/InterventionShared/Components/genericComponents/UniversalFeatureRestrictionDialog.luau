local interventionShared = script:FindFirstAncestor("InterventionShared")
local reactModule = require(interventionShared.Parent.React)
local useCallback = reactModule.useCallback
local determineAppealsStateModule = require(interventionShared.Utils.determineAppealsState)
local determineUFRInterventionTypeModule = require(interventionShared.Utils.determineUFRInterventionType)
local genericInterventionDialogModule = require(interventionShared.Components.genericComponents.GenericInterventionDialog)
local _ = require(interventionShared.Utils.Types)
local useParsedBadUtterancesModule = require(interventionShared.Hooks.useParsedBadUtterances)
local useRestrictionEndDateInfoModule = require(interventionShared.Hooks.useRestrictionEndDateInfo)

return reactModule.memo(function(p0) --[[ line: 45 | named "UniversalFeatureRestrictionDialog" ]]
	-- upvalues: determineUFRInterventionTypeModule (ref), useParsedBadUtterancesModule (ref), useRestrictionEndDateInfoModule (ref), determineAppealsStateModule (ref), useCallback (ref), reactModule (ref), genericInterventionDialogModule (ref)
	local moderationDetail = p0.moderationDetail
	local consequenceTransparencyMessage = moderationDetail.consequenceTransparencyMessage
	local interventionId = moderationDetail.interventionId
	local acknowledgeable = moderationDetail.acknowledgeable
	local badUtterances = moderationDetail.badUtterances
	local labelTranslationKey = moderationDetail.labelTranslationKey
	local messageToUser = moderationDetail.messageToUser
	local var7 = determineUFRInterventionTypeModule(moderationDetail.punishmentTypeDescription)
	local var8 = useParsedBadUtterancesModule(badUtterances or {}, labelTranslationKey)
	local joined = table.concat(var8.textItems, "\n")
	local joined_1 = table.concat(var8.abuseTypes, ", ")
	local var11 = useRestrictionEndDateInfoModule(moderationDetail.endDate)
	local var12 = determineAppealsStateModule({
		onAppeal = p0.onAppeal,
		beginDate = moderationDetail.beginDate,
		endDate = moderationDetail.endDate,
		acknowledgeable = acknowledgeable
	})
	
	return reactModule.createElement(genericInterventionDialogModule, {
		useDetailedLayout = true,
		titleText = p0.titleOverride or "Chat suspended for 2 days",
		bodyText = p0.bodyOverride or "You can't use chat because one or more of your messages broke the rules. If you break the rules again, you could be banned.",
		userNote = messageToUser,
		isAppealable = var12.isAppealable,
		evidence = joined,
		violationReason = joined_1,
		onDismiss = useCallback(function() --[[ line: 69 ]]
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
		interventionTypeForAnalytics = var7,
		abuseVectorForAnalytics = p0.abuseVector,
		formattedEndDate = var11.formattedEndDate,
		countdownText = var11.countdownText,
		onAppeal = p0.onAppeal,
		shouldOpenAppealsPortal = var12.shouldOpenAppealsPortal
	})
end)