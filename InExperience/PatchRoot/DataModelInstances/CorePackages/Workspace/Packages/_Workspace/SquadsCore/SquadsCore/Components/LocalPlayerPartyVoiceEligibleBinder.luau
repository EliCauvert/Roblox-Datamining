local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local useIsLocalPlayerPartyVoiceEligibleModule = require(script.Parent.Parent.Hooks.useIsLocalPlayerPartyVoiceEligible)
local useIsBackgroundDMActive = require(parent.CrossExperienceVoice).Hooks.useIsBackgroundDMActive

return function(p0)
	-- upvalues: useIsLocalPlayerPartyVoiceEligibleModule (ref), useIsBackgroundDMActive (ref), reactModule (ref)
	local var2 = useIsLocalPlayerPartyVoiceEligibleModule()
	local var3 = useIsBackgroundDMActive()
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var2 (ref), var3 (ref)
		p0.onChange(var2 and var3)
	end, { var2, var3 })
	
	return nil
end