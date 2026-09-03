local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local abuseVectorModule = require(parent.UniversalFeatureRestrictions.AbuseVector)
local constants = require(parent.InterventionShared).Utils.Constants
local interventionAnalytics = require(parent.InterventionShared).InterventionAnalytics
local interventionTreatmentShownSignal = require(parent.InterventionShared).Signals.interventionTreatmentShownSignal
local partyChatTimeoutReceivedSignal = require(parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local showFeatureRestrictionFromRealtimeModule = require(parent.UniversalFeatureRestrictions.showFeatureRestrictionFromRealtime)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local fFlagAppChatUniversalFeatureRestriction = require(parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local _ = require(inExperienceIntervention.Utils.Types)

local function onPartyChatTimeoutUFRShown()
	-- upvalues: interventionTreatmentShownSignal (ref), constants (ref)
	interventionTreatmentShownSignal:fire(constants.TreatmentType.PartyChatTimeoutDialog)
end

local function onPartyChatTimeoutAcknowledgementSuccess()
	-- upvalues: partyChatTimeoutReceivedSignal (ref)
	partyChatTimeoutReceivedSignal:fire(nil)
end

local function onPartyChatTimeoutUFRAppeal() end

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and p1.abuseVector == constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerBehavioralTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and p1.abuseVector == constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerEventReceived = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatTimeout and p1.abuseVector == constants.AbuseVectorType.PartyChat
	end,
	onTriggerVisualTreatment = function(p1, p2)
		-- upvalues: fFlagAppChatUniversalFeatureRestriction (ref), showFeatureRestrictionFromRealtimeModule (ref), abuseVectorModule (ref), onPartyChatTimeoutUFRAppeal (ref), onPartyChatTimeoutUFRShown (ref), fFlagAppChatReactiveFeatureRestrictions (ref), onPartyChatTimeoutAcknowledgementSuccess (ref), constants (ref)
		if fFlagAppChatUniversalFeatureRestriction then
			showFeatureRestrictionFromRealtimeModule(abuseVectorModule.PartyChat, p2, {
				onAppeal = onPartyChatTimeoutUFRAppeal,
				onShown = onPartyChatTimeoutUFRShown,
				onAcknowledgementSuccess = if fFlagAppChatReactiveFeatureRestrictions then onPartyChatTimeoutAcknowledgementSuccess else nil
			})
			
			return
		end
		p1({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.PartyChatTimeoutDialog,
			endTime = DateTime.now().UnixTimestamp + p2.timeoutDurationSeconds,
			detail = p2
		})
	end,
	onTriggerBehavioralTreatment = function(p1)
		-- upvalues: partyChatTimeoutReceivedSignal (ref)
		partyChatTimeoutReceivedSignal:fire(p1.vectorTargetId)
	end,
	onTriggerEventReceived = function(p1)
		-- upvalues: interventionAnalytics (ref), constants (ref)
		interventionAnalytics.sendAnalyticsEvent(interventionAnalytics.TelemetryConfigs.MessageReceived, {
			eventType = interventionAnalytics.Constants.EventTypes.ModalMessageReceived,
			counterNamespace = interventionAnalytics.Constants.CounterNamespaceTypes.PartyChat,
			interventionType = interventionAnalytics.Constants.InterventionTypes.PartyChatTimeout,
			renderedTimestamp = DateTime.now().UnixTimestampMillis,
			eventId = p1.decisionEventId,
			duration = p1.timeoutDurationSeconds,
			placement = constants.InterventionPlacementType.InExperience
		})
	end
}