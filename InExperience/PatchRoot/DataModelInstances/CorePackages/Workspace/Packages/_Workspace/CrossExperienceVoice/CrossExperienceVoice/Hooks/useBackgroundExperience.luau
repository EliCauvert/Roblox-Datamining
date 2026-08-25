local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector

return function()
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p0)
		return if p0 and p0.Squad and p0.Squad.CrossExperienceVoice then p0.Squad.CrossExperienceVoice.Experience else nil
	end) else nil
end