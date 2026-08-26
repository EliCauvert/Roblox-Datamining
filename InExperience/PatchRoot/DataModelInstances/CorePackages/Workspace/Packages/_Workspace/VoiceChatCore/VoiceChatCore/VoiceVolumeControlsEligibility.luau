local voiceChatService = game:GetService("VoiceChatService")
local voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature = game:GetEngineFeature("VoiceVolumeControlsEnableCreatorVoiceVolumeOptOut")
local voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature = game:GetEngineFeature("VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabled")

local function _(p1)
	-- upvalues: voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (ref)
	return p1 == Enum.RolloutState.Enabled or (if p1 == Enum.RolloutState.Disabled then false else voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature)
end

return {
	isCreatorVoiceVolumeControlsEnabled = function()
		-- upvalues: voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature (ref), voiceChatService (ref), voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (ref)
		if not voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature then
			return true
		end
		local enableVoiceVolumeControls = voiceChatService.EnableVoiceVolumeControls
		
		return enableVoiceVolumeControls == Enum.RolloutState.Enabled or (if enableVoiceVolumeControls == Enum.RolloutState.Disabled then false else voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature)
	end,
	isVoiceChatVolumeSliderVisible = function(p1, p2)
		-- upvalues: voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature (ref), voiceChatService (ref), voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (ref)
		local var1 = p1
		
		if var1 then
			var1 = p2
			
			if var1 then
				if voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature then
					local enableVoiceVolumeControls = voiceChatService.EnableVoiceVolumeControls
					
					return enableVoiceVolumeControls == Enum.RolloutState.Enabled or (if enableVoiceVolumeControls == Enum.RolloutState.Disabled then false else voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature)
				end
				var1 = true
			end
		end
		return var1
	end
}