local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p0) --[[ line: 8 ]]
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p1) --[[ line: 12 ]]
		-- upvalues: p0 (ref)
		if not p1 or not p1.Squad or not p1.Squad.CrossExperienceVoice then
			return nil
		end
		local var1 = p1.Squad.CrossExperienceVoice.Participants.participants[p0]
		
		return if var1 then var1.isMuted else nil
	end) else nil
end