local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local DependenciesModule = require(CrossExperienceVoice.dependencies)
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local UseIsVoiceFocusedModule = require(CrossExperienceVoice.Hooks.useIsVoiceFocused)
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function()
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseIsVoiceFocusedModule (copy), UseSelectorFunction (copy), AudioFocusManagementEngineFeature (copy)
	if GetFFlagEnableCrossExpVoiceFunction() then
		local UseIsVoiceFocusedModuleResult = UseIsVoiceFocusedModule()
		local UseSelectorResult = UseSelectorFunction(function(p1)
			if not p1 or not p1.Squad or not p1.Squad.CrossExperienceVoice then
				return nil
			end
			local ActiveUserIds = p1.Squad.CrossExperienceVoice.Participants.activeUserIds
			local Participant = nil
			
			for i = #ActiveUserIds, 1, -1 do
				Participant = p1.Squad.CrossExperienceVoice.Participants.participants[ActiveUserIds[i]]
				
				if Participant and not Participant.isMuted then
					return Participant
				end
			end
			return nil
		end)
		
		return if AudioFocusManagementEngineFeature and not UseIsVoiceFocusedModuleResult then nil else UseSelectorResult
	else
		return nil
	end
end