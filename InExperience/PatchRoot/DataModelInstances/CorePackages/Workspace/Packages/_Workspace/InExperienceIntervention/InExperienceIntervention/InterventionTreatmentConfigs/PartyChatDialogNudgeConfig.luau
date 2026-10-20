local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
local Constants = require(Parent.InterventionShared).Utils.Constants
local InterventionAnalytics = require(Parent.InterventionShared).InterventionAnalytics
local InterventionTreatmentShownSignal = require(Parent.InterventionShared).Signals.interventionTreatmentShownSignal
local PartyChatTimeoutReceivedSignal = require(Parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
local ShowFeatureRestrictionFromRealtimeModule = require(Parent.UniversalFeatureRestrictions.showFeatureRestrictionFromRealtime)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local FFlagAppChatUniversalFeatureRestriction = require(Parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local _ = require(InExperienceIntervention.Utils.Types)

local function onPartyChatNudgeUFRAppeal() end

local function onPartyChatNudgeUFRShown()
	-- upvalues: InterventionTreatmentShownSignal (copy), Constants (copy)
	InterventionTreatmentShownSignal:fire(Constants.TreatmentType.PartyChatNudgeDialog)
end

local function onPartyChatNudgeAcknowledgementSuccess()
	-- upvalues: PartyChatTimeoutReceivedSignal (copy)
	PartyChatTimeoutReceivedSignal:fire(nil)
end

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatNudge and p1.modalType == Constants.NotificationModalType.Dialog and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerBehavioralTreatment = function(p1): boolean
		-- upvalues: FFlagAppChatReactiveFeatureRestrictions (copy), Constants (copy)
		return FFlagAppChatReactiveFeatureRestrictions and (p1.type == Constants.NotificationDialogType.ChatNudge and (p1.modalType == Constants.NotificationModalType.Dialog and p1.abuseVector == Constants.AbuseVectorType.PartyChat) and p1.acknowledgeable == true)
	end,
	shouldTriggerEventReceived = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatNudge and p1.modalType == Constants.NotificationModalType.Dialog and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	onTriggerVisualTreatment = function(Callback: (any) -> (), Detail)
		-- upvalues: FFlagAppChatUniversalFeatureRestriction (copy), ShowFeatureRestrictionFromRealtimeModule (copy), AbuseVectorModule (copy), onPartyChatNudgeUFRAppeal (copy), onPartyChatNudgeUFRShown (copy), FFlagAppChatReactiveFeatureRestrictions (copy), onPartyChatNudgeAcknowledgementSuccess (copy), Constants (copy)
		if FFlagAppChatUniversalFeatureRestriction then
			ShowFeatureRestrictionFromRealtimeModule(AbuseVectorModule.PartyChat, Detail, {
				onAppeal = onPartyChatNudgeUFRAppeal,
				onShown = onPartyChatNudgeUFRShown,
				onAcknowledgementSuccess = if FFlagAppChatReactiveFeatureRestrictions then onPartyChatNudgeAcknowledgementSuccess else nil
			})
			
			return
		else
			Callback({
				isShown = true,
				type = Constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = Constants.TreatmentType.PartyChatNudgeDialog,
				detail = Detail
			})
		end
	end,
	onTriggerBehavioralTreatment = function(_)
		-- upvalues: PartyChatTimeoutReceivedSignal (copy)
		PartyChatTimeoutReceivedSignal:fire(nil)
	end,
	onTriggerEventReceived = function(p1)
		-- upvalues: InterventionAnalytics (copy), Constants (copy)
		InterventionAnalytics.sendAnalyticsEvent(InterventionAnalytics.TelemetryConfigs.MessageReceived, {
			eventType = InterventionAnalytics.Constants.EventTypes.ModalMessageReceived,
			counterNamespace = InterventionAnalytics.Constants.CounterNamespaceTypes.PartyChat,
			interventionType = InterventionAnalytics.Constants.InterventionTypes.PartyChatNudge,
			renderedTimestamp = DateTime.now().UnixTimestampMillis,
			eventId = p1.decisionEventId,
			duration = p1.timeoutDurationSeconds,
			placement = Constants.InterventionPlacementType.InExperience
		})
	end
}