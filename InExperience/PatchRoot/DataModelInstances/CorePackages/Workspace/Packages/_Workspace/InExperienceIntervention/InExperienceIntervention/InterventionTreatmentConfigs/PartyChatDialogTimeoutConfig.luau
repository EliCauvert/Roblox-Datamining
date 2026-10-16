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

local function onPartyChatTimeoutUFRShown() --[[ Line: 17 ]]
	-- upvalues: InterventionTreatmentShownSignal (copy), Constants (copy)
	InterventionTreatmentShownSignal:fire(Constants.TreatmentType.PartyChatTimeoutDialog)
end

local function onPartyChatTimeoutAcknowledgementSuccess() --[[ Line: 20 ]]
	-- upvalues: PartyChatTimeoutReceivedSignal (copy)
	PartyChatTimeoutReceivedSignal:fire(nil)
end

local function onPartyChatTimeoutUFRAppeal() --[[ Line: 25 ]] end

return {
	configName = "PartyChatDialogNudge",
	shouldTriggerVisualTreatment = function(p1): boolean --[[ Line: 29 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerBehavioralTreatment = function(p1): boolean --[[ Line: 33 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	shouldTriggerEventReceived = function(p1): boolean --[[ Line: 37 ]]
		-- upvalues: Constants (copy)
		return p1.type == Constants.NotificationDialogType.ChatTimeout and p1.abuseVector == Constants.AbuseVectorType.PartyChat
	end,
	onTriggerVisualTreatment = function(Callback: (any) -> (), Detail) --[[ Line: 41 ]]
		-- upvalues: FFlagAppChatUniversalFeatureRestriction (copy), ShowFeatureRestrictionFromRealtimeModule (copy), AbuseVectorModule (copy), onPartyChatTimeoutUFRAppeal (copy), onPartyChatTimeoutUFRShown (copy), FFlagAppChatReactiveFeatureRestrictions (copy), onPartyChatTimeoutAcknowledgementSuccess (copy), Constants (copy)
		if FFlagAppChatUniversalFeatureRestriction then
			ShowFeatureRestrictionFromRealtimeModule(AbuseVectorModule.PartyChat, Detail, {
				onAppeal = onPartyChatTimeoutUFRAppeal,
				onShown = onPartyChatTimeoutUFRShown,
				onAcknowledgementSuccess = if FFlagAppChatReactiveFeatureRestrictions then onPartyChatTimeoutAcknowledgementSuccess else nil
			})
			
			return
		else
			Callback({
				isShown = true,
				type = Constants.UIStateActions.ToggleNotificationDialog,
				treatmentType = Constants.TreatmentType.PartyChatTimeoutDialog,
				endTime = DateTime.now().UnixTimestamp + Detail.timeoutDurationSeconds,
				detail = Detail
			})
		end
	end,
	onTriggerBehavioralTreatment = function(p1) --[[ Line: 60 ]]
		-- upvalues: PartyChatTimeoutReceivedSignal (copy)
		PartyChatTimeoutReceivedSignal:fire(p1.vectorTargetId)
	end,
	onTriggerEventReceived = function(p1) --[[ Line: 63 ]]
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