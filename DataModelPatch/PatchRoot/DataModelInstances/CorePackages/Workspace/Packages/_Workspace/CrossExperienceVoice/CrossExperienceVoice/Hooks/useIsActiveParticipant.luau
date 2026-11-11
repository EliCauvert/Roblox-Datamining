local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local DependenciesModule = require(CrossExperienceVoice.dependencies)
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local UseIsVoiceFocusedModule = require(CrossExperienceVoice.Hooks.useIsVoiceFocused)

return function(Value)
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseIsVoiceFocusedModule (copy), UseSelectorFunction (copy), AudioFocusManagementEngineFeature (copy)
	if GetFFlagEnableCrossExpVoiceFunction() then
		local UseIsVoiceFocusedModuleResult = UseIsVoiceFocusedModule()
		local UseSelectorResult = UseSelectorFunction(function(p1): boolean
			-- upvalues: Value (copy)
			if not p1 or not p1.Squad or not p1.Squad.CrossExperienceVoice then
				return false
			elseif table.find(p1.Squad.CrossExperienceVoice.Participants.activeUserIds, Value) == nil then
				return false
			else
				local Participant = p1.Squad.CrossExperienceVoice.Participants.participants[Value]
				
				return Participant and not Participant.isMuted
			end
		end)
		
		return (not AudioFocusManagementEngineFeature or UseIsVoiceFocusedModuleResult) and UseSelectorResult
	else
		return false
	end
end