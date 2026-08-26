local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p1)
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p2)
		-- upvalues: p1 (ref)
		if not p2 or not p2.Squad or not p2.Squad.CrossExperienceVoice then
			return nil
		end
		local var1 = p2.Squad.CrossExperienceVoice.Participants.participants[p1]
		
		return if var1 then var1.isMuted else nil
	end) else nil
end