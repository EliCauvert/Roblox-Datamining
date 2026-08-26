local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local useIsVoiceFocusedModule = require(crossExperienceVoice.Hooks.useIsVoiceFocused)
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function()
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useIsVoiceFocusedModule (ref), useSelector (ref), audioFocusManagementEngineFeature (ref)
	return if getFFlagEnableCrossExpVoice() then if audioFocusManagementEngineFeature and not useIsVoiceFocusedModule() then nil else useSelector(function(p1)
		if not p1 or not p1.Squad or not p1.Squad.CrossExperienceVoice then
			return nil
		end
		local activeUserIds = p1.Squad.CrossExperienceVoice.Participants.activeUserIds
		
		for i = #activeUserIds, 1, -1 do
			local var1 = p1.Squad.CrossExperienceVoice.Participants.participants[activeUserIds[i]]
			
			if not var1 or var1.isMuted then
				continue
			end
			return var1
		end
		return nil
	end) else nil
end