local InAppIntervention = script:FindFirstAncestor("InAppIntervention")
local Parent = InAppIntervention.Parent
local Constants = require(Parent.InterventionShared).Utils.Constants
local _ = require(InAppIntervention.Utils.Types)
local InterventionAnalytics = require(Parent.InterventionShared).InterventionAnalytics
local PartyChatTimeoutReceivedSignal = require(Parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1, p2): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat and not p2.isUserInExperience
	end,
	shouldTriggerBehavioralTreatment = function(p1): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerEventReceived = function(p1, p2): boolean
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat and not p2.isUserInExperience
	end,
	onTriggerVisualTreatment = function(_, Callback: (any) -> (), InterventionDetail)
		-- upvalues: Constants (copy)
		Callback({
			isShown = true,
			type = Constants.UIStateActions.ToggleNotificationDialog,
			treatmentType = Constants.TreatmentType.PartyChatTimeoutDialog,
			endTime = DateTime.now().UnixTimestamp + InterventionDetail.timeoutDurationSeconds,
			interventionDetail = InterventionDetail
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
			placement = Constants.InterventionPlacementType.InApp
		})
	end
}