local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local useIsVoiceFocusedModule = require(crossExperienceVoice.Hooks.useIsVoiceFocused)

return function(p0) --[[ line: 11 ]]
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useIsVoiceFocusedModule (ref), useSelector (ref), audioFocusManagementEngineFeature (ref)
	return if getFFlagEnableCrossExpVoice() then if audioFocusManagementEngineFeature and not useIsVoiceFocusedModule() then false else useSelector(function(p1) --[[ line: 16 ]]
		-- upvalues: p0 (ref)
		if not p1 or not p1.Squad or not p1.Squad.CrossExperienceVoice then
			return false
		elseif table.find(p1.Squad.CrossExperienceVoice.Participants.activeUserIds, p0) == nil then
			return false
		end
		local var4 = p1.Squad.CrossExperienceVoice.Participants.participants[p0]
		
		return var4 and not var4.isMuted
	end) else false
end