local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector

return function()
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p1)
		return if p1 and p1.Squad and p1.Squad.CrossExperienceVoice then p1.Squad.CrossExperienceVoice.Experience else nil
	end) else nil
end