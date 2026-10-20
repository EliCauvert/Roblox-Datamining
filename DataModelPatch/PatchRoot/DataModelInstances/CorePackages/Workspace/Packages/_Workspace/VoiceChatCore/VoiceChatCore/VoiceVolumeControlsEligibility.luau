local VoiceChatService = game:GetService("VoiceChatService")
local VoiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature = game:GetEngineFeature("VoiceVolumeControlsEnableCreatorVoiceVolumeOptOut")
local VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature = game:GetEngineFeature("VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabled")

local function _(RolloutState)
	-- upvalues: VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (copy)
	return RolloutState == Enum.RolloutState.Enabled or RolloutState ~= Enum.RolloutState.Disabled and VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature
end

return {
	isCreatorVoiceVolumeControlsEnabled = function()
		-- upvalues: VoiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature (copy), VoiceChatService (copy), VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (copy)
		if VoiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature then
			local EnableVoiceVolumeControls = VoiceChatService.EnableVoiceVolumeControls
			
			return EnableVoiceVolumeControls == Enum.RolloutState.Enabled or EnableVoiceVolumeControls ~= Enum.RolloutState.Disabled and VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature
		else
			return true
		end
	end,
	isVoiceChatVolumeSliderVisible = function(p1, p2)
		-- upvalues: VoiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature (copy), VoiceChatService (copy), VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature (copy)
		local Flag: boolean = p1
		
		if Flag then
			Flag = p2
			
			if Flag then
				if VoiceVolumeControlsEnableCreatorVoiceVolumeOptOutEngineFeature then
					local EnableVoiceVolumeControls = VoiceChatService.EnableVoiceVolumeControls
					
					return EnableVoiceVolumeControls == Enum.RolloutState.Enabled or EnableVoiceVolumeControls ~= Enum.RolloutState.Disabled and VoiceVolumeControlsCreatorVoiceVolumeOptOutDefaultBehaviorIsEnabledEngineFeature
				end
				Flag = true
			end
		end
		return Flag
	end
}