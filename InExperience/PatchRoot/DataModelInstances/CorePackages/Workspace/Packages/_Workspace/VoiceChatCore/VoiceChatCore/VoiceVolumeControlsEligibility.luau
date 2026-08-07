local voiceChatService = game:GetService("VoiceChatService")
local voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature = game:GetEngineFeature("VoiceVolumeControlsEnableCreatorVoiceVolumeOptOut")
local voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature = game:GetEngineFeature("VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabled")

local function _(p0) --[[ line: 10 | named "resolveEnableVoiceVolumeControls" ]]
	-- upvalues: voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (ref)
	return p0 == Enum.RolloutState.Enabled or (if p0 == Enum.RolloutState.Disabled then false else voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature)
end

return {
	isCreatorVoiceVolumeControlsEnabled = function() --[[ line: 20 ]]
		-- upvalues: voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature (ref), voiceChatService (ref), voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (ref)
		if not voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature then
			return true
		end
		local enableVoiceVolumeControls = voiceChatService.EnableVoiceVolumeControls
		
		return enableVoiceVolumeControls == Enum.RolloutState.Enabled or (if enableVoiceVolumeControls == Enum.RolloutState.Disabled then false else voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature)
	end,
	isVoiceChatVolumeSliderVisible = function(p1, p2) --[[ line: 28 ]]
		-- upvalues: voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature (ref), voiceChatService (ref), voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (ref)
		local var3 = p1
		
		if var3 then
			var3 = p2
			
			if var3 then
				if voiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature then
					local enableVoiceVolumeControls = voiceChatService.EnableVoiceVolumeControls
					
					return enableVoiceVolumeControls == Enum.RolloutState.Enabled or (if enableVoiceVolumeControls == Enum.RolloutState.Disabled then false else voiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature)
				end
				var3 = true
			end
		end
		return var3
	end
}