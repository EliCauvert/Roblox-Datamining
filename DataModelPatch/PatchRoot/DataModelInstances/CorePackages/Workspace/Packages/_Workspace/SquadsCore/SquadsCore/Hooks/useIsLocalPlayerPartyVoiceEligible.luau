local UseSelectorFunction = require(script:FindFirstAncestor("SquadsCore").Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseIsUserPartyVoiceEligibleModule = require(script.Parent.useIsUserPartyVoiceEligible)

function useIsLocalPlayerPartyVoiceEligible()
	-- upvalues: UseSelectorFunction (copy), UseIsUserPartyVoiceEligibleModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1): number
		return p1 and p1.LocalUserId and tonumber(p1.LocalUserId) or 0
	end)
	
	return UseIsUserPartyVoiceEligibleModule(UseSelectorResult), UseSelectorResult == 0
end

return useIsLocalPlayerPartyVoiceEligible