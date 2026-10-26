local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
local Constants = require(Parent.InterventionShared).Utils.Constants
local VoiceInterventionReceivedSignal = require(Parent.InterventionShared).Signals.voiceInterventionReceivedSignal
local ShowFeatureRestrictionFromRealtimeModule = require(Parent.UniversalFeatureRestrictions.showFeatureRestrictionFromRealtime)
local _ = require(InExperienceIntervention.Utils.Types)

local function isVoiceRestriction(p1): boolean
	-- upvalues: Constants (copy)
	return p1.abuseVector == Constants.AbuseVectorType.Voice and (p1.type == Constants.NotificationDialogType.ChatNudge or p1.type == Constants.NotificationDialogType.ChatTimeout)
end

local function onVoiceRestrictionAppeal() end

return {
	configName = "VoiceIntervention",
	shouldTriggerVisualTreatment = isVoiceRestriction,
	shouldTriggerBehavioralTreatment = isVoiceRestriction,
	shouldTriggerEventReceived = function(_): boolean
		return false
	end,
	onTriggerVisualTreatment = function(_, p1)
		-- upvalues: ShowFeatureRestrictionFromRealtimeModule (copy), AbuseVectorModule (copy), onVoiceRestrictionAppeal (copy)
		ShowFeatureRestrictionFromRealtimeModule(AbuseVectorModule.Voice, p1, { onAppeal = onVoiceRestrictionAppeal })
	end,
	onTriggerBehavioralTreatment = function(p1)
		-- upvalues: VoiceInterventionReceivedSignal (copy)
		VoiceInterventionReceivedSignal:fire(p1)
	end,
	onTriggerEventReceived = function(_) end
}