local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local Constants = require(Parent.InterventionShared).Utils.Constants
local _ = require(InExperienceIntervention.Utils.Types)
local InterventionAnalytics = require(Parent.InterventionShared).InterventionAnalytics
local PartyChatTimeoutReceivedSignal = require(Parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerBehavioralTreatment = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerEventReceived = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	onTriggerVisualTreatment = function(Callback: (any) -> (), Detail)
		-- upvalues: Constants (copy)
		Callback({
			isShown = true,
			type = Constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = Constants.TreatmentType.PartyChatTimeoutDialog,
			endTime = DateTime.now().UnixTimestamp + Detail.timeoutDurationSeconds,
			detail = Detail
		})
	end,
	onTriggerBehavioralTreatment = function(p1)
		-- upvalues: PartyChatTimeoutReceivedSignal (copy)
		PartyChatTimeoutReceivedSignal:fire(p1.vectorTargetId)
	end,
	onTriggerEventReceived = function(p1)
		-- upvalues: InterventionAnalytics (copy), Constants (copy)
		InterventionAnalytics.sendAnalyticsEvent(InterventionAnalytics.TelemetryConfigs.MessageReceived, {
			eventType = InterventionAnalytics.Constants.EventTypes.ModalMessageReceived,
			counterNamespace = InterventionAnalytics.Constants.CounterNamespaceTypes.PartyChat,
			interventionType = InterventionAnalytics.Constants.InterventionTypes.PartyChatTimeout,
			renderedTimestamp = DateTime.now().UnixTimestampMillis,
			eventId = p1.decisionEventId,
			duration = p1.timeoutDurationSeconds,
			placement = Constants.InterventionPlacementType.InExperience
		})
	end
}