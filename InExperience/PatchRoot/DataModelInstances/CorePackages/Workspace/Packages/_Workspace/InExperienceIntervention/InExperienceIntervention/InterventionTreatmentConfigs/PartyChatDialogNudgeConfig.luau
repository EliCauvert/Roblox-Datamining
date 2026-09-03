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

local function onPartyChatNudgeUFRAppeal() end

local function onPartyChatNudgeUFRShown()
	-- upvalues: interventionTreatmentShownSignal (ref), constants (ref)
	interventionTreatmentShownSignal:fire(constants.TreatmentType.PartyChatNudgeDialog)
end

local function onPartyChatNudgeAcknowledgementSuccess()
	-- upvalues: partyChatTimeoutReceivedSignal (ref)
	partyChatTimeoutReceivedSignal:fire(nil)
end

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and p1.abuseVector == constants.AbuseVectorType.PartyChat)
	end,
	shouldTriggerBehavioralTreatment = function(p1)
		-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref), constants (ref)
		return fFlagAppChatReactiveFeatureRestrictions and (p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and (p1.abuseVector == constants.AbuseVectorType.PartyChat and p1.acknowledgeable == true)))
	end,
	shouldTriggerEventReceived = function(p1)
		-- upvalues: constants (ref)
		return p1.type == constants.NotificationDialogType.ChatNudge and (p1.modalType == constants.NotificationModalType.Dialog and p1.abuseVector == constants.AbuseVectorType.PartyChat)
	end,
	onTriggerVisualTreatment = function(p1, p2)
		-- upvalues: fFlagAppChatUniversalFeatureRestriction (ref), showFeatureRestrictionFromRealtimeModule (ref), abuseVectorModule (ref), onPartyChatNudgeUFRAppeal (ref), onPartyChatNudgeUFRShown (ref), fFlagAppChatReactiveFeatureRestrictions (ref), onPartyChatNudgeAcknowledgementSuccess (ref), constants (ref)
		if fFlagAppChatUniversalFeatureRestriction then
			showFeatureRestrictionFromRealtimeModule(abuseVectorModule.PartyChat, p2, {
				onAppeal = onPartyChatNudgeUFRAppeal,
				onShown = onPartyChatNudgeUFRShown,
				onAcknowledgementSuccess = if fFlagAppChatReactiveFeatureRestrictions then onPartyChatNudgeAcknowledgementSuccess else nil
			})
			
			return
		end
		p1({
			isShown = true,
			type = constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = constants.TreatmentType.PartyChatNudgeDialog,
			detail = p2
		})
	end,
	onTriggerBehavioralTreatment = function(_)
		-- upvalues: partyChatTimeoutReceivedSignal (ref)
		partyChatTimeoutReceivedSignal:fire(nil)
	end,
	onTriggerEventReceived = function(p1)
		-- upvalues: interventionAnalytics (ref), constants (ref)
		interventionAnalytics.sendAnalyticsEvent(interventionAnalytics.TelemetryConfigs.MessageReceived, {
			eventType = interventionAnalytics.Constants.EventTypes.ModalMessageReceived,
			counterNamespace = interventionAnalytics.Constants.CounterNamespaceTypes.PartyChat,
			interventionType = interventionAnalytics.Constants.InterventionTypes.PartyChatNudge,
			renderedTimestamp = DateTime.now().UnixTimestampMillis,
			eventId = p1.decisionEventId,
			duration = p1.timeoutDurationSeconds,
			placement = constants.InterventionPlacementType.InExperience
		})
	end
}