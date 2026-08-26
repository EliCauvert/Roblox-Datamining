local interventionShared = script:FindFirstAncestor("InterventionShared")
local reactModule = require(interventionShared.Parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local determineAppealsStateModule = require(interventionShared.Utils.determineAppealsState)
local determineUFRInterventionTypeModule = require(interventionShared.Utils.determineUFRInterventionType)
local genericInterventionDialogModule = require(interventionShared.Components.genericComponents.GenericInterventionDialog)
local _ = require(interventionShared.Utils.Types)
local useParsedBadUtterancesModule = require(interventionShared.Hooks.useParsedBadUtterances)
local useRestrictionEndDateInfoModule = require(interventionShared.Hooks.useRestrictionEndDateInfo)
local fFlagUFRImprovementsModule = require(interventionShared.Flags.FFlagUFRImprovements)

return reactModule.memo(function(p1)
	-- upvalues: determineUFRInterventionTypeModule (ref), useParsedBadUtterancesModule (ref), useRestrictionEndDateInfoModule (ref), determineAppealsStateModule (ref), useEffect (ref), fFlagUFRImprovementsModule (ref), useCallback (ref), reactModule (ref), genericInterventionDialogModule (ref)
	local moderationDetail = p1.moderationDetail
	local consequenceTransparencyMessage = moderationDetail.consequenceTransparencyMessage
	local interventionId = moderationDetail.interventionId
	local acknowledgeable = moderationDetail.acknowledgeable
	local badUtterances = moderationDetail.badUtterances
	local labelTranslationKey = moderationDetail.labelTranslationKey
	local messageToUser = moderationDetail.messageToUser
	local var1 = determineUFRInterventionTypeModule(moderationDetail.punishmentTypeDescription)
	local var2 = useParsedBadUtterancesModule(badUtterances or {}, { labelTranslationKey = labelTranslationKey })
	local joined = table.concat(var2.textItems, "\n")
	local joined_1 = table.concat(var2.abuseTypes, ", ")
	local var3 = useRestrictionEndDateInfoModule(moderationDetail.endDate)
	local var4 = determineAppealsStateModule({
		onAppeal = p1.onAppeal,
		beginDate = moderationDetail.beginDate,
		endDate = moderationDetail.endDate,
		acknowledgeable = acknowledgeable
	})
	useEffect(function()
		-- upvalues: fFlagUFRImprovementsModule (copy), p1 (ref)
		if fFlagUFRImprovementsModule and p1.onShownCallback then
			p1.onShownCallback()
		end
	end, {})
	
	return reactModule.createElement(genericInterventionDialogModule, {
		useDetailedLayout = true,
		titleText = p1.titleOverride or (if fFlagUFRImprovementsModule then moderationDetail.header or "" else "Chat suspended for 2 days"),
		bodyText = p1.bodyOverride or (if fFlagUFRImprovementsModule then moderationDetail.body or "" else "You can't use chat because one or more of your messages broke the rules. If you break the rules again, you could be banned."),
		userNote = messageToUser,
		isAppealable = var4.isAppealable,
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
		eventId = interventionId,
		interventionTypeForAnalytics = var1,
		abuseVectorForAnalytics = p1.abuseVector,
		formattedEndDate = var3.formattedEndDate,
		countdownText = var3.countdownText,
		onAppeal = p1.onAppeal,
		shouldOpenAppealsPortal = var4.shouldOpenAppealsPortal
	})
end)