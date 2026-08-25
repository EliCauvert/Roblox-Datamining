local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local useIsVoiceFocusedModule = require(crossExperienceVoice.Hooks.useIsVoiceFocused)
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function()
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useIsVoiceFocusedModule (ref), useSelector (ref), audioFocusManagementEngineFeature (ref)
	return if getFFlagEnableCrossExpVoice() then if audioFocusManagementEngineFeature and not useIsVoiceFocusedModule() then nil else useSelector(function(p0)
		if not p0 or not p0.Squad or not p0.Squad.CrossExperienceVoice then
			return nil
		end
		local activeUserIds = p0.Squad.CrossExperienceVoice.Participants.activeUserIds
		
		for i = #activeUserIds, 1, -1 do
			local var4 = p0.Squad.CrossExperienceVoice.Participants.participants[activeUserIds[i]]
			
			if not var4 or var4.isMuted then
				continue
			end
			return var4
		end
		return nil
	end) else nil
end