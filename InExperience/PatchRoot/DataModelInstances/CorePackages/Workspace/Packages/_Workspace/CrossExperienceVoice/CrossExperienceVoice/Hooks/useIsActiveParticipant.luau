local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local useIsVoiceFocusedModule = require(crossExperienceVoice.Hooks.useIsVoiceFocused)

return function(p1)
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useIsVoiceFocusedModule (ref), useSelector (ref), audioFocusManagementEngineFeature (ref)
	return if getFFlagEnableCrossExpVoice() then if audioFocusManagementEngineFeature and not useIsVoiceFocusedModule() then false else useSelector(function(p2)
		-- upvalues: p1 (ref)
		if not p2 or not p2.Squad or not p2.Squad.CrossExperienceVoice then
			return false
		elseif table.find(p2.Squad.CrossExperienceVoice.Participants.activeUserIds, p1) == nil then
			return false
		end
		local var1 = p2.Squad.CrossExperienceVoice.Participants.participants[p1]
		
		return var1 and not var1.isMuted
	end) else false
end