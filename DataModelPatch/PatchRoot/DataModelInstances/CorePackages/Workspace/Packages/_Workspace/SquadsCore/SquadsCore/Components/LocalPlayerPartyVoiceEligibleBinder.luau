local Parent = script:FindFirstAncestor("SquadsCore").Parent
local ReactModule = require(Parent.React)
local UseIsLocalPlayerPartyVoiceEligibleModule = require(script.Parent.Parent.Hooks.useIsLocalPlayerPartyVoiceEligible)
local UseIsBackgroundDMActiveFunction = require(Parent.CrossExperienceVoice).Hooks.useIsBackgroundDMActive

return function(p1)
	-- upvalues: UseIsLocalPlayerPartyVoiceEligibleModule (copy), UseIsBackgroundDMActiveFunction (copy), ReactModule (copy)
	local UseIsLocalPlayerPartyVoiceEligibleModuleResult = UseIsLocalPlayerPartyVoiceEligibleModule()
	local UseIsBackgroundDMActiveResult = UseIsBackgroundDMActiveFunction()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseIsLocalPlayerPartyVoiceEligibleModuleResult (copy), UseIsBackgroundDMActiveResult (copy)
		p1.onChange(UseIsLocalPlayerPartyVoiceEligibleModuleResult and UseIsBackgroundDMActiveResult)
	end, {
		UseIsLocalPlayerPartyVoiceEligibleModuleResult,
		UseIsBackgroundDMActiveResult
	})
	
	return nil
end