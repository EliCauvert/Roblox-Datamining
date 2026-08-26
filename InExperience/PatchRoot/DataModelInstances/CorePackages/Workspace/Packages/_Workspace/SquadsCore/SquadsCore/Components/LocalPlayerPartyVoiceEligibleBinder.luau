local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local useIsLocalPlayerPartyVoiceEligibleModule = require(script.Parent.Parent.Hooks.useIsLocalPlayerPartyVoiceEligible)
local useIsBackgroundDMActive = require(parent.CrossExperienceVoice).Hooks.useIsBackgroundDMActive

return function(p1)
	-- upvalues: useIsLocalPlayerPartyVoiceEligibleModule (ref), useIsBackgroundDMActive (ref), reactModule (ref)
	local var1 = useIsLocalPlayerPartyVoiceEligibleModule()
	local var2 = useIsBackgroundDMActive()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var2 (ref)
		p1.onChange(var1 and var2)
	end, { var1, var2 })
	
	return nil
end